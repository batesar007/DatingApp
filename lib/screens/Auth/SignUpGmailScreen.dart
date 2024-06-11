import 'package:dating_app/Controllers/AuthController.dart';
import 'package:dating_app/components/Btn/CommonBtn.dart';
import 'package:dating_app/components/TextFormField/PremieryTxtField.dart';
import 'package:dating_app/main.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SignUpGmailScreen extends StatelessWidget {
  SignUpGmailScreen({super.key});
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _gamilcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final icon = AllManageData.geticon;
    final clr = AllManageData.getclr;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Gap(15),
            Center(
              child: Image.asset(
                icon.Applogo,
                color: clr.Premiery,
                height: 100,
              ),
            ),
            Gap(30),
            Premierytxtfield(
              controller: _namecontroller,
              hint_txt: "Full Name",
              prefix: Icons.person_2_rounded,
            ),
            Gap(10),
            Premierytxtfield(
              controller: _gamilcontroller,
              hint_txt: "Gmail",
              prefix: Icons.email,
            ),
            Gap(10),
            Premierytxtfield(
              controller: _passwordcontroller,
              hint_txt: "Password",
              prefix: Icons.lock,
            ),
            Gap(10),
            Row(
              children: [
                CommonBtn(
                    btn_name: "SignUp",
                    isexpanded: true,
                    onPressed: () {
                      Authcontroller().SinUp({
                        "user": _gamilcontroller.text,
                        "password": _passwordcontroller.text
                      }, context);
                    }),
              ],
            )
          ],
        ),
      )),
    );
  }
}
