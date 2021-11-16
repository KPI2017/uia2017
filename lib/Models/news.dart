import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class News {
  final String deskripsi;
  final String image;
  final String judul;
  final Timestamp tanggal;
  final String documentId;
  final List? imageCollections;

  // News(this.deskripsi, this.image, this.judul, this.tanggal, this.documentId);
  News(
      {required this.deskripsi,
      required this.judul,
      required this.image,
      required this.tanggal,
      required this.documentId,
      required this.imageCollections});

  static News? fromMap(Map<String, dynamic> map, String documentId) {
    // ignore: unnecessary_null_comparison
    if (map == null) return null;
    var temp = News(
        deskripsi: map["Deskripsi"],
        judul: map["Judul"],
        image: map["Images"],
        tanggal: map["Tanggal"],
        documentId: documentId,
        imageCollections: map["ImageCollections"]);
    return temp;
  }

  String formatTimestamp() {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(tanggal.seconds * 1000);
    date.toLocal();
    String formattedDate = DateFormat('dd MMMM yyyy').format(date);

    return formattedDate;
  }
}
