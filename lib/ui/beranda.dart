// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import "package:flutter/material.dart";
import '../widget/sidebar.dart';
import "package:intl/intl.dart";

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('kk:mm:ss').format(now);
    String formattedDate = DateFormat('d MMMM y').format(now);

  
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
      title: Text("Beranda"),
    ),
    body:
     Column(
      children: [
        Align(alignment: Alignment.center,),
        Image(image: AssetImage('assets/images/logo_selda.png'),
          width: 300,),
          Text("Selamat Datang Di Website Selda",
          style: TextStyle(fontSize: 20),),
          Text(formattedTime,),
          Text(formattedDate)
      ],
    
    )
    );
  }
}