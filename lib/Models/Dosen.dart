import 'dart:ffi';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open route'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondRoute()),
            );
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Route"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}

class Dosen {
  final String email;
  final String jabatan;
  final String nama;
  final String pendidikan;
  final String ttl;
  final String documentId;
  final String photo;
  // News(this.deskripsi, this.image, this.judul, this.tanggal, this.documentId);
  Dosen(
      {required this.email,
      required this.jabatan,
      required this.nama,
      required this.pendidikan,
      required this.ttl,
      required this.documentId,
      required this.photo});

  static Dosen? fromMap(Map<String, dynamic> map, String documentId) {
    // ignore: unnecessary_null_comparison
    if (map == null) return null;
    var temp = Dosen(
        email: map["Email"],
        jabatan: map["Jabatan"],
        nama: map["Nama Dosen"],
        pendidikan: map["Pendidikan"],
        ttl: map["TTL"],
        documentId: documentId,
        photo: map["Photo"]);
    return temp;
  }

  // String formatTimestamp() {
  //   DateTime date = DateTime.fromMillisecondsSinceEpoch(tanggal.seconds * 1000);
  //   date.toLocal();
  //   String formattedDate = DateFormat('dd MMMM yyyy').format(date);
  //
  //   return formattedDate;
  // }
}
