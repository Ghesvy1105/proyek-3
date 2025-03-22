import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant.dart';

class API {
  Dio dio = Dio();

  static Dio kal() {
    var d = Dio(
      BaseOptions(
        baseUrl: apiUrl,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        responseType: ResponseType.json,
        contentType: Headers.jsonContentType,
        validateStatus: (status) => status != null,
      ),
    );
    d.interceptors.add(MyInterceptors());
    return d;
  }
}

class MyInterceptors extends Interceptor {
  @override
  onRequest(options, handler) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var tkn = prefs.getString("TOKEN");

    if (tkn != null) {
      options.headers['Authorization'] = 'Bearer $tkn';
    }
    // Add other interceptor logic here4 (e.g., error handling)
    log("LOGOPTIONS : " + options.headers.toString());
    log("LOGOPTIONS : " + handler.toString());
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {}
    log(err.toString());
    handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 401) {}
    // log(response.toString());
    handler.next(response);
  }
}

Future<void> addToken(String accessToken) async {
  API.kal().options.headers['Authorization'] = 'Bearer $accessToken';
}
