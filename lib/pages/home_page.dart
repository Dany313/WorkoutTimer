import 'package:flutter/material.dart';

import 'first_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("titolo"),
      ),
        body:  Center(
            child: TextButton(onPressed: () {
              Navigator.push( context, MaterialPageRoute(
                  builder: (context) {
                    return const FirstPage();
                  }

              ));
            },
              child: const Text("Rubrica"),
            )
        )
    );
  }
}
