import 'dart:convert';

import 'package:movies_app/network/http_client.dart';
import 'package:movies_app/utils/network_utils.dart';
import 'package:http/http.dart' as http;

import '../../models/response_model.dart';

class MovieRepository{
  Future<ResponseModel?> getMovies({int page = 1}) async{
    ResponseModel? responseModel;
    String url = '${NetworkUtils.popularMovies}?language=en-US&page=$page';
    Map<String, String> headers = {
      'Authorization' : 'Bearer ${NetworkUtils.token}',
      'accept': 'application/json'
    };
    http.Response? response = await MyHttpClient().get(url: url, headers: headers);
    if(response != null){
      responseModel = ResponseModel.fromJson(jsonDecode(response.body));
    }
    return responseModel;
  }
}