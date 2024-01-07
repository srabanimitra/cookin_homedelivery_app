// //import 'package:cookin/view/common/color_extension.dart';
// import 'package:flutter/material.dart';
// //import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//
// import '../../common/color_extension.dart';
//
// class ItemDetailsView extends StatefulWidget {
//   const ItemDetailsView({super.key});
//
//   @override
//   State<ItemDetailsView> createState() => _ItemDetailsViewState();
// }
//
// class _ItemDetailsViewState extends State<ItemDetailsView> {
//   get child => null;
//
//   @override
//   Widget build(BuildContext context) {
//     var media = MediaQuery.of(context).size;
//     var color;
//  //   var RatingBar;
//     return Scaffold(
//         backgroundColor: TColor.white,
//         body: Stack(alignment: Alignment.topCenter, children: [
//           Image.asset(
//             "assets/img/detail_top.png",
//             width: media.width,
//             height: media.width,
//             fit: BoxFit.cover,
//           ),
//           Container(
//             width: media.width,
//             height: media.width,
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                   colors: [Colors.black, Colors.transparent, Colors.black],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter),
//             ),
//           ),
//           SingleChildScrollView(
//               child: Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 20),
//                   child: Stack(alignment: Alignment.topCenter, children: [
//                     Column(children: [
//                       SizedBox(
//                         height: media.width - 60,
//                       ),
//                       Container(
//                           decoration: BoxDecoration(
//                               color: TColor.white,
//                               borderRadius: const BorderRadius.only(
//                                   topLeft: Radius.circular(30),
//                                   topRight: Radius.circular(30))),
//                           child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const SizedBox(
//                                   height: 35,
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(horizontal: 25),
//                                   child: Text(
//                                     "Tandoori Chicken Pizza",
//                                     style: TextStyle(
//                                         color: TColor.primaryText,
//                                         fontSize: 22,
//                                         fontWeight: FontWeight.w800),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 8,
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(horizontal: 25),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           IgnorePointer(
//                                             ignoring: true,
//                                             child: RatingBar.builder(
//                                               initialRating: 4,
//                                               minRating: 1,
//                                               direction: Axis.horizontal,
//                                               allowHalfRating: true,
//                                               itemCount: 5,
//                                               itemSize: 20,
//                                               itemPadding: EdgeInsets.symmetric(
//                                                   horizontal: 1.0),
//                                               itemBuilder: (context, _) => Icon(
//                                                 Icons.star,
//                                                 color: TColor.primary,
//                                               ),
//                                               onRatingUpdate: (rating) {
//                                                 print(rating);
//                                               },
//                                             ),
//                                           ),
//                                           const SizedBox(
//                                             height: 4,
//                                           ),
//                                           Text(
//                                             " 4 Star Ratings",
//                                             style: TextStyle(
//                                                 color: TColor.primary,
//                                                 fontSize: 11,
//                                                 fontWeight: FontWeight.w500),
//                                           ),
//                                         ],
//                                       ),
//                                       Column(
//                                         crossAxisAlignment: CrossAxisAlignment.end,
//                                         children: [
//                                           Text(
//                                             "\$15",
//                                             style: TextStyle(
//                                                 color: TColor.primaryText,
//                                                 fontSize: 31,
//                                                 fontWeight: FontWeight.w700),
//                                           ),
//                                           const SizedBox(
//                                             height: 4,
//                                           ),
//                                           Text(
//                                             "/per Portion",
//                                             style: TextStyle(
//                                                 color: TColor.primaryText,
//                                                 fontSize: 11,
//                                                 fontWeight: FontWeight.w500),
//                                           ),
//                                         ],
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 15,
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(horizontal: 25),
//                                   child: Text(
//                                     "Description",
//                                     style: TextStyle(
//                                         color: TColor.primaryText,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w700),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 8,
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(horizontal: 25),
//                                   child: Text(
//                                     "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare leo non mollis id cursus. Eu euismod faucibus in leo malesuada",
//                                     style: TextStyle(
//                                         color: TColor.secondaryText, fontSize: 12),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 20,
//                                 ),
//                                 Padding(
//                                     padding:
//                                     const EdgeInsets.symmetric(horizontal: 25),
//                                     child: Divider(
//                                       color: TColor.secondaryText.withOpacity(0.4),
//                                       height: 1,
//                                     )),
//                                 const SizedBox(
//                                   height: 20,
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(horizontal: 25),
//                                   child: Text(
//                                     "Customize your Order",
//                                     style: TextStyle(
//                                         color: TColor.primaryText,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w700),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 20,
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(horizontal: 25),
//                                   child: Container(
//                                     padding:
//                                     const EdgeInsets.symmetric(horizontal: 15),
//                                     decoration: BoxDecoration(
//                                         color: TColor.textfield,
//                                         borderRadius: BorderRadius.circular(5)),
//                                     child: DropdownButtonHideUnderline(
//                                       child: DropdownButton(
//                                         isExpanded: true,
//                                         items: ["small", "Big"].map((e) {
//                                           return DropdownMenuItem(
//                                             value: e,
//                                             child: Text(
//                                               e,
//                                               style: TextStyle(
//                                                   color: TColor.primaryText,
//                                                   fontSize: 14),
//                                             ),
//                                           );
//                                         }).toList(),
//                                         onChanged: (val) {},
//                                         hint: Text(
//                                           "- Select the size of portion -",
//                                           textAlign: TextAlign.center,
//                                           style: TextStyle(
//                                               color: TColor.secondaryText,
//                                               fontSize: 14),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 15,
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(horizontal: 25),
//                                   child: Container(
//                                     padding:
//                                     const EdgeInsets.symmetric(horizontal: 15),
//                                     decoration: BoxDecoration(
//                                         color: TColor.textfield,
//                                         borderRadius: BorderRadius.circular(5)),
//                                     child: DropdownButtonHideUnderline(
//                                       child: DropdownButton(
//                                         isExpanded: true,
//                                         items: ["small", "Big"].map((e) {
//                                           return DropdownMenuItem(
//                                             value: e,
//                                             child: Text(
//                                               e,
//                                               style: TextStyle(
//                                                   color: TColor.primaryText,
//                                                   fontSize: 14),
//                                             ),
//                                           );
//                                         }).toList(),
//                                         onChanged: (val) {},
//                                         hint: Text(
//                                           "- Select the ingredients -",
//                                           textAlign: TextAlign.center,
//                                           style: TextStyle(
//                                               color: TColor.secondaryText,
//                                               fontSize: 14),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 25,
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(horizontal: 25),
//                                   child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                                       children: [
//                                         Row(
//                                           children: [
//                                             Text(
//                                               "Number of Portions",
//                                               style: TextStyle(
//                                                 color: TColor.primaryText,
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight.w700,
//                                               ),
//                                             ),
//                                             const Spacer(),
//                                             InkWell(
//                                               onTap: () {
//                                                 // Add functionality for the "-" onTap if needed
//                                               },
//                                               child: Container(
//                                                 padding: const EdgeInsets.symmetric(horizontal: 15),
//                                                 height: 25,
//                                                 alignment: Alignment.center,
//                                                 decoration: BoxDecoration(
//                                                   color: TColor.primary,
//                                                   borderRadius: BorderRadius.circular(12.5),
//                                                 ),
//                                                 child: Text(
//                                                   "-", // Placeholder for minus sign or content
//                                                   style: TextStyle(
//                                                     color: TColor.white,
//                                                     fontSize: 14,
//                                                     fontWeight: FontWeight.w700,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                             SizedBox(width: 10), // Adjust the space between "-" and "2"
//                                             InkWell(
//                                               onTap: () {
//                                                 // Add functionality for the "2" onTap if needed
//                                               },
//                                               child: Container(
//                                                 padding: const EdgeInsets.symmetric(horizontal: 15),
//                                                 height: 25,
//                                                 alignment: Alignment.center,
//                                                 decoration: BoxDecoration(
//                                                   color: TColor.primary,
//                                                   borderRadius: BorderRadius.circular(12.5),
//                                                 ),
//                                                 child: Text(
//                                                   "2",
//                                                   style: TextStyle(
//                                                     color: TColor.white,
//                                                     fontSize: 14,
//                                                     fontWeight: FontWeight.w700,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         const SizedBox(
//                                           height: 20,
//                                         ),
//                                         Column(
//                                             children: [
//                                               SizedBox(
//                                                 height: 20,
//                                               ),
//                                               Padding(
//                                                 padding: const EdgeInsets.symmetric(vertical: 20),
//                                                 child: Column(
//                                                   children: [
//                                                     const SizedBox(
//                                                       height: 35,
//                                                     ),
//                                                     Padding(
//                                                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                                                       child: Row(
//                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                         children: [
//                                                           IconButton(
//                                                             onPressed: () {
//                                                               Navigator.pop(context);
//                                                             },
//                                                             icon: Image.asset(
//                                                               "assets/img/btn_back.png",
//                                                               width: 20,
//                                                               height: 20,
//                                                               color: TColor.white,
//                                                             ),
//                                                           ),
//                                                           // Add an Expanded widget or other widgets here if needed
//                                                           IconButton(
//                                                             onPressed: () {},
//                                                             icon: Image.asset(
//                                                               "assets/img/shopping_cart.png",
//                                                               width: 25,
//                                                               height: 25,
//                                                               color: TColor.white,
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//
//                                             ]),
//                                       ]),
//                                 )])
//                       ),
//                     ])])))],));
//
//
//   }
// }
