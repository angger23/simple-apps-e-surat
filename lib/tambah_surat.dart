import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:aplikasi_surat/koneksi.dart';

class TambahSurat extends StatefulWidget {

  final VoidCallback reloadData;

  TambahSurat({this.reloadData});

  @override
  _TambahSuratState createState() => _TambahSuratState();
}

class _TambahSuratState extends State<TambahSurat> {

  TextEditingController nama_surat = TextEditingController();
  TextEditingController nomor_surat = TextEditingController();
  TextEditingController nomor_rak = TextEditingController();

  String jenis_surat;

  bool loading = false;

  TambahData()async{
    setState(() {
      loading = true;
    });

    String hasil = await Koneksi.koneksi.AddSurat(nama_surat.text,jenis_surat,nomor_rak.text,nomor_surat.text);

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
            controller: nama_surat,
            decoration: new InputDecoration(
              labelText: "Nama Surat / Perihal",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(1.0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          DropdownButton(
            hint: Text("Pilih Jenis Surat"),
            isExpanded: true,
            items: [
              DropdownMenuItem(
                child: Text("Surat Masuk"),
                value: "Surat Masuk",
              ),
              DropdownMenuItem(
                child: Text("Surat Keluar"),
                value: "Surat Keluar",
              )
            ],
            value: jenis_surat,
            onChanged: (nilai){
              setState(() {
                jenis_surat = nilai;
              });
            },
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          TextField(
            controller: nomor_surat,
            decoration: new InputDecoration(
              labelText: "Nomor Surat",
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
            controller: nomor_rak,
            decoration: new InputDecoration(
              labelText: "Nomor Rak Surat",
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