import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:miaged/boutique.dart';
import 'package:miaged/main.dart';

class erreurLogin extends StatefulWidget {
  const erreurLogin({Key? key}) : super(key: key);

  @override
  _erreurLoginState createState() => _erreurLoginState();
}

class _erreurLoginState extends State<erreurLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MIAGED'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/deco');
          },
          child: const Text('Retour Login'),
        ),
      ),
      );
  }
}
