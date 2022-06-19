import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class downloadpdf extends StatefulWidget {
  const downloadpdf({Key? key}) : super(key: key);

  @override
  State<downloadpdf> createState() => _downloadpdfState();
}

class _downloadpdfState extends State<downloadpdf> {
  @override
  Widget build(BuildContext context) {
    var Firestore;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 245, 213, 249),
        appBar: AppBar(
          title: Text('Monthly Report'),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
        body: StreamBuilder(
            stream: Firestore.instance.collection('monthly report').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Text("no value");
              }
              return ListView(
                children: snapshot.data.documents.map((document) {
                  return Text(document['field1']);
                }),
              );
            }));
  }
}
