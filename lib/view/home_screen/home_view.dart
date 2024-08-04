import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pr_7_db_miner/controllers/QuoteController.dart';
import 'package:pr_7_db_miner/controllers/theme_controller.dart';
import 'package:pr_7_db_miner/view/category_screen/category_screen_1.dart';
import 'package:pr_7_db_miner/view/home_screen/widgets/BottemTabBar.dart';
import 'package:pr_7_db_miner/view/home_screen/widgets/like_button.dart';
import 'package:share_plus/share_plus.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController()); // Get the existing instance
    QuotesController quotesController = Get.put(QuotesController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Obx(() => Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        image: AssetImage(
                            themeController.selectedImage.value.isNotEmpty
                                ? themeController.selectedImage.value
                                : 'assets/default_image_path.png' // Replace with a default image path
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: SizedBox(
                        height: 400,
                        width: 350,
                        child:  Obx(() {
                          if (quotesController.isLoading.value) {
                            return Center(child: CircularProgressIndicator());
                          }
                          if (quotesController.errorMessage.isNotEmpty) {
                            return Center(child: Text(quotesController.errorMessage.value,style: TextStyle(color: Colors.white),));
                          }
                          if (quotesController.quotes.isEmpty) {
                            return Center(child: Text('No quotes available'));
                          }
                          return
                            CarouselSlider.builder(
                              itemCount: quotesController.quotes.length,
                              itemBuilder: (context, index, realIndex) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(50),
                                      child: Text(
                                        '${quotesController.quotes[index].text}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 21,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '${quotesController.quotes[index].author}',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 150,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            Share.share('${quotesController.quotes[index].text} - ${quotesController.quotes[index].author}');
                                          },
                                          icon: Icon(
                                            CupertinoIcons.share,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        IconButton(
                                          icon: Icon(quotesController.quotes[index].liked == "1" ? Icons.favorite : Icons.favorite_border,
                                            color: quotesController.quotes[index].liked == "1" ? Colors.red : Colors.white,
                                            size: 30,),
                                          onPressed: () {
                                            quotesController.likeQuote(quotesController.quotes[index]);
                                          },
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),

                                        IconButton(
                                            icon: Icon(Icons.copy_rounded,color: Colors.white,size: 30,),
                                            onPressed: () {
                                              Clipboard.setData(
                                                  ClipboardData(text: '${quotesController.quotes[index].text} - ${quotesController.quotes[index].author}'));
                                              Get.snackbar(
                                                backgroundColor: Colors.white,
                                                'Copied',
                                                'Quote copied to clipboard',
                                                snackPosition: SnackPosition.BOTTOM,
                                              );}),
                                      ],
                                    ),
                                  ],
                                );
                              },
                              options: CarouselOptions(
                                scrollDirection: Axis.vertical,
                                pageSnapping: true,
                                initialPage: 0,
                                enlargeCenterPage: true,
                              ),

                            );
                        })
                    )
                ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => CategoryScreen1(),transition: Transition.downToUp);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 20, top: 50, left: 20),
                            child: Container(
                              height: 60,
                              width: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.white),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    CupertinoIcons.rectangle_grid_2x2_fill,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'General',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Likebutton(),
                      ],
                    ),

                    SizedBox(height: 600,),
                    BottomTabBar(context),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
