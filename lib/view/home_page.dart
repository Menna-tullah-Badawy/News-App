import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:newsapp/controller/controller.dart';
import 'package:newsapp/model/model.dart';
import 'package:newsapp/view/bottom_nav_bar/science.dart';

import 'bottom_nav_bar/health.dart';
import 'bottom_nav_bar/sports.dart';

class HomePage extends GetWidget {
  NewsController controller = Get.put(NewsController());
  List<Widget> Screens = [
    Sports(),
    Science(),
    health(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("News App"),
        ),
        bottomNavigationBar: GetX<NewsController>(
          builder: (controller) => BottomNavigationBar(
              selectedItemColor: Colors.red,
              currentIndex: controller.currentIndex.value,
              onTap: ((val) {
                controller.currentIndex.value = val;
              }),
              items: [
                BottomNavigationBarItem(
                    label: "Sports", icon: Icon(Icons.sports)),
                BottomNavigationBarItem(
                    label: "Science", icon: Icon(Icons.science)),
                BottomNavigationBarItem(
                    label: "health", icon: Icon(Icons.health_and_safety)),
              ]),
        ),
        body: GetX<NewsController>(builder: (controller) =>Screens[controller.currentIndex.value]),
        );
  
  
  }
}
