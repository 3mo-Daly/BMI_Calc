import 'package:flutter/material.dart';

import '../../../core/color_manager.dart';
import '../../../core/styles.dart';

class WeightandHeight extends StatelessWidget {
  final String label;
  final int value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const WeightandHeight({
    super.key,
    required this.label,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.4,
      //height: height * 0.25,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ColorManager.secondary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(label, style: Styles.grey.copyWith(fontSize: 20)),
          Text(value.toString(), style: Styles.whitebold),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton.small(
                heroTag: "$label-", // Unique tag for Hero animation
                onPressed: onDecrement,
                backgroundColor: ColorManager.secondary,
                child: const Icon(Icons.remove, color: Colors.white),
              ),
              FloatingActionButton.small(
                heroTag: "$label+",
                onPressed: onIncrement,
                backgroundColor: ColorManager.secondary,
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
// class WeightandHeight extends StatefulWidget {
//   final bool isAge;
//   const WeightandHeight({
//     super.key,
//     required this.isAge,
//   });

//   @override
//   State<WeightandHeight> createState() => _WeightandHeightState();
// }

// class _WeightandHeightState extends State<WeightandHeight> {
//   int weight = 60;
//   int age = 20;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(10),
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: ColorManager.secondary,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Column(
//         children: [
//           Text(widget.isAge ? 'Age' : 'Weight',
//               style: Styles.grey.copyWith(fontSize: 20)),
//           Text(widget.isAge ? age.toString() : weight.toString(),
//               style: Styles.whitebold),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       if (widget.isAge) {
//                         age--;
//                       } else {
//                         weight--;
//                       }
//                     });
//                   },
//                   child: const Text('-')),
//               ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       if (widget.isAge) {
//                         age++;
//                       } else {
//                         weight++;
//                       }
//                     });
//                   },
//                   child: Text('+')),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
