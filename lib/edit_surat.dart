import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:aplikasi_surat/koneksi.dart';

class EditSurat extends StatefulWidget {

  final VoidCallback reloadData;
  final idDocument;
  final nama_surat;
  final jenis_suratx;
  final nomor_surat;
  final nomor_rak;

  EditSurat({this.reloadData,this.idDocument,this.nama_surat,this.jenis_suratx,this.nomor_surat,this.nomor_rak});

  @override
  _EditSuratState createState() => _EditSuratState();
}

class _EditSuratState extends State<EditSurat> {

  TextEditingController nama_surat = TextEditingController();
  TextEditingController nomor_surat = TextEditingController();
  TextEditingController nomor_rak = TextEditingController();

  String jenis_surat;

  bool loading = false;

  EditData(){
    setState(() {
      loading  = true;
    });
    Koneksi.koneksi.UpdateSurat(widget.idDocument,nama_surat.text,jenis_surat,nomor_rak.text,nomor_surat.text).then((_){
      setState(() {
        loading = false;
      });
      widget.reloadData();
      Navigator.pop(context);
    });
  }

  @override
  void initState() {
    super.initState();
    nama_surat.text = widget.nama_surat;
    jenis_surat = widget.jenis_suratx;
    nomor_surat.text = widget.nomor_surat;
    nomor_rak.text = widget.nomor_rak;
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
                  EditData();
                },
                child: new Text("Update Data"),
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