import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_ordering/core/app_models/result_app_model.dart';

abstract class IAuthService{
  Future<DataResultAppModel<User>> signInWithGoogle();
  Future<DataResultAppModel<User>> signInWithFacebook();
}