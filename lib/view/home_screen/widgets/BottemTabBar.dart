import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_7_db_miner/view/Theme_Setting_screen/Theme_screen.dart';


Widget BottomTabBar(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.white)),
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.people_outline_rounded,
                color: Colors.white,
              )),
        ),
      ),
      GestureDetector(
        onTap: () {
          Get.to(() => ThemeScreen(),transition: Transition.rightToLeftWithFade);
        },
        child: Padding(
          padding: EdgeInsets.only( top: 50,),
          child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Colors.white)),
              child: Icon(
                Icons.color_lens,
                color: Colors.white,
              )
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 20, top: 50),
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.white)),
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              )),
        ),
      ),
    ],
  );
}
