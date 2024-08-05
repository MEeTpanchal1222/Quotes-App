import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pr_7_db_miner/controllers/QuoteController.dart';
import 'package:pr_7_db_miner/view/category_screen/category_screen_2.dart';


class CategoryScreen1 extends StatelessWidget {
  const CategoryScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    QuotesController quotesController = Get.put(QuotesController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent.shade100,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.multiply),
        ),
        title: Text(
          'Categories',
          style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor:  Colors.greenAccent.shade100,
      body: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(10),
        itemCount: quotesController.categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: (width / 2 - 20) / 100,
        ),
        itemBuilder: (context, index) {
          List<String> category = quotesController.categories.toList();
          return GestureDetector(
            onTap: () {
              // Pass the selected category to LikeScreen
              Get.to(() => CategoryScreen2(category: category[index]));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.yellow.shade50,
              ),
              child: Center(
                child: Text(
                  category[index],
                  style: TextStyle(
                    color: Colors.green.shade900,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}




