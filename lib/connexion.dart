import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:miaged/boutique.dart';
import 'package:miaged/panier.dart';
import 'package:miaged/profil.dart';

class connexion extends StatefulWidget {
  const connexion({Key? key}) : super(key: key);

  @override
  _connexionState createState() => _connexionState();
}

class _connexionState extends State<connexion> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    const List<Widget> _pages = <Widget>[
      panier(),
      Boutique(),
      profil(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('MIAGED'),
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData(color: Colors.blue, size: 40),
        mouseCursor: SystemMouseCursors.grab,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Panier',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_rounded),
            label: 'Acheter',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Mon compte',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
