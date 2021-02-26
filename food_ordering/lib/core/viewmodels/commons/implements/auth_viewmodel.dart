import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:food_ordering/core/app_models/result_app_model.dart';
import 'package:food_ordering/core/services/interfaces/iauth_service.dart';
import 'package:food_ordering/core/viewmodels/commons/interfaces/iauth_viewmodel.dart';
import 'package:food_ordering/global/global_data.dart';
import 'package:food_ordering/global/locator/locator.dart';
import 'package:food_ordering/ui/utils/dialog_utils.dart';
import 'package:food_ordering/ui/utils/my_route.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewmodel extends ChangeNotifier implements IAuthViewmodel {
  final _globalData = locator<GlobalData>();
  final _authService = locator<IAuthService>();
  final _fireBaseAuth = FirebaseAuth.instance;

  User _currentUser;
  @override
  User get currentUser => _currentUser;

  void _setCurrentUser(User user){
    _globalData.currentUser = user;
    _currentUser = _fireBaseAuth.currentUser;
  }

  void _processLoginSignUpResult(ResultAppModel user) async{
    if(user.isSuccess){
        
      Get.toNamed(MyRoute.homeScreen);
    } else{
      DialogUtils.showYesNoDialog();
    }
  }

  @override
  Future<void> signInWithFaceBook() async {
    await EasyLoading.show(
      status: 'loading...',
      maskType: EasyLoadingMaskType.black,
    );
    DataResultAppModel<User> result = await _authService.signInWithFacebook();
    _setCurrentUser(result.data);
    notifyListeners();
    await EasyLoading.dismiss();
  }

  @override
  Future<void> signInWithGoogle() async {
    await EasyLoading.show(
      status: 'loading...',
      maskType: EasyLoadingMaskType.black,
    );
    DataResultAppModel<User> result = await _authService.signInWithGoogle();
    _setCurrentUser(result.data);
    notifyListeners();
    await EasyLoading.dismiss();
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
