import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

abstract class IAuthViewmodel implements ChangeNotifier{
  User get currentUser;
  
  Future<void> signInWithGoogle();
  Future<void> signInWithFaceBook();
  
}