import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:aplikasi_surat/koneksi.dart';

class EditPegawai extends StatefulWidget {

  final VoidCallback reloadData;
  final idDocument;
  final nip;
  final nama;
  final password;

  EditPegawai({this.reloadData,this.idDocument,this.nip,this.nama,this.password});

  @override
  _EditPegawaiState createState() => _EditPegawaiState();
}

class _EditPegawaiState extends State<EditPegawai> {

  TextEditingController nip = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController password = TextEditingController();

  bool loading = false;

  EditData(){
    setState(() {
      loading  = true;
    });
    Koneksi.koneksi.UpdateUser(widget.idDocument,nip.text,nama.text,password.text).then((_){
      setState(() {
        loading = false;
      });
      widget.reloadData();
      Navigator.pop(context);
    });
  }

  HapusData(String idDocument){
    setState(() {
      loading  = true;
    });

    Koneksi.koneksi.HapusUser(idDocument).then((_){
      widget.reloadData();
      Navigator.pop(context);
    });
  }

  @override
  void initState() {
    super.initState();
    nip.text = widget.nip;
    nama.text = widget.nama;
    password.text = widget.password;
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
                  EditData();
                },
                child: new Text("Update Data"),
              ),
              RaisedButton(
                padding: const EdgeInsets.all(8.0),
                textColor: Colors.white,
                color: Colors.red,
                onPressed: (){
                  HapusData(widget.idDocument);
//                  Navigator.pop(context);
                },
                child: new Text("Hapus Data"),
              ),

            ],
          ),
        ],
      ),
    );
  }
}