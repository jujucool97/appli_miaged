import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Boutique extends StatefulWidget {
  const Boutique({Key? key}) : super(key: key);

  @override
  _BoutiqueState createState() => _BoutiqueState();
}

class _BoutiqueState extends State<Boutique> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListeProduit());
  }
  }



class ListeProduit extends StatefulWidget {
  const ListeProduit({Key? key}) : super(key: key);

  @override
  _ListeProduitState createState() => _ListeProduitState();
}

class _ListeProduitState extends State<ListeProduit> {

  Future getPost() async {
    await Firebase.initializeApp();
    var firestore = FirebaseFirestore.instance;

    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("habits").get();

    return querySnapshot.docs;
  }

  NavToDetail(DocumentSnapshot post){
    Navigator.push(context, MaterialPageRoute(builder: (context) => Detail(post: post,)));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPost(),
        builder: (_, AsyncSnapshot snapshot){
      if (snapshot.connectionState ==  ConnectionState.waiting){
        return Center(
          child: Text("Chargement"),
        );
      } else {
        return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (_,index){
              return ListTile(
                title: Image.network(snapshot.data[index]["image"]),
                onTap: () => NavToDetail(snapshot.data[index]),

              );

            });

      }
    });
  }
}


class Detail extends StatefulWidget {

  final DocumentSnapshot post;
  Detail({required this.post});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: ListView(
          children: [
            Image.network(widget.post['image']),
            Text("Article : " + widget.post['nom']),
            Text("Prix : " + widget.post['prix'].toString())
          ],
        ),
      ),
    );
  }
}