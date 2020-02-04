import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DigitalClock extends StatelessWidget {
  final DateTime time;
  const DigitalClock({
    @required this.time
  });

  @override
  Widget build(BuildContext context) {
    if(time == null) {
      return Text('Carregando...', style: TextStyle(fontSize: 30,color: Colors.black54,),);
    }

    String formattedTime = DateFormat('kk:mm:ss').format(time);
    String formattedDate = DateFormat('EEEEE, MMM, dd').format(time);
    return Material(
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: InkWell(
            borderRadius: BorderRadius.circular(8),
            child: Column(
              children: <Widget>[
                Center(
                  child: Text(
                    formattedTime,
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.w300),
                  ),
                ),
                Text(
                  formattedDate,
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            )),
      ),
    );
  }
}
