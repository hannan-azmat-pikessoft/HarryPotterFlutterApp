import 'package:flutter/material.dart';
import 'package:login_app/screens/list_screen.dart';
import 'package:login_app/screens/login_page.dart';
import 'package:login_app/screens/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:login_app/widgets/stack.dart';
// import 'package:login_app/widgets/formwidget.dart';
// import 'package:login_app/widgets/animated_text.dart';
// import 'package:login_app/widgets/imagewidget.dart';
// import 'package:login_app/widgets/drawer.dart';
// import 'package:login_app/widgets/dismissable.dart';
// import 'package:login_app/widgets/button.dart';
// import 'package:login_app/widgets/container_sizedbox.dart';
// import 'package:login_app/widgets/rowsxcols.dart';
// import 'package:login_app/widgets/listview.dart';
// import 'package:login_app/widgets/snackbar.dart';

void main() async {
  String initialRoute;

  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferences token = await SharedPreferences.getInstance();

  String? _token = token.getString("@token");

  if (_token?.isEmpty ?? true) {
    initialRoute = "/login";
  } else {
    initialRoute = "/";
  }

  Widget app = MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light, secondaryHeaderColor: Colors.green),
      initialRoute: initialRoute,
      routes: {
        '/login': (context) => const LoginScreen(),
        '/': (context) => const ArrayListScreen(),
        '/chracters_detail': (context) => const ArrayListScreen(),
        '/profile': (context) => const MyProfile(),
      });

  runApp(app);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light, secondaryHeaderColor: Colors.green),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/chracters': (context) => const ArrayListScreen(),
        '/chracters_detail': (context) => const ArrayListScreen(),
        '/profile': (context) => const MyProfile(),
      },
    );
  }
}
