// Widget FieldCardX(
//     String name, int distance, String address, String time, Size size) {
//   return Container(
//     width: size.width * 0.9,
//     height: size.height * 0.33,
//     margin: EdgeInsets.all(10),
//     decoration: BoxDecoration(
//         color: Colurs.white, borderRadius: BorderRadius.circular(15)),
//     child: Column(
//       children: [
//         Container(
//             width: size.width,
//             height: size.height * 0.22,
//             decoration: BoxDecoration(
//                 color: Colurs.white, borderRadius: BorderRadius.circular(15)),
//             child: ClipRRect(
//               borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(15), topRight: Radius.circular(15)),
//               child: Image.network(
//                 'https://image.freepik.com/free-vector/soccer-stadium_1284-22432.jpg',
//                 fit: BoxFit.cover,
//               ),
//             )),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 name,
//                 style: TextStyle(color: Colurs.black, fontSize: 24),
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                     color: Colurs.backgroundColor,
//                     borderRadius: BorderRadius.circular(25)),
//                 padding: const EdgeInsets.all(5),
//                 child: Text(
//                   '$distance ' 'k.m',
//                   textDirection: TextDirection.ltr,
//                   style: TextStyle(color: Colurs.blue, fontSize: 16),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 address,
//                 style: TextStyle(color: Colurs.grey, fontSize: 15),
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                     color: Colurs.lightGreen,
//                     borderRadius: BorderRadius.circular(25)),
//                 padding: EdgeInsets.all(5),
//                 child: Text(
//                   time,
//                   textDirection: TextDirection.ltr,
//                   style: TextStyle(color: Colurs.blue, fontSize: 16),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }

// Widget CarouselCard(Size size) {
//   return Container(
//       margin: EdgeInsets.all(10),
//       width: size.width * 0.7,
//       height: size.height * 0.1,
//       decoration: BoxDecoration(
//           color: Colurs.white, borderRadius: BorderRadius.circular(15)),
//       child: ClipRRect(
//         borderRadius: const BorderRadius.all(Radius.circular(15)),
//         child: Image.network(
//           'https://image.freepik.com/free-vector/soccer-stadium_1284-22432.jpg',
//           fit: BoxFit.cover,
//         ),
//       ));
// }
