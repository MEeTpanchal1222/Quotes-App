import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pr_7_db_miner/controllers/theme_controller.dart';
import 'package:pr_7_db_miner/uitels/theme_image_list.dart';
 // Import HomeScreen

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController()); // Ensure the controller is put

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade50,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.multiply),
        ),
        title: Text(
          'Themes',
          style: GoogleFonts.lato(color: Colors.purple,fontWeight: FontWeight.bold),

        ),
      ),
      backgroundColor: Colors.purple.shade50,
      body: SingleChildScrollView(
        child: Column(
          children: [
            sectionTitle('Colors'),
            themePhoto(Images, context, themeController),
            sectionTitle('Wallpaper'),
            themePhoto(Images2, context, themeController),
            sectionTitle('Natural'),
            themePhoto(Images3, context, themeController),
            sectionTitle('Themes'),
            themePhoto(Images3, context, themeController),
          ],
        ),
      ),
    );
  }

  Container themePhoto(List photoList, BuildContext context, ThemeController themeController) {
    return Container(
      height: 220,
      child: ListView.builder(
        itemCount: photoList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(15),
          child: GestureDetector(
            onTap: () {
              themeController.setImage(photoList[index]); // Update selected image
              Navigator.pop(context); // Navigate to HomeScreen
            },
            child: Container(
              height: 180,
              width: 120,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(photoList[index]), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row sectionTitle(String title) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 15),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.purple,
              fontSize: 20,
            ),
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(top: 15, right: 15),
          child: Text(
            'View all',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
      ],
    );
  }
}
