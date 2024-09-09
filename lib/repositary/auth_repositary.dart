import 'package:mvvm_provider/data/network/BaseApiServices.dart';
import 'package:mvvm_provider/data/network/NetworkApiServices.dart';
import 'package:mvvm_provider/res/app_url.dart';

class AuthRepositary {
  final Baseapiservices _apiServices = Networkapiservices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.postApiResponse(AppUrl.loginURL, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.postApiResponse(AppUrl.registerApiEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
