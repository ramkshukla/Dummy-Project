import 'package:flutter/material.dart';

// class Redeem extends StatelessWidget {
//   const Redeem({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Positioned(
//           top: -11,
//           left: 30,
//           child: Container(
//             padding: const EdgeInsets.all(2),
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.redAccent, width: 1),
//               borderRadius: BorderRadius.circular(10),
//               color: Colors.red,
//             ),
//             child: const Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(
//                   Icons.flight_takeoff,
//                   size: 20,
//                   color: Colors.white,
//                 ),
//                 Text(
//                   "  Flights",
//                   style: TextStyle(
//                       fontWeight: FontWeight.w600, color: Colors.white),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Container(
//           padding: const EdgeInsets.all(10),
//           decoration: BoxDecoration(
//               border: Border.all(color: Colors.redAccent, width: 1),
//               borderRadius: BorderRadius.circular(10)),
//           child: const Text(
//             "Redeem 100% ixigo money on each \nbooking",
//             style: TextStyle(fontWeight: FontWeight.w500),
//           ),
//         ),
//       ],
//     );
//   }
// }

class Redeem extends StatelessWidget {
  const Redeem({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TicketClipper(),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.redAccent, width: 1),
            borderRadius: BorderRadius.circular(10)),
        child: const Text(
          "Redeem 100% ixigo money on each \nbooking",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addOval(
        Rect.fromCircle(center: Offset(0.0, size.width / 2), radius: 20.0));
    // path.addOval(Rect.fromCircle(
    //     center: Offset(size.width, size.height / 2), radius: 20.0));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
