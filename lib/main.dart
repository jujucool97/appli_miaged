import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:miaged/connexion.dart';
import 'package:flutter/services.dart';
import 'package:miaged/erreur.dart';
import 'package:provider/provider.dart';

import 'boutique.dart';
import 'haut.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MIAGED',
        home: const miaged(),
        routes: <String, WidgetBuilder>{
          '/login': (BuildContext context) => const connexion(),
          '/deco' : (BuildContext context) => const miaged(),
          '/retour' : (BuildContext context) => const Boutique(),
          '/erreur' : (BuildContext context) => const erreurLogin(),
        });
  }
}

class miaged extends StatefulWidget {
  const miaged({Key? key}) : super(key: key);

  @override
  _miagedState createState() => _miagedState();
}

class _miagedState extends State<miaged> {
  final _formKey = GlobalKey<FormState>();
  bool result = false;

  Future<void> verif_user(login, pass) async {
    await Firebase.initializeApp();
    return FirebaseFirestore.instance
        .collection('users')
        .doc(login)
        .get()
        .then((DocumentSnapshot docSnapshot) {
          if (docSnapshot['login'] == login){
            result = true;
            log("login true");
          } else {
            result = false;
            log("login false");
          }
      if (docSnapshot['password'] == pass) {
        result = true;
        log("pass true");
      } else {
        result = false;
        log("pass false");
      }
    });
  }

  final myController = TextEditingController();
  final myController2 = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    myController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (BuildContext context, snapshot) {
          return Scaffold(
              appBar: AppBar(leading: Icon(Icons.menu), title: Text('MIAGED')),
              body: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      // The validator receives the text that the user has entered.
                      controller: myController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuilllez mettre votre identifiant';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      // The validator receives the text that the user has entered.
                      controller: myController2,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Merci de mettre votre mot de passe';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          /*if (result == false){
                            Navigator.of(context).pushNamed('/erreur');
                          }*/
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate()) {
                            verif_user(myController.text, myController2.text)
                                .then((value) => {});
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Traitement en cours...')),
                            );
                            Navigator.of(context).pushNamed('/login');
                          }
                        },
                        child: const Text('Se connecter'),
                      ),
                    ),
                  ],
                ),
              ));
        });
  }
}
