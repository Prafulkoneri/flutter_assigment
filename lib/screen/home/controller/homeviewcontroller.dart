import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_assigment/screen/home/model/user_list_model.dart';
import 'package:flutter_assigment/screen/home/repository/home_repo.dart';
import 'package:flutter_assigment/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Homeviewcontroller extends ChangeNotifier {
  HomeDetailsRepon homeDetailsRepo = HomeDetailsRepon();
  int? id;
  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;
    bool isLoading = true;
  Future<void> initstate(context) async {
    homeList(context);
    print("object");
    print(homeList(context));
     print("object");
    notifyListeners();
  }
 showLoader(value) {
    isLoading = value;
    notifyListeners();
  }
  Future<void> homeList(context) async {
        showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    homeDetailsRepo
        .homeDetails(pref.getString("sucessToken"))
        .then((response) async {
      final result =
          UserLIstDataResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        print(response.body);
        id = result.id;
        name = result.name;
        email = result.email;
        phone = result.phone;
        website = result.website;
        address = result.address;
        company = result.company;
     showLoader(false);
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