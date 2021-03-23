import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_ordering/core/app_models/result_app_model.dart';
import 'package:food_ordering/core/dtos/user_dto.dart';

abstract class IAuthViewmodel implements ChangeNotifier{
  User get currentUser;
  
  Future<void> signInWithEmailAndPassword(
    String email,
    String password,
  );
  Future<void> signInWithGoogle();
  Future<void> signInWithFaceBook();
  Future<void> signOut();
  Future<ResultAppModel> resetPassword(String email);
  Future<void> registrationWithEmailAndPassword(UserDTO resgistrationUser);
  
}