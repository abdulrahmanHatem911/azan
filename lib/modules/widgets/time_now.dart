import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeNowWidget extends StatelessWidget {
  const TimeNowWidget({super.key});

  @override
  Widget build(BuildContext context) => StreamBuilder(
        stream: Stream.periodic(const Duration(seconds: 1)),
        builder: (BuildContext context, AsyncSnapshot<Object?> snapshot) =>
            Center(
          child: Row(
            children: <Widget>[
              const SizedBox(width: 4),
              Text(
                DateFormat('a hh:mm:ss').format(DateTime.now()),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      );
}
