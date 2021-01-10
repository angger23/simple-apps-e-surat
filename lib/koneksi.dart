import 'package:cloud_firestore/cloud_firestore.dart';

class Koneksi{
  static Koneksi koneksi = Koneksi();


  //deklarasi config data
  CollectionReference db = Firestore.instance.collection('pegawai');
  CollectionReference db1 = Firestore.instance.collection('surat');

  Future<List<DocumentSnapshot>> GetPegawai()async{
    QuerySnapshot result = await db.getDocuments();
    return result.documents;
  }

  Future<List<DocumentSnapshot>> GetSurat()async{
    QuerySnapshot result = await db1.getDocuments();
    return result.documents;
  }

  Future<String> AddUser(String nip,String nama,String password)async{
    Map<String , dynamic> data = {
      "nip": nip,
      "username": nama,
      "password": password,
    };
    DocumentReference dokumen = await db.add(data);
    return dokumen.documentID;
  }

  Future UpdateUser(String id,String nip,String nama,String password)async{
    Map<String , dynamic> data = {
      "nip": nip,
      "username": nama,
      "password": password,
    };
    await db.document(id).updateData(data);
  }

  Future HapusUser(String id)async{
    await db.document(id).delete();
  }

  Future<String> AddSurat(String nama_surat,String jenis_surat,String nomor_rak,String nomor_surat)async{
    Map<String , dynamic> data = {
      "judul_surat": nama_surat,
      "jenis_surat": jenis_surat,
      "nomor_rak": nomor_rak,
      "nomor_surat": nomor_surat,
    };
    DocumentReference dokumen = await db1.add(data);
    return dokumen.documentID;
  }

  Future UpdateSurat(String id,String nama_surat,String jenis_surat,String nomor_rak,String nomor_surat)async{
    Map<String , dynamic> data = {
      "judul_surat": nama_surat,
      "jenis_surat": jenis_surat,
      "nomor_rak": nomor_rak,
      "nomor_surat": nomor_surat,
    };
    await db1.document(id).updateData(data);
  }

  Future HapusSurat(String id)async{
    await db1.document(id).delete();
  }

}