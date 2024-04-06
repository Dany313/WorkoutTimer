import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'package:test_drive/pages/first_page.dart';
import 'package:test_drive/widgets/FloatingTimer.dart';
import 'package:test_drive/widgets/NumbersScroll.dart';
import 'package:test_drive/widgets/TimeInputs.dart';
import 'package:flutter_overlay_apps/flutter_overlay_apps.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(!await FlutterOverlayWindow.isPermissionGranted()){
    FlutterOverlayWindow.requestPermission();
  }
  runApp(const MyApp());
}

@pragma("vm:entry-point")
void overlayMain() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
     MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
        child: Container(
          color: Colors.red,
          child: FloatingTimer(ore: "1", minuti: "02", secondi: "03",),
        ),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Workout timer';
    return MaterialApp(
        title: appTitle,
        home: Scaffold(
          appBar: AppBar(
            title: const Text(appTitle),
          ),
          body: const FirstPage()
        ));
  }
}

