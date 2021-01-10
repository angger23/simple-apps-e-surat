import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:aplikasi_surat/koneksi.dart';
import 'package:aplikasi_surat/tambah_pegawai.dart';
import 'package:aplikasi_surat/edit_pegawai.dart';

class DataUser extends StatefulWidget {
  DataUser();

  @override
  _DataUserState createState() => _DataUserState();
}

class _DataUserState extends State<DataUser> {

  bool loading = false;
  List<DocumentSnapshot> dataUser = List();

  DataPegawai()async{
    setState(() {
      loading  = true;
    });
    dataUser = await Koneksi.koneksi.GetPegawai();
    setState(() {
      loading = false;
    });
  }

  @override
  void initState(){
    super.initState();
    DataPegawai();
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
      body: Container(
        padding: EdgeInsets.all(10),
        child: Container(
//              width: 200,
          height: 700,
          width: MediaQuery.of(context).size.width,
//          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: SizedBox(
//                      height: 250.0,
                  child: loading ? Center(child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent[400]),
                  ),) :
                  ListView.builder(
                    itemCount: dataUser.length,
                    itemBuilder: (context, i){
                      final number = i+1;
                      final item = dataUser[i];
                      return Container(
                        padding: EdgeInsets.all(10),
                        child: Card(
                          child: ListTile(
                            leading: Icon(
                              Icons.person_outline,
                              size: 30,
                            ),
                            title: Text(item.data['username']),
                            trailing: IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditPegawai(
                                            reloadData:DataPegawai,
                                            idDocument:item.documentID,
                                            nip:item.data['nip'],
                                            nama:item.data['username'],
                                            password:item.data['password']
                                        )
                                    )
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Tambahuser(
                    reloadData:DataPegawai,
                  )
              )
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent[400],
      ),
    );
  }
}