import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static getRequest(variables) async {
    const baseUrl = "https://api.github.com/search/";
    try {
      var url = Uri.parse(baseUrl + variables);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Error();
      }
    } catch (e) {
      throw Error();
    }
  }
}
