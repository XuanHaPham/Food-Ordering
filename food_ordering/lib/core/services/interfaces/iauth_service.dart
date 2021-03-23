import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_ordering/core/app_models/result_app_model.dart';
import 'package:food_ordering/core/dtos/user_dto.dart';

abstract class IAuthService{
  Future<DataResultAppModel<User>> signInWithUsernameAndPassword(String username, String password);
  Future<DataResultAppModel<User>> signInWithGoogle();
  Future<DataResultAppModel<User>> signInWithFacebook();
  Future<ResultAppModel> signOut();
  Future<ResultAppModel> resetPassword(String email);
  Future<ResultAppModel> registration(UserDTO registrationUser);
}