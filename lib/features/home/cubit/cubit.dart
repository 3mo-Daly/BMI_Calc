import 'package:bloc/bloc.dart';
import 'states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  void loadHomeData() {
    emit(HomeInitialState());
  }

  void incrementWeight() {
    emit(HomeUpdateState(
      selectedGender: state.selectedGender,
      height: state.height,
      weight: state.weight + 1,
      age: state.age,
    ));
  }
  void decrementWeight() {
    emit(HomeUpdateState(
      selectedGender: state.selectedGender,
      height: state.height,
      weight: state.weight - 1,
      age: state.age,
    ));
  }
  void incrementAge() {
    emit(HomeUpdateState(
      selectedGender: state.selectedGender,
      height: state.height,
      weight: state.weight,
      age: state.age + 1,
    ));
  }
  void decrementAge() {
    emit(HomeUpdateState(
      selectedGender: state.selectedGender,
      height: state.height,
      weight: state.weight,
      age: state.age - 1,
    ));
  }
  void updateHeight(double newHeight) {
    emit(HomeUpdateState(
      selectedGender: state.selectedGender,
      height: newHeight,
      weight: state.weight,
      age: state.age,
    ));
  }
  void updateGender(String newGender) {
    emit(HomeUpdateState(
      selectedGender: newGender,
      height: state.height,
      weight: state.weight,
      age: state.age,
    ));
  } 

  
}