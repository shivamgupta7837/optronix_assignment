import 'dart:convert';
import 'package:optronix_assignment/model/business_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePreference {
  final String _isLogin = "IS_LOGIN";
  final String _signedUpDetails = "LOGIN_DETAILS";
  final String _userEmail = "USER_EMAIL";
  final String _userPassword = "USER_PASSWORD";
  final String _userPhone = "USER_PHONE";

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
  }


    void logOut() async {
    SharedPreferences? sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setBool(_isLogin, false);
  }

  void saveUser(String email, String password, String phoneNumber) async {
    _prefs?.setString(_userEmail, email);
    _prefs?.setString(_userPassword, password);
    _prefs?.setString(_userPhone, phoneNumber);
  }

  String get userId {
    final email = _prefs?.getString(_userEmail);
    return email ?? "";
  }

  String get userPassword {
    final password = _prefs?.getString(_userPassword);
    return password ?? "";
  }

  String get phoneNumber {
    final phone = _prefs?.getString(_userPhone);
    return phone ?? "";
  }

  Future<bool?> isUserLogin() async {
    return _prefs?.getBool(_isLogin);
  }

  void saveUserCredentials({required BusinessModel businessModel}) async {
    print("Login share: ${jsonEncode(businessModel)}");
    final isSaved = await _prefs?.setString(
      _signedUpDetails,
      jsonEncode(businessModel.toJson()),
    );
    saveUser(
      businessModel.contactPerson.email,
      businessModel.contactPerson.password,
      businessModel.contactPerson.phoneNumber,
    );

    print("Sf: ${bussinessDetails!.address}");
    if (isSaved != null) {
      if (isSaved!) {
        print("Saved");
      } else {
        print("Unsaved");
      }
    } else {
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
