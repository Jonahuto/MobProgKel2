import 'package:crud_app2_edit/service/karyawan_service.dart';
import 'package:flutter/material.dart';
import '../model/karyawan.dart';
import 'karyawan_update_form.dart';
import 'halaman_karyawan.dart';

class KaryawanDetail extends StatefulWidget {
  final Karyawan karyawan;

  const KaryawanDetail({Key? key, required this.karyawan}) : super(key: key);
  State<KaryawanDetail> createState() => _KaryawanDetailState();
}

class _KaryawanDetailState extends State<KaryawanDetail> {
  Stream<Karyawan> getData() async* {
    Karyawan data = await KaryawanService().getById(widget.karyawan.id.toString());
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Karyawan")),
      body: StreamBuilder(
        stream: getData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return Text('Data Tidak Ditemukan');
          }
          return Column(
            children: [
              
              SizedBox(height: 20),
              Text(
                "Nama Lengkap : ${snapshot.data.namaKaryawan}",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Text(
                "NIP : ${snapshot.data.nip}",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Text(
                "Tanggal Lahir : ${snapshot.data.tgllahir}",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [_tombolUbah(),
                //_tombolhome(), 
                _tombolHapus()],
              )
            ],
          );
        },
      ),
    );
  }

  _tombolUbah() {
    return StreamBuilder(
        stream: getData(),
        builder: (context, AsyncSnapshot snapshot) => ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          KaryawanUpdateForm(karyawan: snapshot.data)));
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green, ),
            child: const Text("Ubah",style: TextStyle(color: Colors.white),)));
  }
  // _tombolhome(){
  //   return ElevatedButton(
  //     onPressed: () {
  //       Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => halaman_karyawan()));
  //     },
  //     style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
  //     child: const Text("Kembali",style: TextStyle(color: Colors.black),),
  //   );
  
  // }

  _tombolHapus() {
    return ElevatedButton(
        onPressed: () {
          AlertDialog alertDialog = AlertDialog(
            content: const Text("Yakin ingin menghapus data ini?"),
            actions: [
              StreamBuilder(
                  stream: getData(),
                  builder: (context, AsyncSnapshot snapshot) => ElevatedButton(
                        onPressed: () async {
                          await KaryawanService()
                              .hapus(snapshot.data)
                              .then((value) {
                            Navigator.pop(context);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => halaman_karyawan()));
                          });
                        },
                        child: const Text("YA",style: TextStyle(color: Colors.white),),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                      )),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Tidak",style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              )
            ],
          );
          showDialog(context: context, builder: (context) => alertDialog);
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        child: const Text("Hapus",style: TextStyle(color: Colors.white),));
  }
}
