import 'package:flutter/material.dart';
import 'package:test_drive/pages/fragments/immagini_fragment.dart';

import 'fragments/rubrica_fragment.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   final List<Widget> fragments = [
    const RubricaFragment(),
     const ImmaginiFragment(),
  ];

  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("titolo"),
      ),
        body: fragments[pageIndex] ,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (index) {
          setState(() {
            pageIndex = index;
            print(pageIndex);
          });
        },
        items: const [
          BottomNavigationBarItem(label: "Rubrica",icon: Icon(Icons.supervised_user_circle)),
          BottomNavigationBarItem(label: "Immagini",icon: Icon(Icons.image)),

        ],),
    );
  }
}
