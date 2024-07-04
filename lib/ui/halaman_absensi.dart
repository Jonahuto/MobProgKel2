import 'package:flutter/material.dart';
import '../model/karyawan.dart';
import '../service/karyawan_service.dart';
import '../widget/sidebar.dart';
import 'absensi_item.dart';

class halaman_absensi extends StatefulWidget {
  const halaman_absensi({super.key});
  @override
  _halaman_absensiState createState() => _halaman_absensiState();
}

class _halaman_absensiState extends State<halaman_absensi> {
  Stream<List<Karyawan>> getList() async* {
    List<Karyawan> data = await KaryawanService().listData();
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: const Text("Data Absensi"),
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
              return AbsensiItem(karyawan: snapshot.data[index]);
            },
          );
        },
      ),
    );
  }
}
