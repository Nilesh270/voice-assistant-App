import 'package:allen/home_page.dart';
import 'package:allen/features/user_auth/presentation/pages/login_page.dart';
import 'package:allen/features/user_auth/presentation/pages/sign_up_page.dart';
import 'package:allen/features/app/splash_screen/splash_screen.dart';
import 'package:allen/pallete.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final User? user = _auth.currentUser;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Allen',
      theme: ThemeData.light(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: Pallete.whiteColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: Pallete.whiteColor,
        ),
      ),
      home: SplashScreen(
        // Decide whether to show the LoginPage or HomePage based on user authentication
        child: user != null ? const HomePage() : LoginPage(),
      ),
      routes: {
        '/login': (context) => const LoginPage(),
        '/signUp': (context) => const SignUpPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
