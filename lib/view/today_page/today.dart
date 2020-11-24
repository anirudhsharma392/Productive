import 'package:flutter/material.dart';
import 'package:productivity/controller/today_controller/today_controller.dart';
import 'package:productivity/style/style.dart';
import 'package:productivity/view/today_page/schedule.dart';
import 'calender/calender.dart';

class TodayPage extends StatefulWidget {
  @override
  _TodayPageState createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todayController.tabController = new TabController(
        length: todayController?.eventList?.length ?? 0, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return SafeArea(
      child: Column(
        children: [

          Calendar(),
          Expanded(
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                print(innerBoxIsScrolled);
                return <Widget>[
                  SliverAppBar(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(borderRadius),
                            bottomRight: Radius.circular(borderRadius))),
                    //expandedHeight: 150.0,
                    floating: true,
                    collapsedHeight: _size.height / 10,
                    backgroundColor: backgroundDark,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                        titlePadding:
                            EdgeInsets.only(top: margin * 2, bottom: margin),
                        centerTitle: true,
                        title: TabBar(
                            controller: todayController.tabController,
                            indicatorSize: TabBarIndicatorSize.label,
                            isScrollable: true,
                            unselectedLabelColor: unselectedColor,
                            indicatorColor: iconColor,
                            tabs: todayController.eventList
                                .map((e) => Tab(
                                      child: Container(
                                          alignment: Alignment.center,
                                          width: _size.width / 4,
                                          child: Text(
                                            e,
                                            textScaleFactor: 1,
                                            style: TextStyle(
                                                fontSize: headingFontSize,
                                                fontWeight: FontWeight.w600),
                                          )),
                                    ))
                                .toList()),
                        background: Image.network(
                          "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                          fit: BoxFit.cover,
                        )),
                  ),
                ];
              },
              body: TabBarView(
                controller: todayController.tabController,
                children: [
                  Schedule(),
                  Container(
                    color: Colors.red,
                  ),
                  Container(
                    color: Colors.green,
                  ),
                  Container(
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
