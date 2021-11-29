import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:miaged/boutique.dart';

class profil extends StatefulWidget {
  const profil({Key? key}) : super(key: key);

  @override
  _profilState createState() => _profilState();
}

class _profilState extends State<profil> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: "Nom d'utilisateur"),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuilllez mettre votre identifiant';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: "Mot de passe"),
            obscureText: true,
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Merci de mettre votre Mot de passe';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: "Prénom"),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Merci de mettre votre Prénom';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: "Nom"),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Merci de mettre votre Nom';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: "Adresse"),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Merci de mettre votre adresse';
              }
              return null;
            },
          ),
        ],
      ),
    ));
  }
}
