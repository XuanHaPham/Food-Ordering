import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:food_ordering/core/app_models/result_app_model.dart';
import 'package:food_ordering/core/dtos/user_dto.dart';
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

    return await _signInWithCredential(credential);
  }

  @override
  Future<DataResultAppModel<User>> signInWithFacebook() async {
    AccessToken accessToken;
    try {
      accessToken = await _facebookAuth.login();
    } catch (e) {
      return DataResultAppModel(
        isSuccess: false,
        data: null,
        errorMessage: null,
      );
    }

    FacebookAuthCredential credential = FacebookAuthProvider.credential(
      accessToken.token,
    );
    return await _signInWithCredential(credential);
  }

  @override
  Future<ResultAppModel> resetPassword(String email) {
    throw UnimplementedError();
  }

  @override
  Future<ResultAppModel> signOut() async {
    try {
      await _auth.signOut();
      var isGoogleSignIn = await _googleSignIn.isSignedIn();
      var faceBookAccessToken = await _facebookAuth.isLogged;
      if (isGoogleSignIn) {
        await _googleSignIn.signOut();
      } else if (faceBookAccessToken != null) {
        await _facebookAuth.logOut();
      }
      return ResultAppModel(isSuccess: true);
    } catch (e) {
      return ResultAppModel(isSuccess: false);
    }
  }

  @override
  Future<DataResultAppModel<User>> signInWithUsernameAndPassword(
      String username, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: username,
        password: password,
      );
      return DataResultAppModel(
        isSuccess: true,
        errorMessage: '',
        data: userCredential.user,
      );
    } on FirebaseException catch (e) {
      String message = _firebaseAuthErrorMessage[e];
      return DataResultAppModel(
        isSuccess: false,
        data: null,
        errorMessage: message ?? e.message ?? "Something went wrong",
      );
    } catch (e) {
      return DataResultAppModel(
        isSuccess: false,
        errorMessage: e.message ?? 'Something went wrong',
        data: null,
      );
    }
  }

  Future<DataResultAppModel<User>> _signInWithCredential(
      AuthCredential credential) async {
    UserCredential authResult;
    try {
      authResult = await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      String message = _firebaseAuthErrorMessage[e];
      return DataResultAppModel(
        isSuccess: false,
        errorMessage: message ?? e.message ?? "Something went wrong",
        data: null,
      );
    } catch (e) {
      return DataResultAppModel(
        isSuccess: false,
        errorMessage: e.message ?? 'Something went wrong',
        data: null,
      );
    }

    return DataResultAppModel(
      isSuccess: true,
      errorMessage: '',
      data: authResult.user,
    );
  }

  Future<ResultAppModel> registration(UserDTO registrationUser) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: registrationUser.userName,
        password: registrationUser.password,
      );
      return DataResultAppModel(
        isSuccess: true,
        data: userCredential.user,
        errorMessage: '',
      );
    } on FirebaseAuthException catch (e) {
      String message = _firebaseAuthErrorMessage[e];
      return DataResultAppModel(
        isSuccess: false,
        errorMessage: message ?? e.message ?? "Something went wrong",
        data: null,
      );
    } catch (e) {
      return DataResultAppModel(
        isSuccess: false,
        errorMessage: e.message ?? 'Something went wrong',
        data: null,
      );
    }
  }
}

Map<String, String> _firebaseAuthErrorMessage = {
  // SignIn with email
  'user-not-found': 'Sorry, we cannot find an account with that email address.',
  'wrong-password': 'The password you entered is incorrect. Please try again.',
  'invalid-email': 'The email address you entered is invalid.',
  'user-disabled': 'Sorry, the account has been disabled.',
  // SignUp with email
  'email-already-in-use': 'Sorry, the email address is already in used.',
  'weak-password': 'Sorry, the password is too weak.',
  // SignIn with Credential
  'account-exists-with-different-credential':
      'Sorry, the email address is already used by different account.',
};
