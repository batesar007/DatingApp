import 'package:dating_app/resources/constant/colorsheet.dart';
import 'package:dating_app/resources/constant/stylesheet.dart';
import 'package:flutter/material.dart';

class Premierytxtfield extends StatefulWidget {
  String hint_txt;
  IconData? suffixicon, prefix;
  Function? suffix_onpressed, onpressed, prefix_onpressed;
  bool obscuretxt;
  bool readOnly;
  Function(String?)? validator;
  Function(String)? onChanged;

  TextEditingController? controller;
  Premierytxtfield(
      {super.key,
      required this.hint_txt,
      this.suffixicon,
      this.suffix_onpressed,
      this.onpressed,
      this.obscuretxt = false,
      this.readOnly = false,
      this.validator,
      this.controller,
      this.onChanged,this.prefix_onpressed,
      this.prefix});

  @override
  State<Premierytxtfield> createState() => _common_txtfieldState();
}

class _common_txtfieldState extends State<Premierytxtfield> {
  final font = AppTextTheme();

  final appclr = Appcolor();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (v) => setState(() {
        widget.onChanged != null ? widget.onChanged!(v.toString()) : null;
      }),
      readOnly: widget.readOnly,
      onTap: widget.onpressed != null ? () => widget.onpressed!() : null,
      controller: widget.controller,
      validator:
          widget.validator == null ? null : (value) => widget.validator!(value),
      obscureText: widget.obscuretxt,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(15),
        prefixIcon: widget.prefix == null ? null : Icon(widget.prefix),
        suffixIcon: IconButton(
            onPressed: widget.suffix_onpressed != null
                ? () => widget.suffix_onpressed!()
                : null,
            icon: Icon(widget.suffixicon)),
        hintStyle: font.fs16Medium().copyWith(color: appclr.grey),
        hintText: widget.hint_txt,
        filled: true,
        fillColor: appclr.White,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: appclr.grey, width: 0.7)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: appclr.grey, width: 0.7)),
      ),
    );
  }
}
