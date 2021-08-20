import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_sample/models/app_theme_model.dart';
import 'package:flutter_firebase_sample/models/auth_model.dart';
import 'package:flutter_firebase_sample/pages/home_page.dart';
import 'package:flutter_firebase_sample/pages/login_page.dart';
import 'package:provider/provider.dart';

void main() {
  // runApp 前に Flutter Engine を利用するために必要らしい
  WidgetsFlutterBinding.ensureInitialized();
  runApp(_InitializeApp());
}

class _InitializeApp extends StatefulWidget {
  @override
  _InitializeAppState createState() => _InitializeAppState();
}

class _InitializeAppState extends State<_InitializeApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return _AppContainer();
        }

        return const CircularProgressIndicator();
      },
    );
  }
}

class _AppContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => AppThemeModel(),
        )
      ],
      child: const MyAppWidget(),
    );
  }
}

class MyAppWidget extends StatelessWidget {
  const MyAppWidget({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final primarySwatch = context.select<AppThemeModel?, MaterialColor>(
        (theme) => theme?.primarySwatch ?? Colors.blue);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: primarySwatch,
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
      },
      initialRoute: '/',
    );
  }
}
