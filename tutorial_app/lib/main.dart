import 'package:flutter/material.dart';
import './pages/form_page.dart';
import './pages/form_result_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.amber,
          accentColor: Colors.indigo,
          backgroundColor: Colors.deepPurple,
        ),

        
        home: FormPage(),
        routes: {
          '/': (BuildContext context) => FormPage(),
          'form_result': (BuildContext context) => FormResultPage(),
        },

        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
              builder: (BuildContext context) => FormPage());
        },
    );
  }
}