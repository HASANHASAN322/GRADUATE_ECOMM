import 'dart:convert';
import 'package:http/http.dart' as http;

class THttpHelper {
  static const String _baseUrl = 'http://url.com';

  // get request method
  static Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await http.get(Uri.parse('$_baseUrl/$endpoint'));
    return _handleResponse(response);
  }

  // post request method
  static Future<Map<String, dynamic>> post(String endpoint , dynamic data) async {
    final response = await http.post(Uri.parse('$_baseUrl/$endpoint'),
        headers: {'Content-type': 'application/json'}, body: json.encode(data));
    return _handleResponse(response);
  }

  // put request
  static Future<Map<String, dynamic>> put(String endpoint , dynamic data) async {
    final response = await http.put(Uri.parse('$_baseUrl/$endpoint'),
        headers: {'Content-type': 'application/json'}, body: json.encode(data));
    return _handleResponse(response);
  }


  // DELETE request
  static Future<Map<String, dynamic>> delete(String endpoint) async {
    final response = await http.delete(Uri.parse('$_baseUrl/$endpoint'));
    return _handleResponse(response);
  }
 //  Handle the HTTP response
  static Map<String, dynamic> _handleResponse(http.Response response){
    if(response.statusCode == 200){
      return json.decode(response.body);
    } else {
      throw Exception('Failed to lead data: ${response.statusCode}');
    }
  }
}
