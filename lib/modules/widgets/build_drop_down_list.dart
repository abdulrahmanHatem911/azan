import 'package:alahdan_times/cubit/alahdan_cubit.dart';
import 'package:alahdan_times/cubit/alahdan_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropDownWidget extends StatefulWidget {
  final double width;
  final double height;
  const DropDownWidget({
    required this.width,
    required this.height,
  });

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlahdanCubit, AlahdanStates>(builder: (context, state) {
      var cubit = AlahdanCubit.get(context);
      return Container(
        width: widget.width * 0.7,
        height: widget.height * 0.14,
        margin: EdgeInsets.only(top: widget.height * 0.05),
        padding: EdgeInsets.only(
            left: widget.width * 0.02, right: widget.width * 0.02),
        child: DropdownButtonFormField<String>(
          elevation: 0,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.grey.shade600,
                width: 4,
              ),
            ),
          ),
          alignment: Alignment.topCenter,
          value: cubit.selectedCity,
          items: cubit.items.map((String value) {
            return DropdownMenuItem<String>(
              alignment: Alignment.topLeft,
              value: value,
              child: Text(
                value,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            cubit.changeCity(value!);
          },
        ),
      );
    });
  }
}
