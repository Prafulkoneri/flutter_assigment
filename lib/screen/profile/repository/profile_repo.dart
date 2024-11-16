import 'package:flutter_assigment/screen/profile/model/profile_model.dart';
import 'package:http/http.dart' as http;

class ProfileDetailsRepo {
  Future<http.Response> profileData(
      ProfileDetailsRequestModel requestmodel, token) async {
    try {
      return await http.post(Uri.parse("https://jsonplaceholder.typicode.com/users"),
                  body : requestmodel.toJson(),
          headers: {
            "Authorization": "Bearer $token",
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
