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
  final _emailController = TextEditingController();
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
              Image.asset("assets/images/logo.png", height: 250),
              // Email Input
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter email';
                  }
                  // Basic email or phone validation
                  bool isEmail = RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  ).hasMatch(value);

                  if (!isEmail) {
                    return 'Please enter a valid email';
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
                        '/loginPhoneScreen',
                      );
                    },
                    child: AppFonts().subHeading(
                      'Login with Phone Number ?',
                      fontColor: AppColors().primaryColor,
                    ),
                  ),
                ],
              ),

              /*
               Login share: {"name":"bzsbbs","email":"shivamgupta4126@gmail.com","address":"jwnejeheb","phoneNumber":"1234567890","location":"Jaipur","customerCount":0,"contactPerson":{"fullName":"hii","email":"shivay7837@gmail.com","phoneNumber":"1234567890","designation":"hs","dateOfBirth":"2025-07-28T00:00:00.000","password":"@Shivam1"}}
              */
              // Action Button
              ElevatedButton(
                onPressed: () {
                  final email = SharePreference.instance.userId;
                  final pass = SharePreference.instance.userPassword;
                  print(email);
                  print(pass);

                  if (email == _emailController.text &&
                      pass == _passwordController.text) {
                 SharePreference.instance.setUserIsLogin();
          Navigator.pushReplacementNamed(context, '/home');
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Email or password is incorrect')),
                    );
                  }
                },

                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                ),
                child: AppFonts().subHeading('Login'),
              ),
              const SizedBox(height: 16),

              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: AppFonts().subHeading(
                  'Don\'t have an account? Sign Up',
                  fontColor: AppColors().primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}