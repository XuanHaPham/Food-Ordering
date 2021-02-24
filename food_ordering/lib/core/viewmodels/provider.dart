import 'package:flutter/cupertino.dart';
import 'package:food_ordering/core/viewmodels/commons/implements/auth_viewmodel.dart';
import 'package:food_ordering/core/viewmodels/commons/interfaces/iauth_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> viewmodelProvider = [
  ChangeNotifierProvider<IAuthViewmodel>(
    create: (_) => AuthViewmodel(),
  ),
];