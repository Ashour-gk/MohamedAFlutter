import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trail_b/Providers/AuthProvidder.dart';
import 'package:trail_b/Providers/Userprovider.dart';
import 'package:trail_b/Screens/LoginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Tmjhjkhhis widget is tuinnhe root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Authprovidder()),
        ChangeNotifierProvider(create: (context) => Userprovider()),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: Loginpage()),
    );
  }
}
