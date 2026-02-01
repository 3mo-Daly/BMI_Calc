import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/color_manager.dart';
import '../../core/styles.dart';
import '../calc.dart';
import '../home/widgets/gender_select.dart';
import '../home/widgets/height.dart';
import '../home/widgets/weight_age.dart';
import '../result/result_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // 1. STATE LIVES HERE NOW
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorManager.scaffoldBackground,
      appBar: AppBar(
        title: const Text('BMI Calculator Cubited', style: Styles.whitebold),
        backgroundColor: ColorManager.primary,
      ),
      body: BlocBuilder<HomeCubit, HomeStates>(builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      // Gender Row (Unchanged logic)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GenderSelect(
                            iecon: Icons.male,
                            label: 'Male',
                            // We tell the Cubit what happened
                            isSelected: () =>
                                context.read<HomeCubit>().updateGender('Male'),
                            // We check the current state to see if we are selected
                            selected: state.selectedGender == 'Male',
                          ),
                          GenderSelect(
                            iecon: Icons.female,
                            label: 'Female',
                            isSelected: () => context
                                .read<HomeCubit>()
                                .updateGender('Female'),
                            selected: state.selectedGender == 'Female',
                          ),
                        ],
                      ),

                      // 2. PASSING DATA TO HEIGHT
                      Height(
                        height: state.height,
                        onHeightChanged: (val) {
                          context.read<HomeCubit>().updateHeight(val);
                        },
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // 3. PASSING DATA TO WEIGHT
                          Expanded(
                            child: WeightandHeight(
                              label: 'Weight',
                              value: state.weight,
                              onIncrement: () =>
                                  context.read<HomeCubit>().incrementWeight(),
                              onDecrement: () =>
                                  context.read<HomeCubit>().decrementWeight(),
                            ),
                          ),
                          // 4. PASSING DATA TO AGE
                          Expanded(
                            child: WeightandHeight(
                              label: 'Age',
                              value: state.age,
                              onIncrement: () =>
                                  context.read<HomeCubit>().incrementAge(),
                              onDecrement: () =>
                                  context.read<HomeCubit>().decrementAge(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Calculate Button
            // Inside HomeScreen...

            GestureDetector(
              onTap: () {
                // USE THE STATE HERE
                CalculatorBrain calc = CalculatorBrain(
                  height: state.height.toInt(),
                  weight: state.weight,
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    ),
                  ),
                );
              },
              child: Container(
                color: ColorManager.accent,
                width: double.infinity,
                height: 60.0,
                margin: const EdgeInsets.only(top: 10),
                child: const Center(
                    child: Text('Calculate', style: Styles.whitebold)),
              ),
            ),
            // GestureDetector(
            //   onTap: () {
            //     // NOW YOU CAN CALCULATE!
            //     // You have access to `height` and `weight` here.
            //     double result = weight / pow(height / 100, 2);
            //     print(result);
            //   },
            //   child: Container(
            //     color: ColorManager.accent,
            //     width: double.infinity,
            //     height: 80.0,
            //     margin: const EdgeInsets.only(top: 10),
            //     child: const Center(
            //         child: Text('Calculate', style: Styles.whitebold)),
            //   ),
            // ),
          ],
        );
      }),
    );
  }
}

// class _HomeScreenState extends State<HomeScreen> {
//   String selectedGender = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorManager.scaffoldBackground,
//       appBar: AppBar(
//         elevation: 3,
//         shadowColor: Colors.black,
//         centerTitle: true,
//         backgroundColor: ColorManager.primary,
//         title: const Text(
//           'BMI Calculator',
//           style: Styles.whitebold,
//         ),
//       ),
//       // 1. Change the main body to a Column
//       body: Column(
//         children: [
//           // 2. Wrap the scrollable part in Expanded
//           Expanded(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     // --- Your Existing Widgets ---
//                     Row(
//                       children: [
//                         GenderSelect(
//                           iecon: Icons.male,
//                           label: 'Male',
//                           isSelected: () =>
//                               setState(() => selectedGender = 'Male'),
//                           selected: selectedGender == 'Male',
//                         ),
//                         GenderSelect(
//                           iecon: Icons.female,
//                           label: 'Female',
//                           isSelected: () =>
//                               setState(() => selectedGender = 'Female'),
//                           selected: selectedGender == 'Female',
//                         ),
//                       ],
//                     ),
//                     const Height(),
//                     Row(
//                       children: const [
//                         Expanded(child: WeightandHeight(isAge: false)),
//                         Expanded(child: WeightandHeight(isAge: true)),
//                       ],
//                     ),
//                     // --- End of Existing Widgets ---
//                   ],
//                 ),
//               ),
//             ),
//           ),

//           // 3. The Button is OUTSIDE the Expanded/ScrollView
//           GestureDetector(
//             onTap: () {
//               // Calculate Logic goes here later
//             },
//             child: Container(
//               color: ColorManager.accent, // Your red color
//               width: double.infinity, // Takes full width
//               height: 80.0, // Fixed height matching design
//               margin: const EdgeInsets.only(top: 10),
//               child: const Center(
//                 child: Text(
//                   'Calculate',
//                   style: Styles.whitebold,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



