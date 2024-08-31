import 'package:flutter/material.dart';
import 'package:waffaraha_task/features/photos/presentation/controller/photos_bloc.dart';

class SortItem extends StatelessWidget {
  const SortItem(
      {required this.title,
      required this.isMarked,
      required this.radioValue,
      required this.onChange,
      super.key});
  final String title;
  final SortBy isMarked;
  final SortBy radioValue;
  final Function(SortBy) onChange;

  @override
  Widget build(BuildContext context) {
    return RadioListTile.adaptive(
      value: radioValue,
      groupValue: isMarked,
      onChanged: (SortBy? value) {
        onChange(value!);
      },
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 14,
          color: Colors.black,
        ),
      ),
      contentPadding: EdgeInsets.zero,
      dense: true,
    );
  }
}
