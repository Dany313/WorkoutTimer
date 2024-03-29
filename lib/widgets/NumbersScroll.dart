import 'package:flutter/material.dart';

class NumbersScroll extends StatelessWidget {
  final int itemCount;
  final testArray = [for (var i = 0; i < 100; i++) 'item$i'];

  NumbersScroll({super.key, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen,
      child: SizedBox(
          width: 150,
          height: 200,
          child: ListWheelScrollView.useDelegate(
              itemExtent: 50,
              childDelegate: ListWheelChildLoopingListDelegate(
                children: List<Widget>.generate(
                    itemCount,
                        (index) => SizedBox(
                      width: 50,
                      height: 50,
                      child: Card(
                        child: Center(child: Text('${index + 1}')),
                      ),
                    )

                ),
              ))),
    );
  }
}