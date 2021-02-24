import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_ordering/core/app_models/result_app_model.dart';

abstract class IAuthViewmodel implements ChangeNotifier{
  User get currentUser;
  
  Future<void> signInWithGoogle();
  Future<void> signInWithFaceBook();
  Future<ResultAppModel> signOut();
  Future<ResultAppModel> resetPassword(String email);
  
}