import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_ordering/core/app_models/result_app_model.dart';
import 'package:food_ordering/core/services/interfaces/iauth_service.dart';

class AuthService implements IAuthService{

  
  @override
  Future<DataResultAppModel<User>> signInWithGoogle() {
    throw UnimplementedError();
  }

  @override
  Future<DataResultAppModel<User>> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }
  
}