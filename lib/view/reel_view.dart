// // views/reel_view.dart
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:pr_7_db_miner/controllers/QuoteController.dart';
// import 'package:pr_7_db_miner/modals/quote.dart';
// import 'package:share_plus/share_plus.dart';
//
// class ReelView extends StatelessWidget {
//   final List<Quote> quotes;
//
//   ReelView({required this.quotes});
//
//   final QuoteController quoteController = Get.find();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CarouselSlider.builder(
//         itemCount: quotes.length,
//         itemBuilder: (context, index, realIndex) {
//           final quote = quotes[index];
//           return Container(
//             padding: EdgeInsets.all(20),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   quote.quote,
//                   style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 20),
//                 Text(
//                   '- ${quote.author}',
//                   style: TextStyle(fontSize: 20, color: Colors.grey),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     IconButton(
//                       icon: Icon(quote.liked ? Icons.favorite : Icons.favorite_border,
//                         color: quote.liked ? Colors.red : null,
//                       ),
//                       onPressed: () {
//                         quoteController.likeQuote(quote);
//                       },
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.share),
//                       onPressed: () {
//                         Share.share('${quote.quote} - ${quote.author}');
//                       },
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.copy),
//                       onPressed: () {
//                         Clipboard.setData(ClipboardData(text: '${quote.quote} - ${quote.author}'));
//                         Get.snackbar('Copied', 'Quote copied to clipboard', snackPosition: SnackPosition.BOTTOM);
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           );
//         },
//         options: CarouselOptions(
//           height: MediaQuery.of(context).size.height,
//           enlargeCenterPage: true,
//           enableInfiniteScroll: true,
//           autoPlay: true,
//         ),
//       ),
//     );
//   }
// }

// // views/quote_reel_view.dart
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:pr_7_db_miner/controllers/QuoteController.dart';
// import 'package:share_plus/share_plus.dart';
//
// class QuoteReelView extends StatelessWidget {
//   final QuoteController quoteController = Get.find();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Quote Reel'),
//       ),
//       body: Obx(() {
//         if (quoteController.isLoading.value) {
//           return Center(child: CircularProgressIndicator());
//         }
//         return CarouselSlider.builder(
//           itemCount: quoteController.quotes.length,
//           itemBuilder: (context, index, realIndex) {
//             final quote = quoteController.quotes[index];
//             return Card(
//               margin: EdgeInsets.all(10),
//               child: Padding(
//                 padding: EdgeInsets.all(15),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       quote.quote,
//                       style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       '- ${quote.author}',
//                       style: TextStyle(fontSize: 16, color: Colors.grey),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         IconButton(
//                           icon: Icon(quote.liked ? Icons.favorite : Icons.favorite_border,
//                             color: quote.liked ? Colors.red : null,
//                           ),
//                           onPressed: () {
//                             quoteController.likeQuote(quote);
//                           },
//                         ),
//                         IconButton(
//                           icon: Icon(Icons.share),
//                           onPressed: () {
//                             Share.share('${quote.quote} - ${quote.author}');
//                           },
//                         ),
//                         IconButton(
//                           icon: Icon(Icons.copy),
//                           onPressed: () {
//                             Clipboard.setData(ClipboardData(text: '${quote.quote} - ${quote.author}'));
//                             Get.snackbar('Copied', 'Quote copied to clipboard', snackPosition: SnackPosition.BOTTOM);
//                           },
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//           options: CarouselOptions(
//             height: MediaQuery.of(context).size.height,
//             autoPlay: true,
//             enlargeCenterPage: true,
//             viewportFraction: 0.9,
//             aspectRatio: 2.0,
//             initialPage: 2,
//           ),
//         );
//       }),
//     );
//   }
// }
