import 'package:flutter/material.dart';

class ResultAppModel {
  bool isSuccess;
  String errorMessage;

  ResultAppModel({
    @required this.isSuccess,
    this.errorMessage,
  });
}

class DataResultAppModel<T> extends ResultAppModel {
  T data;

  DataResultAppModel({
    @required bool isSuccess,
    String errorMessage,
    @required this.data,
  }) : super(isSuccess: isSuccess, errorMessage: errorMessage);
}
