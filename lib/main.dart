import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobi_authentic_firbase/screens/mob_login_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Tiler App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            // textSelectionTheme: TextSelectionThemeData(
            //   cursorColor: Color(0xfff7ee00),
            // ),
            textTheme: GoogleFonts.rubikTextTheme(Theme.of(context).textTheme)
                .copyWith(
                bodyText1: GoogleFonts.rubik(fontWeight: FontWeight.w500),
                bodyText2: GoogleFonts.rubik(fontWeight: FontWeight.w400),
                headline1: GoogleFonts.rubik(fontWeight: FontWeight.normal),
                headline2: GoogleFonts.rubik(fontWeight: FontWeight.w300)
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                primary: AppColor.appBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: Get.height * 0.024,
                ),
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColor.appBlue,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          home: LoginScreen(),
        );
      });
    });
  }
}