import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const mobileBackgroundColor = Color.fromRGBO(0, 0, 0, 1);
const mobileBottomMenuBarColor = Color.fromRGBO(20, 58, 38, 0.612);
const webBackgroundColor = Color.fromRGBO(18, 18, 18, 1);
const mobileSearchColor = Color.fromRGBO(38, 38, 38, 1);

const highlightColor = Color.fromRGBO(248, 244, 213, 0.914);
const primaryColor = Color.fromRGBO(94, 133, 165, 1);
const secondaryColor = Color.fromRGBO(11, 67, 131, 0.612);
const thirdColor = Color.fromRGBO(48, 69, 95, 0.612);
const whiteColor = Colors.white;
const blackColor = Colors.black;
const blueColor = Color.fromARGB(255, 25, 111, 182);
const redColor = Color.fromARGB(255, 175, 48, 39);
const lightRedColor = Color.fromARGB(255, 223, 62, 50);
const greenColor = Color.fromARGB(255, 22, 255, 30);
const greyColor = Color.fromARGB(255, 196, 196, 196);
const bottomBarNoHovering = Color.fromARGB(255, 156, 156, 156);
const myBubbleColor = Color.fromRGBO(18, 60, 100, 1);
const orangeColor = Colors.orange;
const bubbleGeyColor = Color.fromARGB(255, 167, 221, 243);

const headTitle = TextStyle(
  color: blueColor,
  fontSize: 80,
);

const headSecondary = TextStyle(
  color: blueColor,
  fontSize: 40,
);
const headThird = TextStyle(
  color: blackColor,
  fontSize: 30,
);

const contentFont = TextStyle(
  color: blackColor,
  fontSize: 20,
);

class AppColors {
  static Color bgColor = Color.fromARGB(255, 0, 33, 56);
  static Color cardColor = Color.fromARGB(255, 0, 86, 143);
  static Color buttonColor = Color.fromARGB(255, 0, 119, 199);
}

class AppTextStyles {
  static TextStyle headerTextStyle() {
    return GoogleFonts.signikaNegative(
        fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white);
  }

  static TextStyle titleStyle() {
    return GoogleFonts.notoSans(
        fontSize: 24, fontWeight: FontWeight.w400, color: Colors.white);
  }

  static TextStyle titleMiniStyle() {
    return GoogleFonts.notoSans(
        fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white);
  }

  static TextStyle introStyle() {
    return GoogleFonts.notoSans(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Color.fromARGB(255, 168, 168, 168));
  }

  static TextStyle copyRightStyle() {
    return GoogleFonts.notoSans(
        fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey);
  }

  static TextStyle nameHeadingStyle() {
    return GoogleFonts.notoSans(
        fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white);
  }

  static TextStyle nameMiniHeadingStyle() {
    return GoogleFonts.notoSans(
        fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white);
  }

  static TextStyle skillsStyle() {
    return GoogleFonts.notoSans(
        fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white);
  }

  static TextStyle menuStyle() {
    return GoogleFonts.notoSans(fontSize: 20, fontWeight: FontWeight.w300);
  }

  static TextStyle menuMiniStyle() {
    return GoogleFonts.notoSans(fontSize: 18, fontWeight: FontWeight.w300);
  }

  static TextStyle cardTitletyle() {
    return GoogleFonts.nunito(
        fontSize: 22, fontWeight: FontWeight.w400, color: Colors.white);
  }

  static TextStyle cardDescStyle() {
    return GoogleFonts.nunito(
        fontSize: 18, fontWeight: FontWeight.w300, color: Colors.white);
  }

  static TextStyle cardSkillsStyle() {
    return GoogleFonts.nunito(
        fontSize: 18, fontWeight: FontWeight.w300, color: Colors.white);
  }

  static TextStyle aboutStyle() {
    return GoogleFonts.montserrat(
        fontSize: 18, fontWeight: FontWeight.w300, color: Colors.white);
  }

  static TextStyle buttonStyle() {
    return GoogleFonts.notoSans(
        fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white);
  }

  static TextStyle downloadButtonStyle() {
    return GoogleFonts.nunito(
      fontSize: 20,
      fontWeight: FontWeight.w300,
      color: Colors.white,
      decoration: TextDecoration.underline,
    );
  }
}
