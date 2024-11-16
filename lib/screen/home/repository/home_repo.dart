import 'package:http/http.dart' as http;


class HomeDetailsRepon {
  Future<http.Response> homeDetails(token) async {
    try {
      return await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'), headers: {
        "Authorization": "Bearer $token",
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}