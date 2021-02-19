import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();
final FacebookAuth _facebookAuth = FacebookAuth.instance;
String name;
String email;
String imageUrl;

Future<String> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential authResult =
      await _auth.signInWithCredential(credential);
  final User user = authResult.user;

  if (user != null) {
    assert(!user.isAnonymous);
    assert(user.email != null);
    assert(user.displayName != null);
    assert(user.photoURL != null);
    assert(await user.getIdToken() != null);
    name = user.displayName;
    email = user.email;
    imageUrl = user.photoURL;

    // Only taking the first part of the name, i.e., First Name
    if (name.contains(" ")) {
      name = name.substring(0, name.indexOf(" "));
    }
    final User currentUser = _auth.currentUser;
    assert(user.uid == currentUser.uid);

    print('signInWithGoogle succeeded: $user');

    return '$user';
  }

  return null;
}

Future<UserCredential> signInWithFacebook() async {
  try {
    final AccessToken accessToken = await _facebookAuth.login();

    // Create a credential from the access token
    final FacebookAuthCredential credential = FacebookAuthProvider.credential(
      accessToken.token,
    );
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  } on FacebookAuthException catch (e) {
    // handle the FacebookAuthException
    print(e);
  } on FirebaseAuthException catch (e) {
    // handle the FirebaseAuthException
    print(e);
  } finally {}
  return null;
}

Future<void> signOutGoogle() async {
  await _auth.signOut();
  var isGoogleSignIn = await _googleSignIn.isSignedIn();
  var faceBookAccessToken = await _facebookAuth.isLogged;
  if (isGoogleSignIn) {
    await _googleSignIn.signOut();
  } else if (faceBookAccessToken != null) {
    await _facebookAuth.logOut();
  }
  print("User Signed Out");
}

Future<void> _checkIfIsLogged() async {
  final AccessToken accessToken = await FacebookAuth.instance.isLogged;
  if (accessToken != null) {
    // now you can call to  FacebookAuth.instance.getUserData();
    final userData = await FacebookAuth.instance.getUserData();
    // final userData = await FacebookAuth.instance.getUserData(fields: "email,birthday,friends,gender,link");
  }
}
