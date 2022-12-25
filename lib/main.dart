import 'package:doctors_connect/screens/doctor_detail_screen.dart';
import 'package:flutter/services.dart';
import 'package:doctors_connect/screens/chat_screen.dart';
import 'package:doctors_connect/screens/doctor_list_screen.dart';
import 'package:doctors_connect/screens/lobby_screen.dart';
import 'package:doctors_connect/screens/splash_screen.dart';
import './screens/doctor_detail_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './screens/auth_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctors Connect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SplashScreen();
            }
            if (snapshot.hasData) {
              return LobbyScreen();
            } else {
              return AuthScreen();
            }
          }),
      routes: {
        ChatScreen.routeName: (ctx) => ChatScreen(),
        DoctorsListScreen.routeName: (ctx) => DoctorsListScreen(),
        DoctorDetailScreen.routeName: (ctx) => DoctorDetailScreen(),
      },
    );
  }
}
