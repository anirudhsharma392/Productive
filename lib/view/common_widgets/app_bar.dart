import 'package:flutter/material.dart';
import 'package:productivity/controller/central_state.dart';
import 'package:productivity/style/style.dart';

class AppBarCustom extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Widget trailing;
  final String defaultTitleText;

  AppBarCustom(
      {this.leading,
      this.title,
      this.trailing,
      this.defaultTitleText = 'title'});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundDark,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(borderRadius),
              bottomRight: Radius.circular(borderRadius))),
      height: centralState.getHeight(8),
      child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: margin * 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: 100,
                child: leading ?? Container(),
              ),
              title ??
                  Text(
                    defaultTitleText ?? "",
                    style: headingFontStyle,
                  ),
              Container(
                width: 100,

                alignment: Alignment.centerRight,
                child: trailing ?? Container(),
              ),
            ],
          )),
    );
  }
}
