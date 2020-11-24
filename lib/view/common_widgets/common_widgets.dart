import 'package:flutter/material.dart';
import 'package:productivity/style/style.dart';

class TextDivider extends StatelessWidget {
  final double topMargin;
  final double bottomMargin;
  final double regularMargin;
  final Color regularColor;
  final String text;

  TextDivider(
      {this.topMargin,
      this.bottomMargin = 0,
      this.regularColor = hintColor,
      this.regularMargin = 0,
      this.text = "Create your own"});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: regularMargin,
          right: regularMargin,
          top: topMargin ?? margin,
          bottom: bottomMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              height: 1,
              color: regularColor,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: margin),
            child: Text(
              text ?? "",
              style: TextStyle(color: regularColor),
            ),
          ),
          Expanded(
            child: Container(
              height: 1,
              color: regularColor,
            ),
          ),
        ],
      ),
    );
  }
}

///common card widget that expands to the available room
class CustomContainer extends StatelessWidget {
  final Function onTap;
  final Color color;
  final double ht;
  final bool alignLeft;
  final String label;
  final double topMargin;

  CustomContainer(
      {this.onTap,
      this.color,
      this.ht,
      this.alignLeft = false,
      this.topMargin,
      this.label = "label"});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: color ?? cardColor,
              borderRadius: BorderRadius.circular(borderRadius)),
          height: ht,
          margin: EdgeInsets.only(top: topMargin ?? marginLarge),
          padding: EdgeInsets.symmetric(horizontal: alignLeft?margin * 3:0),
          alignment: alignLeft ? Alignment.centerLeft : Alignment.center,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              label ?? "",
              style: cardFontStyle,
            ),
          ),
        ),
      ),
    );
  }
}
