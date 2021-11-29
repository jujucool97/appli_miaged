import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class haut extends StatefulWidget {
  const haut({Key? key}) : super(key: key);

  @override
  _hautState createState() => _hautState();
}

class _hautState extends State<haut> {

  /*Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> GetData() async {
    QuerySnapshot<Map<String, dynamic>> res =
    await FirebaseFirestore.instance.collection('habits').get();
    var clothes = res.docs;
    print('clothes : ');
    clothes.forEach((clothe) => {print(clothe['titre'])});
    return clothes;
  }

  Stream<List<Habits>> get habits {
    Query queryCars = _habits.orderBy('carTimestamp', descending: true);
    return queryCars.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Habits(
          url: doc.get('image'),
          nom : doc.get('nom'),
          taille : doc.get('taille'),
        );
      }).toList();
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('test habits'),
      ),
    );
  }
}

class Habits {
  String? nom, taille, url;
  Habits(
      {this.nom,
        this.url,
        this.taille});
}
