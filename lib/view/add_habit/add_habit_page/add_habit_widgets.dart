import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:productivity/common/utils/icons.dart';
import 'package:productivity/controller/add_habit/add_habit.dart';
import 'package:productivity/controller/central_state.dart';
import 'package:productivity/style/style.dart';
import 'package:productivity/view/common_widgets/common_widgets.dart';
import 'package:intl/intl.dart';

import 'add_habit_page.dart';

class HabitNameField extends StatelessWidget {
  final double ht;

  HabitNameField({this.ht = 60});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(borderRadius)),
        height: ht,
        child: Observer(
            builder: (_) => Center(
                  child: TextFormField(
                    style: cardFontStyle,
                    cursorColor:
                        AppThemeData.colors[addHabitController.themeColorIndex],
                    onChanged: (value) => addHabitController.habitName = value,
                    decoration: new InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: margin * 2),
                        hintStyle: hintStyle,
                        hintText: "Name of this habit"),
                  ),
                )));
  }
}

class ChooseThemeOfHabit extends StatelessWidget {
  final double ht;
  final IconData colorIcon = Icons.label;

  ChooseThemeOfHabit({this.ht = 60});

  void _showDialogue(
      {buildContext,
      Function callBack,
      @required List list,
      bool isIconGrid = true}) {
    showDialog(
        context: buildContext,
        barrierDismissible: true,
        builder: (_) => AlertDialog(
              scrollable: true,
              backgroundColor: cardColor,
              title: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "Plenty of options, what do i choose...",
                  style: TextStyle(color: hintColor),
                ),
              ),
              content: Center(
                child: (Wrap(
                  children: [
                    for (int i = 0; i < list.length; i++)
                      GestureDetector(
                        onTap: () => callBack(i),
                        child: Container(
                          margin: EdgeInsets.all(margin * 2),
                          child: Icon(
                            isIconGrid ? list[i] : colorIcon,
                            size: iconSize,
                            color: !isIconGrid
                                ? list[i]
                                : AppThemeData.getRandomElement(
                                    AppThemeData.colors),
                          ),
                        ),
                      ),
                  ],
                )),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => _showDialogue(
                            buildContext: context,
                            callBack: (i) {
                              ///update theme icon here

                              addHabitController.themeIconIndex = i;
                              Navigator.of(context).pop();
                            },
                            list: AppThemeData.iconList),
                        child: Container(
                          height: ht,
                          width: ht,
                          decoration: BoxDecoration(
                              color: cardColor,
                              borderRadius:
                                  BorderRadius.circular(borderRadius)),
                          child: Icon(
                            AppThemeData
                                .iconList[addHabitController.themeIconIndex],
                            size: iconSize,
                            color: AppThemeData
                                .colors[addHabitController.themeColorIndex],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: margin * 2,
                      ),
                      Text(
                        "Icon",
                        style: cardFontStyle,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => _showDialogue(
                            buildContext: context,
                            callBack: (i) {
                              ///update theme color here
                              addHabitController.themeColorIndex = i;
                              Navigator.of(context).pop();
                            },
                            list: AppThemeData.colors,
                            isIconGrid: false),
                        child: Container(
                          height: ht,
                          width: ht,
                          decoration: BoxDecoration(
                              color: cardColor,
                              borderRadius:
                                  BorderRadius.circular(borderRadius)),
                          child: Icon(
                            colorIcon,
                            size: iconSize,
                            color: AppThemeData
                                .colors[addHabitController.themeColorIndex],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: margin * 2,
                      ),
                      Text(
                        "Color",
                        style: cardFontStyle,
                      )
                    ],
                  ),
                ),
              ],
            ));
  }
}

class HabitFrequency extends StatefulWidget {
  final double ht;

  HabitFrequency({this.ht = 60});

  @override
  _HabitFrequencyState createState() => _HabitFrequencyState();
}

