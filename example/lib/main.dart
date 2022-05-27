import 'package:flutter/material.dart';
import 'package:theme_patrol2/theme_patrol2.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your applicasetThemetion.
  @override
  Widget build(BuildContext context) {
    return ThemePatrol(
      light: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      mode: ThemeMode.light,
      builder: (context, theme) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: theme.light,
          darkTheme: theme.dark,
          themeMode: theme.mode,
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Switch(
            value: ThemePatrol.of(context).isDarkMode,
            onChanged: (selected) {
              if (selected) {
                ThemePatrol.of(context).darkMode();
              } else {
                ThemePatrol.of(context).lightMode();
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleColorPicker(
              initialColor: Theme.of(context).primaryColor,
              onChanged: (color) => ThemePatrol.of(context).setColor(color),
              size: const Size(240, 240),
              strokeWidth: 4,
              thumbSize: 36,
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
