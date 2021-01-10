import 'package:flutter/material.dart';
import 'package:aplikasi_surat/data_user.dart';
import 'package:aplikasi_surat/data_transaksi.dart';
import 'package:aplikasi_surat/data_agenda.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Homepage extends StatefulWidget {
  final userx;
  final passx;
  final levelx;
  final login_berhasil;
//
  Homepage({this.userx,this.passx,this.levelx,this.login_berhasil});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String level;
  Logout(){
//    widget.login_berhasil = false;
    Navigator.of(context).popUntil((route) => route.isFirst);
//    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => MyHomePage()));
  }


  Widget isAdmin(){
    if(widget.userx == 'admin'){
      return Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(50),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.lightBlue[400],
            ),
            child: Column(
              children: <Widget>[
                Text("Aplikasi Surat Menyurat",
                  textAlign: TextAlign.center,
                  style:
                  TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w600
                  ),),
                Text("Selamat Datang, anda login sebagai admin",
                  textAlign: TextAlign.center,
                  style:
                  TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600
                  ),)

              ],
            ),
          ),
          Column(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(15),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
//            width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 200),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.orange[300],
                  ),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DataAgenda(
//                              reloadData:DataPulsa,
                              )
                          )
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.bookmark,
                          size: 70,
                          color: Colors.white,
                        ),
                        Container(
                          child: Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text("Agenda",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
//            width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green[300],
                  ),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DataTransaksi(
//                              reloadData:DataPulsa,
                              )
                          )
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.compare_arrows,
                          size: 70,
                          color: Colors.white,
                        ),
                        Container(
                          child: Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text("Transaksi",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 150,
                    height: 150,
//            width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 20,bottom: 40),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue[400],
                    ),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DataUser(
//                                      reloadData:DataPulsa,
                                )
                            )
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.add,
                            size: 70,
                            color: Colors.white,
                          ),
                          Container(
                            child: Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text("Add User",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 150,
//            width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top:20,bottom: 40),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.redAccent[400],
                    ),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onPressed: (){
                        Logout();
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.power_settings_new,
                            size: 70,
                            color: Colors.white,
                          ),
                          Container(
                            child: Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text("Logout",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

        ],
      );
    }else{
      return Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(50),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.lightBlue[400],
            ),
            child: Column(
              children: <Widget>[
                Text("Aplikasi Surat Menyurat",
                  textAlign: TextAlign.center,
                  style:
                  TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w600
                  ),),
                Text("Selamat Datang, anda login sebagai Guru / Staff",
                  textAlign: TextAlign.center,
                  style:
                  TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600
                  ),)

              ],
            ),
          ),
          Column(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(15),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
//            width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 200),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.orange[300],
                  ),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DataAgenda(
//                              reloadData:DataPulsa,
                              )
                          )
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.bookmark,
                          size: 70,
                          color: Colors.white,
                        ),
                        Container(
                          child: Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text("Agenda",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
//            width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.redAccent,
                  ),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: (){
                      Logout();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.power_settings_new,
                          size: 70,
                          color: Colors.white,
                        ),
                        Container(
                          child: Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text("Logout",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    }
  }
//  @override
//  void initState() {
//    super.initState();
//    CekUser();
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[400],
      body: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
          isAdmin(),
        ],
      ),
    );
  }
}