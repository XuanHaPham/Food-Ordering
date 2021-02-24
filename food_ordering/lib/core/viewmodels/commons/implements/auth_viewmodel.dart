import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:food_ordering/core/app_models/result_app_model.dart';
import 'package:food_ordering/core/services/interfaces/iauth_service.dart';
import 'package:food_ordering/core/viewmodels/commons/interfaces/iauth_viewmodel.dart';
import 'package:food_ordering/global/global_data.dart';
import 'package:food_ordering/global/locator/locator.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewmodel extends ChangeNotifier implements IAuthViewmodel{
  final _globalData = locator<GlobalData>();
  final _authService = locator<IAuthService>();

  User _currentUser;
  @override
  User get currentUser => _currentUser;


  @override
  Future<void> signInWithFaceBook() async{
    
  }

  @override
  Future<void> signInWithGoogle() {
    
  }

  @override
  Future<ResultAppModel> resetPassword(String email) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<ResultAppModel> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}