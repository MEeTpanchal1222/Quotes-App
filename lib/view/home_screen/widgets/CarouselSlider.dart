
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pr_7_db_miner/controllers/QuoteController.dart';


Widget buildCarouselSlider() {
  QuotesController quotesController = Get.put(QuotesController());
  return SizedBox(
      height: 400,
      width: 350,
      child:  Obx(() {
        if (quotesController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (quotesController.errorMessage.isNotEmpty) {
          return Center(child: Text(quotesController.errorMessage.value));
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
                        onPressed: () {},
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
                        icon: Icon(Icons.favorite ),
                        onPressed: () {

                          // quotesController.likeQuote(Quote as Quote);
                        },
                      ),
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
  );
}
