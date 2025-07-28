import 'dart:convert';
import 'package:optronix_assignment/model/business_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePreference {
  final String _isLogin = "IS_LOGIN";
  final String _signedUpDetails = "LOGIN_DETAILS";
  final String _userEmail = "USER_EMAIL";
  final String _userPassword = "USER_PASSWORD";

  SharePreference._privateConstructor();

  static final SharePreference _instance =
      SharePreference._privateConstructor();

  static SharePreference get instance => _instance;

  SharedPreferences? _prefs;
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void setUserIsLogin() async {
    SharedPreferences? sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setBool(_isLogin, true);
  }echo "# optronix_assignment" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/shivamgupta7837/optronix_assignment.git
git push -u origin main

  Future<bool?> isUserLogin() async {
    return _prefs?.getBool(_isLogin);
  }

  void saveUserCredentials({required BusinessModel businessModel}) async {
    print("Login share: ${jsonEncode(businessModel)}");
    final isSaved = await _prefs?.setString(
      _signedUpDetails,
      jsonEncode(businessModel.toJson()),
    );

    print("Sf: ${bussinessDetails!.address}");
   if(isSaved!=null){
     if (isSaved!) {
      print("Saved");
    } else {
      print("Unsaved");
    }
   }else{
    print("saved null");
   }
  }
  BusinessModel? get bussinessDetails {
    final result = _prefs?.getString(_signedUpDetails);
    if (result != null) {
      return BusinessModel.fromJson(jsonDecode(result));
    }
    return null;
  }

}
