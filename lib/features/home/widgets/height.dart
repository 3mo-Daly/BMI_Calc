import 'package:flutter/material.dart';

import '../../../core/color_manager.dart';
import '../../../core/styles.dart';

class Height extends StatelessWidget {
  final double height;
  final Function(double) onHeightChanged;

  const Height({
    super.key,
    required this.height,
    required this.onHeightChanged,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final sheight = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.9,
      //height: sheight * 0.25,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ColorManager.secondary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text('Height', style: Styles.grey.copyWith(fontSize: 20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(height.round().toString(), style: Styles.whitebold),
              const Text('cm', style: Styles.grey),
            ],
          ),
          Slider(
            value: height,
            min: 80,
            max: 220,
            activeColor: ColorManager.accent,
            inactiveColor: Colors.grey,
            onChanged: onHeightChanged, // Sends value back to Home
          ),
        ],
      ),
    );
  }
}
// class Height extends StatefulWidget {
//   const Height({super.key});

//   @override
//   State<Height> createState() => _HeightState();
// }

// class _HeightState extends State<Height> {
//   double height = 170;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(10),
//       padding: EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: ColorManager.secondary,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Column(
//         children: [
//           Text(
//             'Height',
//             style: Styles.grey.copyWith(fontSize: 40),
//           ),
//           const SizedBox(height: 10),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.baseline,
//             textBaseline: TextBaseline.alphabetic,
//             children: [
//               Text(
//                 height.toInt().toString(),
//                 style: Styles.whitebold,
//               ),
//               const SizedBox(width: 5),
//               const Text(
//                 'cm',
//                 style: Styles.grey,
//               ),
//             ],
//           ),
//           Slider(
//             value: height,
//             min: 100,
//             max: 200,
//             divisions: 150,
//             label: height.round().toString(),
//             onChanged: (value) {
//               // Handle slider value change
//               setState(() {
//                 height = value;
//               });
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
