import 'package:dating_app/resources/components/Btn/CommonBtn.dart';
import 'package:dating_app/resources/components/TextFormField/PremieryTxtField.dart';
import 'package:dating_app/resources/constant/ImgPath.dart';
import 'package:dating_app/resources/constant/colorsheet.dart';
import 'package:dating_app/resources/constant/stylesheet.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

var listGender = ["Male", "Female", "Other"];
var listshow = ["Men", "Women", "Everyone"];

class UserDetialScreen extends StatefulWidget {
  UserDetialScreen({super.key});

  @override
  State<UserDetialScreen> createState() => _UserDetialScreenState();
}

class _UserDetialScreenState extends State<UserDetialScreen> {
  final appimg = Appimg();

  final font = AppTextTheme();

  final appclr = Appcolor();
  DateTime selectedDate = DateTime.now();
  var listindex = listGender[0];
  var showindex = listshow[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(20),
            Text(
              "Please!\nFill Your Detials",
              style: font.fs24SemiBold(),
            ),
            Gap(30),
            Premierytxtfield(
              hint_txt: "Full Name",
              prefix: Icons.person_rounded,
            ),
            Gap(10),
            Premierytxtfield(
              onpressed: () {
                selectDatepicker(context);
              },
              hint_txt: "${selectedDate.toLocal()}".split(' ')[0],
              prefix: Icons.calendar_month,
              readOnly: true,
            ),
            Gap(10),
            Premierytxtfield(
              hint_txt: "University",
              prefix: Icons.menu_book_rounded,
            ),
            Gap(10),
            DropdownButtonFormField(
                // dropdownColor: AppColor.yellow,
                //   focusColor: AppColor.yellow,
                icon: Icon(Icons.swap_vert),
                hint: Text("Enter Your Gender"),
                decoration: InputDecoration(
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
                items: listGender
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (u) {
                  setState(() {
                    listindex = u!;
                  });
                }),
            Gap(10),
            DropdownButtonFormField(
                // dropdownColor: AppColor.yellow,
                //   focusColor: AppColor.yellow,
                icon: Icon(Icons.swap_vert),
                hint: Text("Show Me"),
                decoration: InputDecoration(
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
                value: showindex,
                items: listshow
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (u) {
                  setState(() {
                    showindex = u!;
                  });
                }),
            Gap(30),
            Row(
              children: [
                CommonBtn(
                    btn_name: "Continue", isexpanded: true, onPressed: () {}),
              ],
            )
          ],
        ),
      )),
    );
  }

  Future<void> selectDatepicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1965, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}