class _HabitFrequencyState extends State<HabitFrequency> {
  final List<int> _frequencyList = List.generate(100, (index) => index + 1);
  int _selectedFrequency;
  final FixedExtentScrollController scrollController =
      new FixedExtentScrollController(initialItem: 1);


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedFrequency = _frequencyList[0];
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => Column(
              children: [
                Row(children: [
                  CustomContainer(
                      ht: widget.ht,
                      label: "on",
                      onTap: () {
                        setState(() {
                          addHabitController.selectedFrequencyAKAGoal=1;
                        });
                      },
                      color:   addHabitController.selectedFrequencyAKAGoal!=0
                          ? AppThemeData
                              .colors[addHabitController.themeColorIndex]
                          : null),
                  SizedBox(
                    width: margin,
                  ),
                  CustomContainer(
                      ht: widget.ht,
                      label: "off",
                      onTap: () {
                        setState(() {
                          addHabitController.selectedFrequencyAKAGoal=0;
                        });
                      },
                      color: addHabitController.selectedFrequencyAKAGoal==0
                          ? AppThemeData
                              .colors[addHabitController.themeColorIndex]
                          : null)
                ]),
                if (addHabitController.selectedFrequencyAKAGoal!=0)
                  Row(children: [
                    CustomContainer(
                        ht: widget.ht,
                        alignLeft: true,
                        label: addHabitController?.selectedFrequencyAKAGoal
                                ?.toString() ??
                            "0",
                        onTap: () {
                          showPicker(context);
                        }),
                    SizedBox(
                      width: margin,
                    ),
                    CustomContainer(
                      ht: widget.ht,
                      alignLeft: true,
                      label: "Times",
                      onTap: () {},
                    )
                  ])
              ],
            ));
  }

  showPicker(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: cardColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(borderRadius),
                topLeft: Radius.circular(borderRadius))),
        builder: (BuildContext context) {
          return Container(
            height: centralState.getHeight(40),
            child: Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: backgroundColorMedium,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(borderRadius),
                            topLeft: Radius.circular(borderRadius))),
                    height: centralState.getHeight(7),
                    padding:
                        EdgeInsets.symmetric(horizontal: marginExtraLarge * 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Text(
                            "Cancel",
                            style: cardFontStyle,
                            textAlign: TextAlign.left,
                          ),
                        )),
                        Expanded(
                            child: Text(
                          "Frequency",
                          style: headingFontStyle,
                          textAlign: TextAlign.center,
                        )),
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            addHabitController.selectedFrequencyAKAGoal =
                                _selectedFrequency;
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Set",
                            style: TextStyle(
                              fontSize: headingFontSize,
                              color: AppThemeData
                                  .colors[addHabitController.themeColorIndex],
                            ),
                            textAlign: TextAlign.right,
                          ),
                        )),
                      ],
                    )),
                SizedBox(
                  height: marginExtraLarge,
                ),
                Expanded(
                  child: CupertinoPicker(
                    scrollController: scrollController,
                    onSelectedItemChanged: (value) =>
                        _selectedFrequency = value,
                    itemExtent: marginExtraLarge * 3,
                    useMagnifier: true,
                    magnification: 1.1,
                    children: _frequencyList
                        .map((e) => Center(
                              child: Text(
                                e.toString(),
                                style: cardFontStyle,
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class HabitRepeat extends StatelessWidget {
  final double ht;

  HabitRepeat(this.ht);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Row(
        children: [
          CustomContainer(
            label: 'daily',
            ht: ht,
            color: addHabitController.repeatHabit == 'daily'
                ? AppThemeData.colors[addHabitController.themeColorIndex]
                : null,
            onTap: () => addHabitController.repeatHabit = 'daily',
          ),
          SizedBox(
            width: margin,
          ),
          CustomContainer(
            label: 'weekly',
            ht: ht,
            color: addHabitController.repeatHabit == 'weekly'
                ? AppThemeData.colors[addHabitController.themeColorIndex]
                : null,
            onTap: () => addHabitController.repeatHabit = 'weekly',
          ),
          SizedBox(
            width: margin,
          ),
          CustomContainer(
            label: 'monthly',
            ht: ht,
            color: addHabitController.repeatHabit == 'monthly'
                ? AppThemeData.colors[addHabitController.themeColorIndex]
                : null,
            onTap: () => addHabitController.repeatHabit = 'monthly',
          ),
        ],
      ),
    );
  }
}

class HabitDurationSelector extends StatelessWidget {
  final double ht;

  HabitDurationSelector(this.ht);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (addHabitController.repeatHabit == 'daily') {
        return chooseDay();
      } else if (addHabitController.repeatHabit == 'weekly') {
        return chooseWeek();
      } else {
        return chooseMonth();
      }
    });
  }

  Widget chooseDay() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              CustomContainer(
                label: 'S',
                ht: ht,
                onTap: () => addHabitController.selectedDays.contains(7)?null:addHabitController.selectedDays.add(7) ,
                color: addHabitController.selectedDays.contains(7)
                    ? AppThemeData.colors[addHabitController.themeColorIndex]
                    : null,
              ),
              SizedBox(
                width: margin,
              ),
              CustomContainer(
                label: 'M',
                ht: ht,
                onTap: () => addHabitController.selectedDays.contains(1)?null:addHabitController.selectedDays.add(1) ,
                color: addHabitController.selectedDays.contains(1)
                    ? AppThemeData.colors[addHabitController.themeColorIndex]
                    : null,
              ),
              SizedBox(
                width: margin,
              ),
              CustomContainer(
                label: 'T',
                ht: ht,
                onTap: () => addHabitController.selectedDays.contains(2)?null:addHabitController.selectedDays.add(2) ,
                color: addHabitController.selectedDays.contains(2)
                    ? AppThemeData.colors[addHabitController.themeColorIndex]
                    : null,
              ),
              SizedBox(
                width: margin,
              ),
              CustomContainer(
                label: 'W',
                ht: ht,
                onTap: () => addHabitController.selectedDays.contains(3)?null:addHabitController.selectedDays.add(3) ,
                color: addHabitController.selectedDays.contains(3)
                    ? AppThemeData.colors[addHabitController.themeColorIndex]
                    : null,
              ),
              SizedBox(
                width: margin,
              ),
              CustomContainer(
                label: 'T',
                ht: ht,
                onTap: () => addHabitController.selectedDays.contains(4)?null:addHabitController.selectedDays.add(4) ,
                color: addHabitController.selectedDays.contains(4)
                    ? AppThemeData.colors[addHabitController.themeColorIndex]
                    : null,
              ),
              SizedBox(
                width: margin,
              ),
              CustomContainer(
                label: 'F',
                ht: ht,
                onTap: () => addHabitController.selectedDays.contains(5)?null:addHabitController.selectedDays.add(5) ,
                color: addHabitController.selectedDays.contains(5)
                    ? AppThemeData.colors[addHabitController.themeColorIndex]
                    : null,
              ),
              SizedBox(
                width: margin,
              ),
              CustomContainer(
                label: 'S',
                ht: ht,
                onTap: () => addHabitController.selectedDays.contains(6)?null:addHabitController.selectedDays.add(6) ,
                color: addHabitController.selectedDays.contains(6)
                    ? AppThemeData.colors[addHabitController.themeColorIndex]
                    : null,
              ),
            ],
          ),
          CustomContainer(
            label: 'Every day',
            ht: ht,
            onTap: () {
              addHabitController.selectedDays.clear();

            },
            color: addHabitController.selectedDays.length==0
                ? AppThemeData.colors[addHabitController.themeColorIndex]
                : null,
          ),
        ],
      );

  ///choose weekly routine
  Widget chooseWeek() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              CustomContainer(
                label: '1',
                ht: ht,
                onTap: () => addHabitController.selectedWeek = 1,
                color: addHabitController.selectedWeek == 1
                    ? AppThemeData.colors[addHabitController.themeColorIndex]
                    : null,
              ),
              SizedBox(
                width: margin,
              ),
              CustomContainer(
                label: '2',
                ht: ht,
                onTap: () => addHabitController.selectedWeek = 2,
                color: addHabitController.selectedWeek == 2
                    ? AppThemeData.colors[addHabitController.themeColorIndex]
                    : null,
              ),
              SizedBox(
                width: margin,
              ),
              CustomContainer(
                label: '3',
                ht: ht,
                onTap: () => addHabitController.selectedWeek = 3,
                color: addHabitController.selectedWeek == 3
                    ? AppThemeData.colors[addHabitController.themeColorIndex]
                    : null,
              ),
              SizedBox(
                width: margin,
              ),
              CustomContainer(
                label: '4',
                ht: ht,
                onTap: () => addHabitController.selectedWeek = 4,
                color: addHabitController.selectedWeek == 4
                    ? AppThemeData.colors[addHabitController.themeColorIndex]
                    : null,
              ),
              SizedBox(
                width: margin,
              ),
              CustomContainer(
                label: '5',
                ht: ht,
                onTap: () => addHabitController.selectedWeek = 5,
                color: addHabitController.selectedWeek == 5
                    ? AppThemeData.colors[addHabitController.themeColorIndex]
                    : null,
              ),
              SizedBox(
                width: margin,
              ),
              CustomContainer(
                label: '6',
                ht: ht,
                onTap: () => addHabitController.selectedWeek = 6,
                color: addHabitController.selectedWeek == 6
                    ? AppThemeData.colors[addHabitController.themeColorIndex]
                    : null,
              ),
            ],
          ),
          CustomContainer(
            label: 'Once in every two weeks',
            ht: ht,
            onTap: () => addHabitController.selectedWeek = 0,
            color: addHabitController.selectedWeek == 0
                ? AppThemeData.colors[addHabitController.themeColorIndex]
                : null,
          ),
        ],
      );

  /// choose monthly routine
  Widget chooseMonth() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              CustomContainer(
                label: 'Start',
                ht: ht,
                onTap: () => addHabitController.selectedMonth = 1,
                color: addHabitController.selectedMonth == 1
                    ? AppThemeData.colors[addHabitController.themeColorIndex]
                    : null,
              ),
              SizedBox(
                width: margin,
              ),
              CustomContainer(
                label: 'Middle',
                ht: ht,
                onTap: () => addHabitController.selectedMonth = 2,
                color: addHabitController.selectedMonth == 2
                    ? AppThemeData.colors[addHabitController.themeColorIndex]
                    : null,
              ),
              SizedBox(
                width: margin,
              ),
              CustomContainer(
                label: 'End',
                ht: ht,
                onTap: () => addHabitController.selectedMonth = 3,
                color: addHabitController.selectedMonth == 3
                    ? AppThemeData.colors[addHabitController.themeColorIndex]
                    : null,
              ),
            ],
          ),
          CustomContainer(
            label: 'Anytime',
            ht: ht,
            onTap: () => addHabitController.selectedMonth = 0,
            color: addHabitController.selectedMonth == 0
                ? AppThemeData.colors[addHabitController.themeColorIndex]
                : null,
          ),
        ],
      );
}

