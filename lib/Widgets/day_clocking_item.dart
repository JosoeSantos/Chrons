import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:unit_converter/Widgets/expand_in.dart';

final double _widgetHeight = 32;
final _borderRadius = BorderRadius.circular(_widgetHeight / 2);

class DayClockingItem extends StatelessWidget {
  final IconData icon;
  final String timeString;
  final Color color;

  const DayClockingItem(
      {Key key,
      @required this.icon,
      @required this.color,
      @required this.timeString})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemContent = Container(
      height: _widgetHeight,
      padding: EdgeInsets.only(right: 16, left: 8),
      child: Row(
        children: <Widget>[
          Container(
            color: Colors.transparent,
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Icon(
              icon,
              size: 14,
              color: color,
            ),
          ),
          Text(
            timeString,
            style: TextStyle(fontSize: 14),
          )
        ],
      ),
    );

    final decoratedItemLayout = Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Material(
        color: Colors.white,
        borderRadius: _borderRadius,
        elevation: 1,
        child: InkWell(
          borderRadius: _borderRadius,
          highlightColor: Theme.of(context).accentColor,
          splashColor: Theme.of(context).accentColor,
          customBorder: RoundedRectangleBorder(borderRadius: _borderRadius),
          onTap: () {
            print('Maybe this can be edited');
            print(context.size);
          },
          child: itemContent,
        ),
      ),
    );
    return ExpandIn(
      duration: Duration(milliseconds: 100),
      child: decoratedItemLayout,
    );
  }
}
