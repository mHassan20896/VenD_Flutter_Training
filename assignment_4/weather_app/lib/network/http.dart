import 'package:http/http.dart' as http;
import 'package:weather_app/network/paths.dart';
import 'package:weather_app/network/response_handler.dart';

class Http {
  Future<dynamic> get(String path, Map<String, String> queryParameters,
      {http.Client? client}) async {
    client ??= http.Client();
    Uri uri = Uri.http(baseUrl, path, queryParameters);
    print(uri.toString());
    http.Response rawResponse =
        await client.get(uri);
    ResponseHandler responseHandler = ResponseHandler();
    var response = responseHandler.handleResponse(rawResponse);
    print(response);
    return response;
  }
}