class DoWhen extends StatelessWidget {
  final double ht;

  DoWhen(this.ht);

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    CustomContainer(
                      label: 'Morning',
                      ht: ht,
                      onTap: () => addHabitController.doWhen = 'morning',
                      color: addHabitController.doWhen == 'morning'
                          ? AppThemeData
                              .colors[addHabitController.themeColorIndex]
                          : null,
                    ),
                    SizedBox(
                      width: margin,
                    ),
                    CustomContainer(
                      label: 'Afternoon',
                      ht: ht,
                      onTap: () => addHabitController.doWhen = 'afternoon',
                      color: addHabitController.doWhen == 'afternoon'
                          ? AppThemeData
                              .colors[addHabitController.themeColorIndex]
                          : null,
                    ),
                    SizedBox(
                      width: margin,
                    ),
                    CustomContainer(
                      label: 'Evening',
                      ht: ht,
                      onTap: () => addHabitController.doWhen = 'evening',
                      color: addHabitController.doWhen == 'evening'
                          ? AppThemeData
                              .colors[addHabitController.themeColorIndex]
                          : null,
                    ),
                  ],
                ),
                CustomContainer(
                  label: 'Anytime',
                  ht: ht,
                  onTap: () => addHabitController.doWhen = 'anytime',
                  color: addHabitController.doWhen == 'anytime'
                      ? AppThemeData.colors[addHabitController.themeColorIndex]
                      : null,
                ),
              ],
            ));
  }
}

