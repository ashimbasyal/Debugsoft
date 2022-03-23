import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:debugsoft/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: FeedBack(),
  ));
}

class FeedBack extends StatefulWidget {
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  TextEditingController sampledata1 = new TextEditingController();
  TextEditingController sampledata2 = new TextEditingController();
  TextEditingController sampledata3 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Route newRoute =
                  MaterialPageRoute(builder: (context) => HomeScreen());
              Navigator.pushReplacement(context, newRoute);
            }),
        title: Text('FeedBack'),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: sampledata1,
                decoration: InputDecoration(hintText: "Title"),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: sampledata2,
                decoration: InputDecoration(hintText: "Description"),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: sampledata3,
                decoration: InputDecoration(hintText: "example@gmail.com"),
              ),
              SizedBox(
                height: 10,
              ),
              FlatButton(
                onPressed: () {
                  Map<String, dynamic> data = {
                    "Title": sampledata1.text,
                    "Description": sampledata2.text,
                    "email": sampledata3.text,
                  };

                  FirebaseFirestore.instance.collection("feedback").add(data);
                  
                },
                child: Text('Submit'),
                color: Colors.blueAccent,
              )
            ],
          ),
        ),
      ),
    );
  }
}
