import 'package:flutter/material.dart';
import 'package:optronix_assignment/services/share_pref/share_pref.dart';
import 'package:optronix_assignment/utils/themes/app_colors.dart';
import 'package:optronix_assignment/utils/themes/app_fonts.dart';
import 'package:optronix_assignment/view_model/auth/auth_cubit.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailOrPhoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _otpController = TextEditingController();
  
  bool _isOtpSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: AppFonts().appBarHeading("Login")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                  "assets/images/logo.png",
                  height: 250,
                ),
              // Email/Phone Input
              TextFormField(
                controller: _emailOrPhoneController,
                decoration: const InputDecoration(
                  labelText: 'Email or Phone Number',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter email or phone number';
                  }
                  // Basic email or phone validation
                  bool isEmail = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value);
                  bool isPhone = RegExp(r'^\d{10}$').hasMatch(value);
                  if (!isEmail && !isPhone) {
                    return 'Please enter a valid email or 10-digit phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Password or OTP Section
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                ),
              const SizedBox(height: 32),

              // Action Button
              ElevatedButton(
                onPressed:  _handleLogin,
            
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                ),
                child: AppFonts().subHeading('Login',
                ),
              ),
              const SizedBox(height: 16),

              // Sign Up Link
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child:  AppFonts().subHeading('Don\'t have an account? Sign Up',fontColor: AppColors().primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }



  void _handleLogin() async {
    if (_formKey.currentState?.validate() ?? false) {
      bool? success;
        success = await SharePreference.instance.isUserLogin();


      if (success??false) {
        if (mounted) {
          Navigator.pushReplacementNamed(context, '/home');
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
               'Invalid credentials'
              ),
            ),
          );
        }
      }
    }
  }

  @override
  void dispose() {
    _emailOrPhoneController.dispose();
    _passwordController.dispose();
    _otpController.dispose();
    super.dispose();
  }
}
