import 'package:flutter/material.dart';
import 'package:productivity/common/utils/utils.dart';
import 'package:productivity/style/style.dart';
import 'package:intl/intl.dart';
import 'calendar_widget.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _now = Date().getCurrentDate();

  DateTime _selectedDate = Date().getCurrentDate();

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Container(
      color: backgroundColor3,
      child: Column(
        children: [

          Container(
              margin: EdgeInsets.symmetric(horizontal: margin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 60,
                    child: Icon(
                      Icons.settings,
                      color: iconColor,
                      size: 25,
                    ),
                  ),
                  Text(
                    _selectedDate == _now
                        ? "Today"
                        : "${_selectedDate.day} ${DateFormat('MMMM').format(_now).substring(0, 3)}",
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        color: iconColor),
                  ),
                  _selectedDate != _now
                      ? GestureDetector(
                          onTap: () {
                            navigateToCurrentDate();
                            setState(() {
                              _selectedDate = _now;
                            });
                          },
                          child: Container(
                            width: 60,
                            height: 30,
                            decoration: BoxDecoration(
                                color: highlightColor.withOpacity(0.3),
                                borderRadius:
                                    BorderRadius.circular(borderRadius)),
                            child: Center(
                                child: Text(
                              'Today',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: highlightColor,
                                  fontWeight: FontWeight.w800),
                            )),
                          ),
                        )
                      : SizedBox(width: 60)
                ],
              )),
          HorizontalCalendar(
            callback: (DateTime date) {
              setState(() {
                _selectedDate = date;
              });
            },
            width: _size.width,
            selectedDate: _selectedDate,
            height: 50,
          ),
        ],
      ),
    );
  }
}
