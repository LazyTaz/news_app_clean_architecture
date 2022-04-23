import 'package:flutter/material.dart';

enum _SnackBarTypeEnum {
  error,
  success,
  informative,
}

const _snackBarColors = {
  _SnackBarTypeEnum.error: Colors.red,
  _SnackBarTypeEnum.success: Colors.green,
  _SnackBarTypeEnum.informative: Colors.grey
};

SnackBar _buildSnackBar(String message, _SnackBarTypeEnum type) {
  var snackBar = SnackBar(
    content: Text(message),
    backgroundColor: _snackBarColors[type],
  );

  return snackBar;
}

void showErrorSnackBack(BuildContext context, String message) {
  var snackBar = _buildSnackBar(message, _SnackBarTypeEnum.error);

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showSuccessSnackBack(BuildContext context, String message) {
  var snackBar = _buildSnackBar(message, _SnackBarTypeEnum.success);

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showInformativeSnackBack(BuildContext context, String message) {
  var snackBar = _buildSnackBar(message, _SnackBarTypeEnum.informative);

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
