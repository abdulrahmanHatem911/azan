import 'package:alahdan_times/modules/widgets/time_now.dart';
import 'package:flutter/material.dart';

class DateAndTimeWidget extends StatelessWidget {
  final dynamic model;
  final double width;
  final double height;
  const DateAndTimeWidget({
    super.key,
    required this.model,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: height * 0.28,
      left: width * 0.09,
      child: Container(
        width: width * 0.5,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TimeNowWidget(),
              Text(
                '${model.dayHijri} ${model.monthHijri} ${model.yearHijri}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade300,
                ),
              ),
              Text(
                '${model.readable}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade300,
                ),
              ),
            ]),
      ),
    );
  }
}
