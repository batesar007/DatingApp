import 'package:dating_app/Classes/DataManager.dart';
import 'package:dating_app/Controllers/AuthController.dart';
import 'package:dating_app/firebase_options.dart';
import 'package:dating_app/screens/Auth/SplashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences preferences;
late DataManager AllData;
Future<void> main() async {
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Authcontroller(),
        )
      ],
      child: MaterialApp(
        home: Splashscreen(),
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: Brightness.dark,
              systemNavigationBarIconBrightness: Brightness.dark,
            )),
            useMaterial3: false),
      ),
    );
  }
}
