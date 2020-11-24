import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:productivity/common/utils/utils.dart';
import 'package:productivity/style/style.dart';

ScrollController _controller = new ScrollController();
const double _elementWidth = 55;

void navigateToCurrentDate() {
  Future.delayed(Duration(milliseconds: 100), () {
    ///animates to the middle which is current date
    ///[_controller.position.maxScrollExtent] returns total scrollable width
    ///divided by 2 for middle and subtraction part is offset given to middle
    _controller.animateTo(
        ((_controller.position.maxScrollExtent) / 2) - _elementWidth * 2,
        duration: const Duration(milliseconds: 2000),
        curve: Curves.easeOut);
  });
}

class HorizontalCalendar extends StatefulWidget {
  final double height;
  final double width;
  final EdgeInsets padding;
  final EdgeInsets margin;

  ///preselected date if any
  ///must be in range of start and end date
  DateTime selectedDate;

  ///starting date of calender
  ///!!!!!!!!!!!!!must contain only day reference!!!!!!!!!!!!!!!!!!
  ///like 2020-08-19 00:00:00.000 not 2020-08-19 02:34:00.000
  final DateTime startDate;

  ///ending date of calender
  final DateTime endDate;

  ///returns selected date
  final Function callback; // this is immutable
  HorizontalCalendar({
    @required this.callback,
    this.selectedDate,
    this.startDate,
    this.endDate,
    this.height,
    this.width,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.all(0),
  });

  @override
  _HorizontalCalendarState createState() => _HorizontalCalendarState();
}

class _HorizontalCalendarState extends State<HorizontalCalendar> {
  // this is mutable
  DateTime _startDate;
  DateTime _endDate;
  DateTime _now;

  @override
  void initState() {
    super.initState();

    ///assigns current date
    _now = Date.getCurrentDate();

    widget.selectedDate == null
        ? widget.selectedDate = _now
        : widget.selectedDate = widget.selectedDate;

    ///assigns start and end date if any
    widget.startDate == null
        ? _startDate = _now.subtract(Duration(days: 60))
        : _startDate = widget.startDate;

    widget.endDate == null
        ? _endDate = _now.add(Duration(days: 60))
        : _endDate = widget.endDate;

    navigateToCurrentDate();
  }
/// Checks the scroll position
//  _scrollListener() {
//    _controller.addListener(() {
//      final double _currentIndex = _controller.position.pixels / _elementWidth;
//      final double _middleIndex = _endDate.difference(_startDate).inDays / 2;
//      print(_currentIndex);
//
//      (_currentIndex < _middleIndex + 2 && _currentIndex > _middleIndex - 6)
//          ? widget.offsetCallback(false)
//          : widget.offsetCallback(true);
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundDark,
      width: widget.width,
      height: widget.height,
      margin: widget.margin,
      padding: widget.padding,
      child: ListView.builder(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        itemCount: _endDate.difference(_startDate).inDays,
        itemBuilder: (context, index) {
          index++;
          DateTime _date = _startDate.add(Duration(days: index));

          return DayWidget(
            date: _date,
            selected: widget.selectedDate.difference(_date).inHours == 0,
            callback: (DateTime day) {
              setState(() {
                widget.selectedDate = day;
              });

              widget.callback(widget.selectedDate);
            },
          );
        },
      ),
    );
  }
}

class DayWidget extends StatelessWidget {
  final DateTime date;
  final bool selected;
  final Function callback;
  final _selectedBackgroundColor = Colors.white.withOpacity(0.1);
  final _selectedTextColor = Colors.white;

  DayWidget({
    this.date,
    this.selected = false,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        width: _elementWidth,
        child: FlatButton(
          color: selected ? _selectedBackgroundColor : Colors.transparent,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0),
          ),
          onPressed: () {
            callback(date);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                DateFormat('EEEE').format(date).substring(0, 2),
                style: TextStyle(
                  color: selected ? _selectedTextColor : Colors.white60,
                  fontSize: labelFontSize,
                  fontWeight: selected ? FontWeight.w900 : FontWeight.w500,
                ),
              ),
              Text(
                date.day.toString(),
                style: TextStyle(
                  color: selected ? _selectedTextColor : Colors.white,
                  fontSize: labelFontSize + 3,
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
