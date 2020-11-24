import 'package:flutter/material.dart';
import 'package:productivity/controller/central_state.dart';
import 'package:productivity/style/style.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskCard extends StatelessWidget {
  String title;
  String requiredFrequency;
  String completedFrequency;
  String frequencyName;
  final Color color = yellow;
  final TextStyle _labelStyle = TextStyle(fontSize: 13, color: iconColor);
   final double _ht=centralState.getHeight(9.5);
  @override
  Widget build(BuildContext context) {


    Widget _pullCard(
            {Color color = green,
            IconData icon,
            String text = "",
            bool leftAlign = true}) =>
        Container(height: _ht,
          margin: leftAlign
              ? EdgeInsets.only(right: margin)
              : EdgeInsets.only(left: margin),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: color,
          ),
          child: icon == null
              ? Center(
                  child: Text(
                  text,
                  style: headingFontStyle,
                ))
              : Icon(
                  icon,
                  color: iconColor,
                ),
        );

    return Container(

      margin: EdgeInsets.symmetric(horizontal: margin * 2, vertical: margin),
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        child: Container(height: _ht,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: cardColor,
          ),
          child: ListTile(
            leading: Icon(
              Icons.star,
              color: color,
              size: iconSize,
            ),
            title: Text(
              'here goes the title hs sbd s ds',
              style: cardFontStyle,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "1 / 4",
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w800, color: color),
                ),
                SizedBox(
                  height: margin / 2,
                ),
                Text(
                  'Time',
                  style: _labelStyle,
                )
              ],
            ),
            subtitle: Row(
              children: [
                Icon(
                  Icons.star,
                  color: color,
                  size: 13,
                ),
                SizedBox(
                  width: margin / 2,
                ),
                Text(
                  'New',
                  style: _labelStyle,
                ),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          _pullCard(icon: Icons.done),
          _pullCard(icon: Icons.exposure_plus_2),
          _pullCard(icon: Icons.exposure_plus_1)
        ],
        secondaryActions: <Widget>[
          _pullCard(text: "Skip", color: blue, leftAlign: false),
        ],
      ),
    );
  }
}
