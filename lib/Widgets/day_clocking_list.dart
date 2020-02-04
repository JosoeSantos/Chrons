import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unit_converter/Widgets/day_clocking_item.dart';

class DayClockingList extends StatelessWidget {
  final List<DateTime> clockingList;

  const DayClockingList(this.clockingList);

  @override
  Widget build(BuildContext context) {
    if (clockingList == null) return Text('Nada aqui por hoje');

    final elementList = <Widget>[];

    for (int i = 0; i < clockingList.length; i++) {
      IconData icon = i % 2 == 0 ? Icons.call_made : Icons.call_received;
      Color color = i % 2 == 0 ? Colors.green : Colors.redAccent;
      String formatedTime = DateFormat('kk:mm:ss').format(clockingList[i]);
      elementList.add(DayClockingItem(
        icon: icon,
        color: color,
        timeString: formatedTime,
      ));
    }

    return Container(
      color: Colors.white,
      height: 50,
      padding: EdgeInsets.symmetric(vertical: 8),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: elementList,
      ),
    );
  }
}
