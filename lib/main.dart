import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:aplikasi_surat/homepage.dart';
import 'package:intl/intl.dart';
import 'package:progress_dialog/progress_dialog.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Surat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ProgressDialog pr;

  Future<void> Notif() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pemberitahuan'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Username atau password anda salah !'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop('OK');
              },
            ),
          ],
        );
      },
    );
  }

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  bool loading = false;

  String user;
  String pass;
  int level;
  var login_berhasil=false;
  CollectionReference db = Firestore.instance.collection('pegawai');

  LoginNow()async{
    pr.show();
    QuerySnapshot result = await db
        .where('username', isEqualTo: username.text)
        .where('password', isEqualTo: password.text)
        .limit(1)
        .getDocuments();
//    List<DocumentSnapshot> documents = result.documents;
    if(result.documents.length == 1) {
      if(username.text == 'admin'){
        login_berhasil = true;
        user = username.text;
        pass = password.text;
        level=1;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Homepage(
                    userx: user,
                    passx: pass,
                    levelx: level,
                    login_berhasil: login_berhasil
                )
            )
        );
      }else {
        login_berhasil = true;
        user = username.text;
        pass = password.text;
        level = 2;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Homepage(
                    userx: user,
                    passx: pass,
                    levelx: level,
                    login_berhasil: login_berhasil
                )
            )
        );
      }
    }else{
      login_berhasil = false;
      Notif();
    }
    setState(() {});
  }



  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context,type: ProgressDialogType.Normal, isDismissible: true, showLogs: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[400],
        iconTheme: new IconThemeData(color: Colors.white),
        title: Text('E-Surat',style: TextStyle(
          color: Colors.white,
        )),
      ),
      backgroundColor: Colors.lightBlue[400],
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
//                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(image: AssetImage('Assets/Mail-512.png'),width: 150,),
                      Container(height: 12.0),
                      Text('E-Surat',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      Container(height: 10,),
                      Text('LOGIN',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      Container(height: 30.0),
                      TextField(
                        controller: username,
                        obscureText: false,
                        style: TextStyle(fontSize: 20.0),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          hintText: "Username",
                        ),
                      ),
                      Container(height: 25.0),
                      TextField(
                        controller: password,
                        obscureText: true,
                        style: TextStyle(fontSize: 20.0),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          hintText: "Password",
                        ),
                      ),
                      Container(
                        height: 35.0,
                      ),
                      Container(
                        height: 35.0,
                      ),
                      Material(
                        elevation: 5.0,
                        color: Colors.lightBlue[400],
                        child: MaterialButton(
                          minWidth: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          onPressed: () {
                            LoginNow();
                          },
                          child: Text("Login",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0).copyWith(
                                  color: Colors.white, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Container(
                        height: 15.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
