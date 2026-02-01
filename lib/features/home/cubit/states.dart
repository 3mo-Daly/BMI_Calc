abstract class HomeStates {
  final String selectedGender ;
  final double height ;
  final int weight ;
  final int age ;
  HomeStates({required this.selectedGender,
    required this.height,
    required this.weight,
    required this.age,});  
}

class HomeInitialState extends HomeStates {
  HomeInitialState() : super(selectedGender: '', height: 150, weight: 80, age: 20);
}

class HomeUpdateState extends HomeStates {
  HomeUpdateState({required String selectedGender,
    required double height,
    required int weight,
    required int age,}) : super(selectedGender: selectedGender, height: height, weight: weight, age: age);
}


