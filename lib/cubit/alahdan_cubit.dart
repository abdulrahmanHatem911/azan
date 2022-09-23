import 'package:alahdan_times/models/preyer_time.dart';
import 'package:alahdan_times/shared/network/remote/end_point.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/date_model.dart';
import '../shared/network/remote/dio_heloer.dart';
import 'alahdan_state.dart';

class AlahdanCubit extends Cubit<AlahdanStates> {
  AlahdanCubit() : super(AlahadnInitialState());
  static AlahdanCubit get(context) => BlocProvider.of(context);
  List<String> items = [
    'giza',
    'cairo',
    'Alexandria',
    'asyut',
    'fayoum',
    'beni suef'
  ];
  String selectedCity = 'giza';
  void changeCity(String value) {
    selectedCity = value;
    emit(AlahdanChangeCityState());
    getPayerTime(address: selectedCity);
  }

  PrayerTimes? prayerTimesModel;
  DateModel? dateModel;
  void getPayerTime({String address = 'cairo'}) {
    emit(AladanPrayerTimeLoadingState());
    DioHelper.getData(
      url: ApiContext.TIME_PRAYER,
      queries: {"address": "$address,EGY", "method": "8"},
    ).then((value) {
      prayerTimesModel = PrayerTimes.fromJson(value.data["data"]["timings"]);
      dateModel = DateModel.fromJson(value.data["data"]["date"]);
      emit(AladanPrayerTimeSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AladanPrayerTimeErrorState());
    });
  }
}
