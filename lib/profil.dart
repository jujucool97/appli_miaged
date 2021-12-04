import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:miaged/boutique.dart';
import 'package:miaged/main.dart';

class profil extends StatefulWidget {
  const profil({Key? key}) : super(key: key);
  

  @override
  _profilState createState() => _profilState();
}

class _profilState extends State<profil> {

  Future getPost() async {
    await Firebase.initializeApp();
    var firestore = FirebaseFirestore.instance;

    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection("users").get();

    return querySnapshot.docs;
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getPost(),
        builder: (_, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Text("Chargement"),
            );
          } else {
            return Scaffold(
                body: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(labelText: "Login"),
                        readOnly: true,
                        initialValue: (snapshot.data[0]['login']).toString(),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: "Password"),
                        initialValue: (snapshot.data[0]['password']).toString(),
                        obscureText: true,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: "L'anniversaire"),
                        initialValue: (snapshot.data[0]['anniversaire']).toString(),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: "L'adresse"),
                        initialValue: (snapshot.data[0]['adresse']).toString(),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: "Code postal"),
                        keyboardType: TextInputType.number,
                        initialValue: (snapshot.data[0]['code postal']).toString(),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: "Ville"),
                        initialValue: (snapshot.data[0]['ville']).toString(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/deco');
                          },
                          child: const Text('Se déconnecter'),
                        ),
                      )
                    ],
                  ),
                ));
          }
        });
  }
}
