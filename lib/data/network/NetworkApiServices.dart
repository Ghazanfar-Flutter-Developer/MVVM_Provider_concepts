import 'dart:convert';

import 'package:http/http.dart';
import 'package:mvvm_provider/data/app_exceptions.dart';
import 'package:mvvm_provider/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;

class Networkapiservices extends Baseapiservices {
  @override
  Future getApiResponse(String url) async {
    dynamic jsonResponse;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      jsonResponse = returnResponse(response);
    } catch (e) {
      throw fetchDataException('No Internet Connection');
    }
  }

  @override
  Future postApiResponse(String url, dynamic data) async {
    dynamic jsonResponse;
    try {
      Response response = await post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));
      jsonResponse = returnResponse(response);
    } catch (e) {
      throw fetchDataException('No Internet Connection');
    }
    return jsonResponse;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw badRequestException(response.body.toString());
      case 404:
        throw badRequestException(response.body.toString());
      case 500:
      default:
        throw fetchDataException(
            'Error accorded while communicating with server with Status code ${response.statusCode}');
    }
  }
}
