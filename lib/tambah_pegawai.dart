import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:aplikasi_surat/koneksi.dart';

class Tambahuser extends StatefulWidget {

  final VoidCallback reloadData;

  Tambahuser({this.reloadData});

  @override
  _TambahuserState createState() => _TambahuserState();
}

class _TambahuserState extends State<Tambahuser> {

  TextEditingController nip = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController password = TextEditingController();

  bool loading = false;

  TambahData()async{
    setState(() {
      loading = true;
    });

    String hasil = await Koneksi.koneksi.AddUser(nip.text,nama.text,password.text);

    setState(() {
      loading = false;
    });
    print(hasil);
    widget.reloadData();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.white),
        title: Text('Data Pegawai',style: TextStyle(
          color: Colors.white,
        )),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          TextField(
            controller: nip,
            decoration: new InputDecoration(
              labelText: "NUPTK / NIP",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(1.0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          TextField(
            controller: nama,
            decoration: new InputDecoration(
              labelText: "Nama",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(1.0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          TextField(
            controller: password,
            decoration: new InputDecoration(
              labelText: "Password",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(1.0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              RaisedButton(
                padding: const EdgeInsets.all(8.0),
                textColor: Colors.white,
                color: Colors.blueAccent[400],
                onPressed: (){
                  TambahData();
                },
                child: new Text("Tambah Data"),
              ),
              RaisedButton(
                padding: const EdgeInsets.all(8.0),
                textColor: Colors.white,
                color: Colors.red,
                onPressed: (){
                  Navigator.pop(context);
                },
                child: new Text("Batal"),
              ),

            ],
          ),
        ],
      ),
    );
  }
}