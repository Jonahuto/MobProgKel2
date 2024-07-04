// ignore_for_file: unnecessary_new

import 'package:crud_app2_edit/service/karyawan_service.dart';
import 'package:flutter/material.dart';
import 'karyawan_detail.dart';
import '../model/karyawan.dart';
import 'package:intl/intl.dart';

class KaryawanForm extends StatefulWidget {
  const KaryawanForm({Key? key}) : super(key: key);
  _KaryawanFormState createState() => _KaryawanFormState();
  }

class _KaryawanFormState extends State<KaryawanForm> {
  
  final _formKey = GlobalKey<FormState>();
  final _namaCtrl = TextEditingController();
  final _nipCtrl = TextEditingController();
  final _tgllahirCtrl = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Karyawan")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [_fieldNama(),_fieldnip(),_fieldtgllahir(), SizedBox(height: 20), _tombolSimpan()],
          ),
        ),
      ),
    );
  }
  _fieldNama() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Karyawan"),
      controller: _namaCtrl,
    );
  }
  _fieldnip() {
    return TextField(
      decoration: const InputDecoration(labelText: "NIP"),
      controller: _nipCtrl,
    );
  }
  _fieldtgllahir() {
    return TextField(
      decoration: const InputDecoration(labelText: "Tanggal Lahir"),
      controller: _tgllahirCtrl,
      onTap: (){
        _selectDate();
      }
    );
  }
    Future<void> _selectDate() async {
        DateTime? _picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1000),
          lastDate: DateTime(2100),
        ); 
        if (_picked != null) {
          setState((){
            _tgllahirCtrl.text = _picked.toString().split(" ")[0];
          });
        }
      }

     _tombolSimpan() {
      return ElevatedButton(
        onPressed: () async {
          Karyawan karyawan = new Karyawan(namaKaryawan: _namaCtrl.text, nip: _nipCtrl.text, tgllahir:_tgllahirCtrl.text,tanggal:"", jammasuk: "", jamkeluar: "");
          await KaryawanService().Simpan(karyawan).then((value) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => KaryawanDetail(karyawan: value)));
                });
                },
                child: const Text("Simpan"));



}
  
}