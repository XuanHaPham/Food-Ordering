import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:food_ordering/core/viewmodels/commons/interfaces/iauth_viewmodel.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewmodel extends ChangeNotifier implements IAuthViewmodel{
  User _currentUser;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FacebookAuth _facebookAuth = FacebookAuth.instance;
  @override
  User get currentUser => _currentUser;


  @override
  Future<void> signInWithFaceBook() {
    // TODO: implement signInWithFaceBook
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }
}