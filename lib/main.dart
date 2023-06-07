import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workingwithform_flutter/providers/flutter_form_builder_provider.dart';
import 'package:workingwithform_flutter/providers/normal_text_form_field_provider.dart';

import 'screens/flutter_form_builder.dart';
import 'screens/flutter_hooks.dart';
import 'screens/normal_text_form_filed.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlutterForm',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => NormalTextFormFieldProvider()),
          ChangeNotifierProvider(create: (_) => FlutterFormBuilderProvider()),
        ],
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  String _getAppBarTitle(int index) {
    switch (index) {
      case 0:
        return "FlutterTextFormField";
      case 1:
        return "FlutterHooks";
      case 2:
        return "FlutterFormBuilder";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          _getAppBarTitle(_currentIndex),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(
              onTap: (value) => setState(() {
                _currentIndex = value;
              }),
              tabs: const [
                Tab(icon: Text("TextFormField")),
                Tab(icon: Text("Hooks")),
                Tab(icon: Text("FormBuilder")),
              ],
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  NormalTextFormField(),
                  FlutterHooks(),
                  FlutterFormBuilder()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
