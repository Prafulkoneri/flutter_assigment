import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_assigment/screen/profile/model/profile_model.dart';
import 'package:flutter_assigment/screen/profile/repository/profile_repo.dart';
import 'package:flutter_assigment/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ProfileController extends ChangeNotifier {
  ProfileDetailsRepo profileDetailsRepo = ProfileDetailsRepo();
  int? id;
  String? userId;
  String? title;
  String? body;
  bool loader = false;
  Future<void> initstate(context,uId) async {
    profileDetails(context , uId);
    notifyListeners();
  }
//   void showLoader(){
// loader = true;
//   }
ProfileDetailsRequestModel get profileDetailsRequestModel => ProfileDetailsRequestModel(userId: userId.toString());
  Future<void> profileDetails(context , uId) async {
    userId = uId.toString();
    SharedPreferences pref = await SharedPreferences.getInstance();
    profileDetailsRepo.profileData(profileDetailsRequestModel, pref.getString("sucessToken"))
        .then((response) async {
      final result =
          ProfileDetailsResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        id = result.id;
        title = result.title;
        body = result.body;
             } else {
        Utils.showPrimarySnackbar(context, '',
            type: SnackType.error);
      }
    }).onError((error, stackTrace) {
      Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
    }).catchError(
      (Object e) {
        Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
      },
      test: (Object e) {
        Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
        return false;
      },
    );
}
    
 
}
