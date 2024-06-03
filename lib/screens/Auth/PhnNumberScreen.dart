import 'package:dating_app/components/Btn/CommonBtn.dart';
import 'package:dating_app/resources/constant/AppService.dart';
import 'package:dating_app/resources/constant/ImgPath.dart';
import 'package:dating_app/resources/constant/colorsheet.dart';
import 'package:dating_app/resources/constant/stylesheet.dart';
import 'package:dating_app/screens/Auth/OtpScreen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhnNumberScreen extends StatelessWidget {
  PhnNumberScreen({super.key});
  final appimg = Appimg();
  final font = AppTextTheme();
  final appclr = Appcolor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(child: Image.asset(appimg.Phnimg)),
                Text(
                  "Verify Your Number",
                  style: font.fs24SemiBold().copyWith(color: appclr.Premiery),
                ),
                Gap(10),
                Text(
                  "Please enter Your mobile Number to receive a verification code. Message and data rates may apply",
                  textAlign: TextAlign.center,
                ),
                IntlPhoneField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsetsDirectional.only(top: 13),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: appclr.Premiery)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: appclr.Premiery))),
                  initialCountryCode: 'IN',
                  onChanged: (phone) {
                    print(phone.completeNumber);
                  },
                ),
                Gap(20),
                Row(
                  children: [
                    CommonBtn(
                        btn_name: "CONTiNUE",
                        isexpanded: true,
                        onPressed: () {
                          App_service(context).pushTo(Otpscreen());
                        }),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
