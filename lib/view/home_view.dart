// // views/home_view.dart
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:flutter/services.dart';
// import 'package:pr_7_db_miner/controllers/QuoteController.dart';
// import 'package:share_plus/share_plus.dart';
//
//
// class HomeView extends StatelessWidget {
//   final QuoteController quoteController = Get.put(QuoteController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Quotes'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.favorite),
//             onPressed: () {
//               Get.toNamed('/favorites');
//             },
//           ),
//         ],
//       ),
//       body: Obx(() {
//         if (quoteController.isLoading.value) {
//           return Center(child: CircularProgressIndicator());
//         }
//         return ListView.builder(
//           itemCount: quoteController.quotes.length,
//           itemBuilder: (context, index) {
//             final quote = quoteController.quotes[index];
//             return Card(
//               margin: EdgeInsets.all(10),
//               child: Padding(
//                 padding: EdgeInsets.all(15),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       quote.quote,
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontStyle: FontStyle.italic,
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       '- ${quote.author}',
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.grey,
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         IconButton(
//                           icon: Icon(
//                             quote.liked ? Icons.favorite : Icons.favorite_border,
//                             color: quote.liked ? Colors.red : null,
//                           ),
//                           onPressed: () {
//                             quoteController.likeQuote(quote);
//                           },
//                         ),
//                         IconButton(
//                           icon: Icon(Icons.share),
//                           onPressed: () {
//                             Share.share(
//                                 '${quote.quote} - ${quote.author}');
//                           },
//                         ),
//                         IconButton(
//                           icon: Icon(Icons.copy),
//                           onPressed: () {
//                             Clipboard.setData(
//                                 ClipboardData(text: '${quote.quote} - ${quote.author}'));
//                             Get.snackbar(
//                               'Copied',
//                               'Quote copied to clipboard',
//                               snackPosition: SnackPosition.BOTTOM,
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       }),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_7_db_miner/controllers/QuoteController.dart';
import 'package:pr_7_db_miner/view/widgets/category_card.dart';


class HomeView extends StatelessWidget {
  final QuoteController controller = Get.put(QuoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quotes by Category'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return GridView.builder(
          padding: EdgeInsets.all(10.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            return CategoryCard(category: controller.categories[index]);
          },
        );
      }),
    );
  }
}

