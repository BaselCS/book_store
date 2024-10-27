import 'package:book_store/const/data.dart';
import 'package:book_store/log_in.dart';
import 'package:book_store/main_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'const/colors.dart';
import 'const/list.dart';
import 'view_all.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (_) => ConfirmListProvider(), child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(backgroundColor: backgroundColor, body: Test()),
    );
  }
}

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const LogIn(),
        '/mainPage': (context) => const MainPage(),
        '/viewAll': (context) => const ViewAll(),
        '/list': (context) => const ListPage(),
      },
      initialRoute: '/',
    );
  }
}
