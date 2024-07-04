import "package:crud_app2_edit/ui/beranda.dart";
import "package:flutter/material.dart";
import "../ui/login.dart";
import "../ui/halaman_karyawan.dart";
import "../ui/halaman_absensi.dart";

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super (key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          //Image(image: AssetImage('../assets/images/logo_selda.png'),),
          ListTile(
              leading: Icon(Icons.home),
              title: Text("Beranda"),
              onTap: () {
                Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Beranda()));
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Data Karyawan"),
              onTap: () {
                Navigator.push(
                  context, MaterialPageRoute(builder: (context) => halaman_karyawan()));
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Data Absensi"),
              onTap: () {
                Navigator.push(
                  context, MaterialPageRoute(builder: (context) => halaman_absensi()));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout_rounded),
              title: Text("Keluar"),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context, MaterialPageRoute(builder: (context) => Login()),
                  (Route<dynamic> route) => false);
              },
            ),

        ],
      ),
    );
  }
}