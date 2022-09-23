import 'package:alahdan_times/cubit/alahdan_cubit.dart';
import 'package:alahdan_times/cubit/alahdan_state.dart';
import 'package:alahdan_times/models/date_model.dart';
import 'package:alahdan_times/modules/widgets/date_and_time.dart';
import 'package:alahdan_times/shared/constant/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/build_drop_down_list.dart';
import '../widgets/time_now.dart';

class PrayerTimeScreen extends StatelessWidget {
  const PrayerTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocConsumer<AlahdanCubit, AlahdanStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AlahdanCubit.get(context);
        return Scaffold(
          body: SizedBox(
            width: width,
            height: height,
            child: Stack(
              children: [
                Container(
                  width: width,
                  height: height,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/prayertime.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black12.withOpacity(0.4),
                ),
                if (state is AladanPrayerTimeLoadingState)
                  const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                if (state is AladanPrayerTimeSuccessState) ...[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: DropDownWidget(
                            width: width,
                            height: height,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          children: List.from(
                            cubit.prayerTimesModel!.toMap().entries.map((e) {
                              return _buildItemList(
                                e.key,
                                e.value,
                              );
                            }).toList(),
                          ),
                        ),
                      )
                    ],
                  ),
                  DateAndTimeWidget(
                    model: cubit.dateModel,
                    width: width,
                    height: height,
                  ),
                ]
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildItemList(String title, String time) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.black12.withOpacity(0.6),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Image(
            image: AssetImage('${imageTimesMap[title]}'),
            width: 25.0,
            height: 25.0,
            color: Colors.white,
          ),
          SizedBox(width: 10.0),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          Spacer(),
          Text(
            time,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
