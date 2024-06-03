import 'package:dating_app/resources/constant/colorsheet.dart';
import 'package:dating_app/resources/constant/stylesheet.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Dropdownfield_premray extends StatefulWidget {
  List<String> items = [];
  Function(String?) onChanged;
  String? title;
  String hint;
  TextEditingController? controller;

  Dropdownfield_premray(
      {super.key,
      required this.onChanged,
      required this.items,
      this.title,
      required this.hint,
      this.controller});

  @override
  State<Dropdownfield_premray> createState() => _Dropdownfield_premrayState();
}

class _Dropdownfield_premrayState extends State<Dropdownfield_premray> {
  final font = AppTextTheme();

  final appclr = Appcolor();

  String? listindex;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.title == null
            ? SizedBox()
            : Text(
                widget.title!,
                style: font.fs16Medium(),
              ),
        Gap(8),
        DropdownButtonFormField(
          // dropdownColor: AppColor.yellow,
          //   focusColor: AppColor.yellow,
          icon: Icon(
            Icons.swap_vert,
            color: appclr.Premiery,
          ),
          hint: Text(
            widget.hint,
            style: font.fs16Medium().copyWith(color: appclr.grey),
          ),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 15),
              fillColor: appclr.White,
              filled: true,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: appclr.grey)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: appclr.grey))),
          isDense: true,
          isExpanded: true,
          itemHeight: 50,
          value: listindex,
          items: widget.items
              .map(
                (e) => DropdownMenuItem(
                  child: Text(e),
                  value: e,
                ),
              )
              .toList(),
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}
