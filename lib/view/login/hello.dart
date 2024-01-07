/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Hello extends StatefulWidget {
  const  Hello({super.key});

  @override
  State< Hello> createState() => _HelloState();
}

class _HelloState extends State<Hello> {
  final FirebaseAuth _auth= FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    String? _email =  _auth.currentUser !.email;
    return Scaffold(
      appBar: AppBar(
        title: const Text("WELCOME"),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(children: [
            Text("Signed Up With : &_email"),
          ]),
          )
      ),
    )
    
  }
}
*/