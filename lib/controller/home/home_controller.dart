import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  PageController pageController = new PageController();
  @observable
  int currentPage = 0;

  @action
  void setCurrentPage(int index) {
    currentPage = index;
  }

  @action
  void jumpToPage(int index) {
    pageController.jumpToPage(index);
  }
}

//instance of a central state
final HomeController homeController = new HomeController();

///RUN TO REFRESH
///if you update state management variable
///flutter packages pub run build_runner build
///OR
///flutter packages pub run build_runner build --delete-conflicting-outputs
