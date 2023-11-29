import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginLogic {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      rethrow;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}