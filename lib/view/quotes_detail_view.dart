// // views/quote_detail_view.dart
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:pr_7_db_miner/modals/quote.dart';
//
// class QuoteDetailView extends StatefulWidget {
//   final Quote quote;
//
//   QuoteDetailView({required this.quote});
//
//   @override
//   _QuoteDetailViewState createState() => _QuoteDetailViewState();
// }
//
// class _QuoteDetailViewState extends State<QuoteDetailView> {
//   List<String> fonts = [
//     'Roboto',
//     'Lobster',
//     'Pacifico',
//     'Oswald',
//     'Merriweather',
//   ];
//   int _selectedFontIndex = 0;
//
//   List<String> backgrounds = [
//     'assets/images/bg1.jpg',
//     'assets/images/bg2.jpg',
//     'assets/images/bg3.jpg',
//   ];
//   int _selectedBgIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Quote Detail'),
//       ),
//       body: Stack(
//         children: [
//           Image.asset(
//             backgrounds[_selectedBgIndex],
//             height: double.infinity,
//             width: double.infinity,
//             fit: BoxFit.cover,
//           ),
//           Container(
//             color: Colors.black54,
//             child: Center(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Text(
//                       widget.quote.quote,
//                       style: GoogleFonts.getFont(
//                         fonts[_selectedFontIndex],
//                         textStyle: TextStyle(
//                           fontSize: 24.0,
//                           fontStyle: FontStyle.italic,
//                           color: Colors.white,
//                         ),
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     SizedBox(height: 20),
//                     Text(
//                       '- ${widget.quote.author}',
//                       style: TextStyle(
//                         fontSize: 18.0,
//                         color: Colors.white70,
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: () {
//                         setState(() {
//                           _selectedBgIndex = (_selectedBgIndex + 1) % backgrounds.length;
//                         });
//                       },
//                       child: Text('Change Background'),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         setState(() {
//                           _selectedFontIndex = (_selectedFontIndex + 1) % fonts.length;
//                         });
//                       },
//                       child: Text('Change Font'),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         // Implement wallpaper setting functionality here
//                       },
//                       child: Text('Set as Wallpaper'),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pr_7_db_miner/controllers/QuoteController.dart';
import 'package:pr_7_db_miner/modals/quote.dart';
import 'package:share_plus/share_plus.dart';


class QuoteDetailView extends StatelessWidget {
  final Quote quote;
  final QuoteController controller = Get.find();

  QuoteDetailView({required this.quote});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quote Detail'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              quote.text,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Text('- ${quote.author}'),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    quote.liked ? Icons.favorite : Icons.favorite_border,
                    color: quote.liked ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    controller.likeQuote(quote);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {
                    Share.share('${quote.text} - ${quote.author}');
                  },
                ),
                IconButton(
                  icon: Icon(Icons.copy),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: '${quote.text} - ${quote.author}'));
                    Get.snackbar('Copied', 'Quote copied to clipboard');
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
