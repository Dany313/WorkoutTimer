import 'package:flutter/material.dart';
import 'package:test_drive/widgets/NumbersScroll.dart';
import 'package:test_drive/widgets/TimeInputs.dart';


void main() => runApp(const MyApp());



class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // overlay entry point
  @pragma("vm:entry-point")
  void overlayMain() {
    runApp(const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Material(child: Text("My overlay"))
    ));
  }

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
          body: const TimeInputs()
        ));
  }
}

// class NumbersScroll extends StatelessWidget {
//
//   final int itemCount;
//
//   const NumbersScroll({super.key, required this.itemCount});
//
//   @override
//   Widget build(BuildContext context) {
//     return  SizedBox(
//       width: 150,
//       height: 300,
//       child: ListView.builder(
//         itemCount: itemCount,
//         padding: EdgeInsets.all(8.0),
//         itemBuilder: (BuildContext context, int index) {
//           return Container(
//             alignment: Alignment.center,
//             color: Colors.orange,
//             width: 20,
//             height: 100,
//             margin: EdgeInsets.only(bottom: 2.0),
//             child: Text("$index"),
//           );
//         },
//       ),
//     );
//   }
// }
