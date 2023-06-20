import 'package:deneme_flutter/firebase_options.dart';
import 'package:deneme_flutter/pages/chart_page.dart';
import 'package:deneme_flutter/pages/home.dart';
import 'package:deneme_flutter/pages/login_page.dart';
import 'package:deneme_flutter/pages/register_screen.dart';
import 'package:deneme_flutter/pages/welcome_screen.dart';
import 'package:deneme_flutter/providers/cart_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: Builder(builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Teknoya',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: "welcome_screen",
          routes: {
            'welcome_screen': (context) => WelcomeScreen(),
            'registration_screen': (context) => RegistrationScreen(),
            'login_screen': (context) => LoginScreen(),
            'home_screen': (context) => HomePage(),
          },
        );
      }),
    );
  }
}

