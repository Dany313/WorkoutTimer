import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_overlay_apps/flutter_overlay_apps.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';

class TimeInputs extends StatefulWidget {
   const TimeInputs({super.key});

  @override
  State<TimeInputs> createState() => _TimeInputsState();

}

class _TimeInputsState extends State<TimeInputs> {
  int ore = 0;
  int minuti =0;
  int secondi =0;
  List<FlutterOverlayWindow> listOverlays = [];
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.yellow,
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 50,
                child: TextField(
                  onChanged: (text){
                    setState(() {
                      print(text);
                      ore = int.parse(text);
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(label: Text("ore")),
                ),
              ),
              SizedBox(
                width: 50,
                child: TextField(
                  onChanged: (text){
                    setState(() {
                      minuti = int.parse(text);
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(label: Text("minuti")),
                ),
              ),
              SizedBox(
                width: 70,
                child: TextField(
                  onChanged: (text){
                    setState(() {
                      secondi = int.parse(text);
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(label: Text("secondi")),
                ),
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () async {
                print("$ore$minuti$secondi");
                // Open overlay

                if(await FlutterOverlayWindow.isActive()){
                  await FlutterOverlayWindow.closeOverlay();
                }

                  await FlutterOverlayWindow.showOverlay(width: 100,height: 100,enableDrag: true);

                  Timer( Duration(hours: ore.toInt(),minutes: minuti.toInt(),seconds: secondi.toInt()), () { print("finito");
                   FlutterOverlayWindow.closeOverlay();});



              },
              child: const Text("Crea Timer")),
          ElevatedButton(onPressed: () async {
            await FlutterOverlayWindow.closeOverlay();
          }, child: Text("elimina floating"))
        ],
      ),
    );
  }
}
