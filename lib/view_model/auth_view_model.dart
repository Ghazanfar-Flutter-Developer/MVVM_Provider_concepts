import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_provider/repositary/auth_repositary.dart';
import 'package:mvvm_provider/utlis/routes/routes_name.dart';
import 'package:mvvm_provider/utlis/utlis.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepositary();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _signupLoading = false;
  bool get signupLoading => _signupLoading;

  signUpLoading(bool value) {
    _signupLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      if (kDebugMode) {
        Utlis.snakBar('Login Successfully', context);
        Navigator.pushNamed(context, RoutesName.home);
        print(value.toString());
      }
    }).onError(
      (error, StackTrace) {
        setLoading(false);
        if (kDebugMode) {
          Utlis.flushBarError(error.toString(), context);
          print(error.toString());
        }
      },
    );
  }

  Future<void> signupApi(dynamic data, context) async {
    signUpLoading(true);
    _myRepo.registerApi(data).then((value) {
      signUpLoading(false);
      if (kDebugMode) {
        Utlis.snakBar('SignUp Successfully', context);
        Navigator.pushNamed(context, RoutesName.home);
        print(value.toString());
      }
    }).onError(
      (error, StackTrace) {
        signUpLoading(false);
        if (kDebugMode) {
          Utlis.flushBarError(error.toString(), context);
          print(error.toString());
        }
      },
    );
  }
}
