import "package:crud_app2_edit/service/karyawan_service.dart";
import "package:flutter/material.dart";
import "../model/karyawan.dart";
import 'karyawan_detail.dart';
import 'package:intl/intl.dart';

class KaryawanUpdateForm extends StatefulWidget {
  final Karyawan karyawan;

  const KaryawanUpdateForm({Key? key, required this.karyawan}) : super(key: key);
  _KaryawanUpdateFormState createState() => _KaryawanUpdateFormState();
}

class _KaryawanUpdateFormState extends State<KaryawanUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaCtrl = TextEditingController();
  final _nipCtrl = TextEditingController();
  TextEditingController _tgllahirCtrl = TextEditingController();
  final _tanggalCtrl = TextEditingController();
  final _jam_masukCtrl = TextEditingController();
  final _jam_keluarCtrl = TextEditingController();

  Future<Karyawan> getData() async {
    Karyawan data = await KaryawanService().getById(widget.karyawan.id.toString());
    setState(() {
      _namaCtrl.text = data.namaKaryawan;
      _nipCtrl.text = data.nip;
      _tgllahirCtrl.text = data.tgllahir;
      _tanggalCtrl.text = data.tanggal;
      _jam_masukCtrl.text = data.jammasuk;
      _jam_keluarCtrl.text = data.jamkeluar;
      
      
    });
    return data;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Data")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: 
            [_fieldNama(),_fieldnip(),_fieldtgllahir(),SizedBox(height: 20), _tombolSimpan()],
            
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
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1000),
      lastDate: DateTime(2100),
    );
  }


  _tombolSimpan() {
    return ElevatedButton(
        onPressed: () async {
          getData();
          Karyawan karyawan = new Karyawan(namaKaryawan: _namaCtrl.text,nip: _nipCtrl.text,tgllahir: _tgllahirCtrl.text,tanggal: _tanggalCtrl.text,jammasuk: _jam_masukCtrl.text,jamkeluar: _jam_keluarCtrl.text);
          String id = widget.karyawan.id.toString();
          await KaryawanService().Ubah(karyawan, id).then((value) {
            Navigator.pop(context);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => KaryawanDetail(karyawan: value)));
          });
        },
        child: const Text("Simpan Perubahan"));
  }
}
