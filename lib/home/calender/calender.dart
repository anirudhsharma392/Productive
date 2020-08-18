import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:productivity/style/style.dart';
class HorizontalCalendar extends StatefulWidget {
  final double height;
  final double width;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final int month;
  final int year;
  final int selectedDate; // this is immutable
  HorizontalCalendar({
    @required this.year = 2020,
    @required this.month = 2,
    this.selectedDate,
    this.height,
    this.width,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.all(0),
  });

  @override
  _HorizontalCalendarState createState() => _HorizontalCalendarState();
}

class _HorizontalCalendarState extends State<HorizontalCalendar> {
  int selectedDay; // this is mutable

  @override
  void initState() {
    selectedDay = widget.selectedDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      margin: widget.margin,
      padding: widget.padding,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: DateTime(widget.year, widget.month + 1, 0).day,
        itemBuilder: (context, index) {
          index = index + 1;
          DateTime date = DateTime(widget.year, widget.month, index);
          return DayWidget(
            day: index,
            dayName: DateFormat('EEEE').format(date).substring(0, 2),
            selected: selectedDay == index ? true : false,
            callback: (int day) {
              selectedDay = day;
              setState(() {});
            },
          );
        },
      ),
    );
  }
}

class DayWidget extends StatelessWidget {
  final int day;
  final String dayName;
  final bool selected;
  final Function(int) callback;
  final _selectedBackgroundColor = Colors.white.withOpacity(0.1);
  final _selectedTextColor = Colors.white;

  DayWidget({
    this.day,
    this.dayName,
    this.selected = false,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      child: SizedBox(
        width: 60,
        child: FlatButton(
          color: selected ? _selectedBackgroundColor : Colors.transparent,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0),

          ),
          onPressed: () {
            callback(day);

          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              Text(
                dayName,
                style: TextStyle(
                  color: selected ? _selectedTextColor : Colors.white60,
                  fontSize: labelFontSize,
                  fontWeight: selected ? FontWeight.w900 : FontWeight.w300,
                ),
              ),
              Text(
                day.toString(),
                style: TextStyle(
                  color: selected ? _selectedTextColor : Colors.white,
                  fontSize: labelFontSize+3,
                  fontWeight: selected ? FontWeight.w900 : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
