import 'package:http/http.dart' as http;
class MyHttpClient{
  static final MyHttpClient _singleton = MyHttpClient._internal();

  factory MyHttpClient() {
    return _singleton;
  }

  MyHttpClient._internal();

  Future<http.Response?> get({required String url, Map<String,String>? headers}) async{
    try{
      http.Response response = await http.get(
          Uri.parse(url),
          headers: headers);
      return response;
    }catch(e){
      return null;
    }
  }

  Future<http.Response?> post({
    required String url,
    Map<String,String>? headers,
    Map<String,String>? body,
  }) async{
    try{
      http.Response response = await http.post(
          Uri.parse(url),
          headers: headers,
          body: body
      );
      return response;
    }catch(e){
      return null;
    }
  }
}