import 'dart:io';

import 'package:dating_app/main.dart';
import 'package:dating_app/resources/components/Btn/CommonBtn.dart';
import 'package:dating_app/resources/components/DropDown/DropDownField.dart';
import 'package:dating_app/resources/components/ImgPicker/PremieryImgPicker.dart';
import 'package:dating_app/resources/components/TextFormField/PremieryTxtField.dart';
import 'package:dating_app/resources/constant/AppService.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

var listGender = ["Male", "Female", "Other"];
var listshow = ["Men", "Women", "Everyone"];

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

String? listindex;
String? showindex;
File? imageFile;
String image = "";
DateTime selectedDate = DateTime.now();

class _ProfileScreenState extends State<ProfileScreen> {
  final clr = AllManageData.getclr;
  final img = AllManageData.getimg;
  final font = AllManageData.getfont;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
        child: Row(
          children: [
            CommonBtn(btn_name: "Save", isexpanded: true, onPressed: () {}),
          ],
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Gap(10),
              Center(
                  child: Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: imageFile == null
                          ? (image.isEmpty
                              ? Container(
                                  padding: EdgeInsets.all(9),
                                  decoration: BoxDecoration(
                                      color: clr.grey, shape: BoxShape.circle),
                                  child: Icon(
                                    Icons.person,
                                    color: clr.White,
                                    size: 90,
                                  ))
                              : Image.network(
                                  image,
                                  height: 120,
                                  width: 120,
                                  fit: BoxFit.cover,
                                ))
                          : Image.file(
                              File(imageFile!.path),
                              height: 120,
                              width: 120,
                              fit: BoxFit.cover,
                            )),
                  Positioned(
                    bottom: 3,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) =>
                                imagePickerbottomsheet(context, (v) {
                                  if (v.path.isNotEmpty) {
                                    setState(() {
                                      imageFile = v;
                                    });
                                  } else {
                                    null;
                                  }
                                }, () {
                                  App_service(context).popTo();
                                  setState(() {
                                    imageFile = null;
                                  });
                                }));
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: clr.Premiery, shape: BoxShape.circle),
                        child: Icon(
                          Icons.edit,
                          color: clr.White,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
              Gap(15),
              Text(
                "User name ya phn number",
                style: font.fs16SemiBold(),
              ),
              Text(
                "Phone Number",
                style: font.fs16SemiBold(),
              ),
              Gap(20),
              Premierytxtfield(
                hint_txt: "name",
                prefix: Icons.person_2,
              ),
              Gap(6),
              Premierytxtfield(
                // controller: _dobcontroller,

                onpressed: () {
                  // selectDatepicker(context);
                },
                hint_txt: "DOB",
                prefix: Icons.calendar_month,
                readOnly: true,
              ),
              Gap(6),
              Premierytxtfield(
                hint_txt: "University",
                prefix: Icons.menu_book_rounded,
              ),
              Gap(6),
              Premierytxtfield(
                hint_txt: "Address",
                prefix: Icons.location_on,
              ),
              Gap(6),
              Dropdownfield_premray(
                hint: "Gender",
                items: listGender,
                onChanged: (p0) {
                  setState(() {
                    showindex = p0!;
                  });
                },
              ),
              Gap(6),
              Dropdownfield_premray(
                hint: "Choose One",
                items: listshow,
                onChanged: (p0) {
                  setState(() {
                    listindex = p0!;
                  });
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
  //   Future<void> selectDatepicker(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //       context: context,
  //       initialDate: selectedDate,
  //       firstDate: DateTime(1965, 8),
  //       lastDate: DateTime(2101));
  //   if (picked != null && picked != selectedDate) {
  //     setState(() {
  //       _dobcontroller.text = "${selectedDate.toLocal()}".split(' ')[0];
  //       selectedDate = picked;
  //     });
  //   }
  // }
}
