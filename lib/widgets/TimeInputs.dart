import 'package:flutter/material.dart';
import 'package:flutter_overlay_apps/flutter_overlay_apps.dart';

class TimeInputs extends StatefulWidget {
   const TimeInputs({super.key});

  @override
  State<TimeInputs> createState() => _TimeInputsState();

}

class _TimeInputsState extends State<TimeInputs> {
  int ore = 0;
  int minuti =0;
  int secondi =0;
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.yellow,
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 100,
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
            width: 100,
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
            width: 100,
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
          ElevatedButton(
              onPressed: () async {
                print("$ore$minuti$secondi");
                await FlutterOverlayApps.showOverlay(height: 300, width: 400, alignment: OverlayAlignment.center);
              },
              child: Text("Crea Timer"))
        ],
      ),
    );
  }
}
