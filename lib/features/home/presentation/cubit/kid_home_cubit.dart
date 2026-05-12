import 'package:flutter_bloc/flutter_bloc.dart';
import 'kid_home_state.dart';

class KidHomeCubit extends Cubit<KidHomeState> {
  KidHomeCubit() : super(const KidHomeState());

  void selectMood(KidMood mood) {
    emit(state.copyWith(selectedMood: mood));
  }

  void changeNavTab(int index) {
    emit(state.copyWith(currentNavIndex: index));
  }
}
