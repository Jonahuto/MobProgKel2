import 'package:crud_app2_edit/ui/karyawan_detail.dart';
import 'package:flutter/material.dart';
import '../model/karyawan.dart';


class KaryawanItem extends StatelessWidget {
  final Karyawan karyawan;

  const KaryawanItem({super.key, required this.karyawan});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Card(
          child: ListTile(
            title: Text("${karyawan.namaKaryawan}"),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => KaryawanDetail(karyawan: karyawan)));
        });
  }
}
  