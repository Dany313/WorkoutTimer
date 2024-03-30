import 'dart:async';

import 'package:flutter/material.dart';

class FloatingTimer extends StatelessWidget {
   FloatingTimer({super.key,required this.ore,required this.minuti,required this.secondi});

   String ore = "";
  String minuti = "";
  String secondi = "";

   final Timer timer = Timer( const Duration(hours: 1,minutes: 1,seconds: 1), () { });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Text("prova"),
    );
  }
}
