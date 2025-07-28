import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optronix_assignment/screens/home_screen.dart';
import 'package:optronix_assignment/screens/login_Screen.dart';
import 'package:optronix_assignment/screens/login_screen_phone.dart';
import 'package:optronix_assignment/screens/signup.dart';
import 'package:optronix_assignment/screens/splash_screen.dart';
import 'package:optronix_assignment/services/share_pref/share_pref.dart';
import 'package:optronix_assignment/utils/themes/app_colors.dart';
import 'package:optronix_assignment/view_model/auth/auth_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharePreference.instance.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(0, 188, 156, 156),
    ));
    return MultiBlocProvider(
      providers: [BlocProvider<AuthCubit>(create: (_) => AuthCubit())],
      child: MaterialApp(
         theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors().primaryColor),
      ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/splashScreen',
        routes: {
          '/login': (context) => const LoginScreen(),
          '/home': (context) => const HomeScreen(),
          '/signup': (context) => const SignupScreen(),
          '/loginPhoneScreen': (context) => const LoginScreenPhone(),
          '/splashScreen': (context) => const SplashScreen(),
        },
      ),
    );
  }
}
