import 'dart:io';

import 'package:dating_app/components/Btn/CommonBtn.dart';
import 'package:dating_app/components/DropDown/DropDownField.dart';
import 'package:dating_app/components/ImgPicker/PremieryImgPicker.dart';
import 'package:dating_app/components/TextFormField/PremieryTxtField.dart';
import 'package:dating_app/resources/constant/AppService.dart';
import 'package:dating_app/resources/constant/ImgPath.dart';
import 'package:dating_app/resources/constant/colorsheet.dart';
import 'package:dating_app/resources/constant/stylesheet.dart';
import 'package:dating_app/screens/LocationScreen.dart';
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
  String? listindex;
  String? showindex;
  File? imageFile;
  String image = "";
  final TextEditingController _dobcontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _universitycontroller = TextEditingController();
  final TextEditingController _addresscontroller = TextEditingController();
  // final TextEditingController _gendercontroller = TextEditingController();
  // final TextEditingController _showprofilecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(20),
              Text(
                "Please!\nFill Your Detials",
                style: font.fs24SemiBold(),
              ),
              Gap(30),
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
                                        color: appclr.grey,
                                        shape: BoxShape.circle),
                                    child: Icon(
                                      Icons.person,
                                      color: appclr.White,
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
                              color: appclr.Premiery, shape: BoxShape.circle),
                          child: Icon(
                            Icons.camera_alt,
                            color: appclr.White,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(30),
              Premierytxtfield(
                controller: _namecontroller,
                title: "Enter Your Name",
                hint_txt: "Full Name",
                prefix: Icons.person_rounded,
              ),
              Gap(10),
              Premierytxtfield(
                controller: _dobcontroller,
                title: "Date of Brith",
                onpressed: () {
                  selectDatepicker(context);
                },
                hint_txt: "DOB",
                prefix: Icons.calendar_month,
                readOnly: true,
              ),
              Gap(10),
              Premierytxtfield(
                controller: _universitycontroller,
                title: "Enter Your University",
                hint_txt: "University",
                prefix: Icons.menu_book_rounded,
              ),
              Gap(10),
              Premierytxtfield(
                controller: _addresscontroller,
                title: "Enter Your Address",
                hint_txt: "Address",
                prefix: Icons.location_on_outlined,
              ),
              Gap(10),
              Dropdownfield_premray(
                hint: "Gender",
                title: "Select Your Gender",
                items: listGender,
                onChanged: (p0) {
                  setState(() {
                    showindex = p0!;
                  });
                },
              ),
              Gap(10),
              Dropdownfield_premray(
                hint: "Choose One",
                title: "Show Your Profile ?",
                items: listshow,
                onChanged: (p0) {
                  setState(() {
                    listindex = p0!;
                  });
                },
              ),
              Gap(30),
              Row(
                children: [
                  CommonBtn(
                      btn_name: "Continue",
                      isexpanded: true,
                      onPressed: () {
                        App_service(context).pushTo(LocationScreen());
                      }),
                ],
              ),
              Gap(20),
            ],
          ),
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
        _dobcontroller.text = "${selectedDate.toLocal()}".split(' ')[0];
        selectedDate = picked;
      });
    }
  }
}
