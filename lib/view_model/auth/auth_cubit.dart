import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:optronix_assignment/model/business_model.dart';
import 'package:optronix_assignment/services/share_pref/share_pref.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<bool> signup(BusinessModel businessData) async {
    print("printing business data: ${businessData.address}");
    try {
      // Store business data
      SharePreference.instance.saveUserCredentials(businessModel: businessData);
      return true;
    } catch (e) {
      debugPrint('Error during signup: $e');
      return false;
    }
  }

  Future<bool> savelogin() async {
    try {
      // Store business data
      SharePreference.instance.setUserIsLogin();
      return true;
    } catch (e) {
      debugPrint('Error during signup: $e');
      return false;
    }
  }
}
