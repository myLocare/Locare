// import firebase
import 'package:firebase_auth/firebase_auth.dart';
// import firebase auth
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:locare/main.dart';
import 'package:locare/services/database.dart';

final formKey = GlobalKey<FormState>();

Future signUp(context, String email, String password, String name, String city,
    String phoneNumber) async {
  // final isValid = formKey.currentState!.validate();
  // if (!isValid) return;

  showDialog(
    context: context,
    builder: (context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;

    await DatabaseService(uid: user!.uid)
        .updateUserData(name, city, phoneNumber);
  } on FirebaseAuthException catch (e) {
    print(e.toString());
  }
  navigatorKey.currentState!.popUntil((route) => route.isFirst);
}
