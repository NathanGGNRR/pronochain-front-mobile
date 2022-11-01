import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pronochain/text_style.dart';
import 'package:pronochain/view/actu.dart';
import 'package:pronochain/view/error.dart';
import 'package:pronochain/view/widget/appbar.dart';

Future<void> main() async{
  await dotenv.load();
  ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) =>
      errorScreen(flutterErrorDetails.exception);

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pronochain',
      theme: ThemeData(
          scaffoldBackgroundColor: ColorStylePronochain.backgroundColor),
      home: const MyHomePage(title: 'Pronochain'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: MyAppBar(),
        bottomNavigationBar: MyBottomAppBar(),
        body: ActuWidget());
  }
}
