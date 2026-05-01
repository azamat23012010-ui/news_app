import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/core/service/api_service.dart';
import 'package:news_app/src/features/home/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeLoadingState()) {
    getAllNews();
  }
  Future<void> getAllNews() async {
    try {
      emit(HomeLoadingState());
      final data = await ApiService.getAllNews();
      print('headline new keldi');
      emit(HomeLoadedState(model: data, index: 0));
    } catch (e) {
      print('headline news kelmadi');
      emit(HomeErrorState(errorText: e.toString()));
    }
  }
  Future<void> getAppleNews() async {
    try {
      emit(HomeLoadingState());
      final data = await ApiService.getAppleNews();
      print('apple new keldi');
      emit(HomeLoadedState(model: data, index: 1));
    } catch (e) {
      print('apple news kelmadi');
      emit(HomeErrorState(errorText: e.toString()));
    }
  }

  Future<void> getTeslaNews() async {
    try {
      emit(HomeLoadingState());
      final data = await ApiService.getTeslaNews();
      print('tesla new keldi');
      emit(HomeLoadedState(model: data, index: 2));
    } catch (e) {
      print('tesla news kelmadi');
      emit(HomeErrorState(errorText: e.toString()));
    }
  }

  Future<void> getTopHeadilngNews() async {
    try {
      emit(HomeLoadingState());
      final data = await ApiService.getTopHeadlinesNews();
      print('headline new keldi');
      emit(HomeLoadedState(model: data, index: 3));
    } catch (e) {
      print('headline news kelmadi');
      emit(HomeErrorState(errorText: e.toString()));
    }
  }


  void tapIndex(int index) {
    if (index == 0) {
      getAllNews();
    } else if (index == 1) {
      getAppleNews();
    } else if (index == 2) {
      getTeslaNews();
    } else {
      getTopHeadilngNews();
    }
  }
}