class SelectTime extends StatelessWidget {
  final double ht;

  SelectTime(this.ht);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            fit: FlexFit.loose,
            child: GestureDetector(
              onTap: () => showPicker(
                  context: context,
                  callBack: (DateTime time) =>
                      addHabitController.addTimeList(time)),
              child: Container(
                decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(borderRadius)),
                height: ht,
                margin: EdgeInsets.only(top: marginLarge),
                padding: EdgeInsets.symmetric(horizontal: marginExtraLarge),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.access_time,
                      size: iconSize,
                      color: AppThemeData
                          .colors[addHabitController.themeColorIndex],
                    ),
                    SizedBox(
                      width: marginLarge,
                    ),
                    Text(
                      "Add Time",
                      style: hintStyle,
                    )
                  ],
                ),
              ),
            ),
          ),
          for (int i = 0; i < addHabitController.timeList.length; i++)
            Observer(
                builder: (_) => Flexible(
                      fit: FlexFit.loose,
                      child: GestureDetector(
                        onTap: () => showPicker(
                            context: context,
                            callBack: (DateTime time) =>
                                addHabitController.timeList[i] = time),
                        child: Container(
                          decoration: BoxDecoration(
                              color: cardColor,
                              borderRadius:
                                  BorderRadius.circular(borderRadius)),
                          height: ht,
                          margin: EdgeInsets.only(top: marginLarge),
                          padding: EdgeInsets.symmetric(
                              horizontal: marginExtraLarge),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    size: iconSize,
                                    color: AppThemeData.colors[
                                        addHabitController.themeColorIndex],
                                  ),
                                  SizedBox(
                                    width: marginLarge,
                                  ),
                                  Text(
                                    DateFormat('h : mm a')
                                        .format(addHabitController.timeList[i]),
                                    style: cardFontStyle,
                                  )
                                ],
                              ),
                              GestureDetector(
                                onTap: () =>
                                    addHabitController.removeTimeList(i),
                                child: Icon(
                                  Icons.cancel,
                                  color: hintColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ))
        ],
      ),
    );
  }

  void showPicker({context, DateTime time, Function callBack}) {
    DateTime _tempTime = time ?? DateTime.now();
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: cardColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(borderRadius),
                topLeft: Radius.circular(borderRadius))),
        builder: (BuildContext context) {
          return Container(
            height: centralState.getHeight(40),
            child: Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: backgroundColorMedium,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(borderRadius),
                            topLeft: Radius.circular(borderRadius))),
                    height: centralState.getHeight(7),
                    padding:
                        EdgeInsets.symmetric(horizontal: marginExtraLarge * 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Text(
                            "Cancel",
                            style: cardFontStyle,
                            textAlign: TextAlign.left,
                          ),
                        )),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Reminder Time",
                            style: headingFontStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            callBack(_tempTime);
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Set",
                            style: TextStyle(
                              fontSize: headingFontSize,
                              color: AppThemeData
                                  .colors[addHabitController.themeColorIndex],
                            ),
                            textAlign: TextAlign.right,
                          ),
                        )),
                      ],
                    )),
                SizedBox(
                  height: marginExtraLarge,
                ),
                Expanded(
                    child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.time,
                  initialDateTime: time ?? DateTime.now(),
                  onDateTimeChanged: (DateTime newDateTime) {
                    _tempTime = newDateTime;
                  },
                  use24hFormat: false,
                  minuteInterval: 1,
                )),
              ],
            ),
          );
        });
  }
}
