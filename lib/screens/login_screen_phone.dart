import 'package:flutter/material.dart';
import 'package:optronix_assignment/services/share_pref/share_pref.dart';
import 'package:optronix_assignment/utils/themes/app_colors.dart';
import 'package:optronix_assignment/utils/themes/app_fonts.dart';
import 'package:optronix_assignment/view_model/auth/auth_cubit.dart';
import 'package:provider/provider.dart';

class LoginScreenPhone extends StatefulWidget {
  const LoginScreenPhone({super.key});

  @override
  State<LoginScreenPhone> createState() => _LoginScreenPhoneState();
}

class _LoginScreenPhoneState extends State<LoginScreenPhone> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

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
                keyboardType: TextInputType.number,
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone number',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter phone number';
                  }
                  bool isPhone = RegExp(r'^\d{10}$').hasMatch(value);
                  if (!isPhone) {
                    return 'Please enter a valid email or 10-digit phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Password
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
                   Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        '/login',
                      );
                    },
                    child: AppFonts().subHeading(
                      'Login with email ?',
                      fontColor: AppColors().primaryColor,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed:  (){
                  final pass = SharePreference.instance.userPassword;
                  final phone = SharePreference.instance.phoneNumber;

                   if (phone == _phoneController.text &&
                      pass == _passwordController.text) {
                 SharePreference.instance.setUserIsLogin();
          Navigator.pushReplacementNamed(context, '/home');
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Phone number or password is incorrect')),
                    );
                  }
                  
                },
            
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                ),
                child: AppFonts().subHeading('Login',
                ),
              ),
              const SizedBox(height: 16),

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




  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
