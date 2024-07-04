import 'package:crud_app2_edit/UI/karyawan_item.dart';
import 'package:flutter/material.dart';
import '../model/karyawan.dart';
import '../service/karyawan_service.dart';
import 'karyawan_form.dart';
import '../widget/sidebar.dart';

class halaman_karyawan extends StatefulWidget {
  const halaman_karyawan({super.key});
  @override
  _halaman_karyawanState createState() => _halaman_karyawanState();
}

class _halaman_karyawanState extends State<halaman_karyawan> {
  Stream<List<Karyawan>> getList() async* {
    List<Karyawan> data = await KaryawanService().listData();
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: const Text("Data Karyawan"),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () {
              Navigator.push(
                context, MaterialPageRoute(builder:(context) => const KaryawanForm()));
            },
          )
        ],
      ),
      body: StreamBuilder(
        stream: getList(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData &&
          snapshot.connectionState == ConnectionState.done) {
            return const Text('Data Kosong');
          }
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index){
              return KaryawanItem(karyawan: snapshot.data[index]);
            },
          );
        },
      ),
    );
  }
}
