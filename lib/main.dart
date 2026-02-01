import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/home/cubit/cubit.dart';
import 'features/home/home_screen.dart';
import 'package:flutter/material.dart';
void main() 
{
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: BlocProvider(
        create: (context) => HomeCubit(),
        child:const HomeScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
    
  }
}
