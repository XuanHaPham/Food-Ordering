import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:food_ordering/core/app_models/result_app_model.dart';
import 'package:food_ordering/core/services/interfaces/iauth_service.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService implements IAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FacebookAuth _facebookAuth = FacebookAuth.instance;
  @override
  Future<DataResultAppModel<User>> signInWithGoogle() async {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    UserCredential authResult = await _auth.signInWithCredential(credential);

    return DataResultAppModel(
      isSuccess: true,
      errorMessage: '',
      data: authResult.user,
    );
  }

  @override
  Future<DataResultAppModel<User>> signInWithFacebook() async {
    AccessToken accessToken = await _facebookAuth.login();
    FacebookAuthCredential credential = FacebookAuthProvider.credential(
      accessToken.token,
    );
    UserCredential authResult = await _auth.signInWithCredential(credential);

    return DataResultAppModel(
      isSuccess: true,
      errorMessage: '',
      data: authResult.user,
    );
  }

  @override
  Future<ResultAppModel> resetPassword(String email) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<ResultAppModel> signOut() async {
    await _auth.signOut();
    var isGoogleSignIn = await _googleSignIn.isSignedIn();
    var faceBookAccessToken = await _facebookAuth.isLogged;
    if (isGoogleSignIn) {
      await _googleSignIn.signOut();
    } else if (faceBookAccessToken != null) {
      await _facebookAuth.logOut();
    }
  }
}
