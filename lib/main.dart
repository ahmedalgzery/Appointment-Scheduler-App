// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:appointment/features/splash/presentation/views/splash_view.dart';
import 'package:appointment/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// The entry point of the application
void main() async {
  // Ensuring that Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initializing Firebase with the default options
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Running the application
  runApp(const MyApp());
}

// The root widget of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard Appontmine',

      // Configuring the theme for the application
      theme: ThemeData(
        // Customizing the color scheme with a seed color
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),

        // Customizing the app bar theme
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
          titleTextStyle: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),

        // Enabling Material Design 3 features
        useMaterial3: true,
      ),

      // Setting the home view of the application
      home: const SplashView(),
    );
  }
}
