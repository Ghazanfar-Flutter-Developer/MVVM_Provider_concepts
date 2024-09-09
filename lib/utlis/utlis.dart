import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utlis {
  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }

  static fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static void flushBarError(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: message,
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
        borderRadius: BorderRadius.circular(10),
        flushbarPosition: FlushbarPosition.BOTTOM,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        positionOffset: 20.0,
        icon: const Icon(
          Icons.error,
          color: Colors.white,
        ),
      )..show(context),
    );
  }

  static snakBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
