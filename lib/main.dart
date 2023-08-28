import "package:flutter/material.dart";
import 'screens/init/splash_screen.dart';
//import 'package:flutter_dotenv/flutter_dotenv.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //for dontenv variables of auth0

  //
  runApp(const Swagr());
}

class Palette {
  const Palette();
  final String appName = 'rubic';
  final Color amber = Colors.amber;

  final Color lightPurple = const Color.fromARGB(41, 129, 50, 219);
  final Color red = const Color.fromARGB(255, 255, 0, 21);

  final Color black = Colors.black87;
  final Color grey = const Color.fromARGB(187, 147, 148, 151);
  final Color white = const Color.fromARGB(255, 255, 255, 255);

  final Color iconColor = Colors.white;
  final Color selectedIconColor = Colors.amber;

  final Color linkTextColor = Colors.blue;
  final Color errorTextColor = Colors.red;
  final Color textColorLight = const Color.fromARGB(255, 251, 250, 250);
  final Color textColorDark = const Color.fromARGB(255, 0, 0, 0);
}

Palette palette = const Palette();

class Swagr extends StatelessWidget {
  const Swagr({super.key});

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      title: 'rubic',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            elevation: 0,
            backgroundColor: palette.black,
            foregroundColor: palette.amber,
            titleTextStyle: TextStyle(
                color: palette.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        primaryColor: palette.grey,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(palette.amber),
                foregroundColor: MaterialStatePropertyAll(palette.black),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))))),
        badgeTheme: BadgeThemeData(
          backgroundColor: palette.lightPurple,
          textColor: palette.black,
          alignment: Alignment.topRight,
          textStyle: TextStyle(color: palette.white),
          smallSize: 5,
        ),
        applyElevationOverlayColor: true,
        cardTheme: CardTheme(
          clipBehavior: Clip.antiAlias,
          color: palette.lightPurple,
          shadowColor: palette.lightPurple,
          elevation: 2,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(9),
            ),
          ),
        ),
        //  canvasColor: palette.lightPurple,
        checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStatePropertyAll(palette.red),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
          splashRadius: 10,
          overlayColor: MaterialStatePropertyAll(palette.lightPurple),
        ),
        datePickerTheme: DatePickerThemeData(
          backgroundColor: palette.lightPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          ),
          elevation: 2,
          headerBackgroundColor: palette.lightPurple,
          headerForegroundColor: palette.black,
        ),
        dialogBackgroundColor: palette.lightPurple,
        dialogTheme: DialogTheme(
          elevation: 0,
          alignment: Alignment.center,
          backgroundColor: palette.white,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,

          // shadowColor: palette.lightPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          ),
          contentTextStyle: TextStyle(color: palette.black, fontSize: 15),
          iconColor: palette.red,
        ),
        dividerTheme: DividerThemeData(
          color: palette.white,
          indent: 12,
          endIndent: 12,
        ),
        splashColor: palette.lightPurple,
        //  primarySwatch: Colors.amber,
        // cardColor: palette.lightPurple,
        bannerTheme: MaterialBannerThemeData(
          // backgroundColor: palette.lightPurple,
          dividerColor: palette.lightPurple,
          shadowColor: palette.lightPurple,
          elevation: 2,
          contentTextStyle: TextStyle(color: palette.black),
        ),
        shadowColor: palette.lightPurple,
        buttonTheme: ButtonThemeData(
          buttonColor: palette.white,
          disabledColor: palette.white,
          focusColor: palette.lightPurple,
          textTheme: ButtonTextTheme.normal,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(9))),
        ),
        fontFamily: 'Geologica',
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            iconColor: MaterialStatePropertyAll(palette.white),
            shadowColor: MaterialStatePropertyAll(palette.grey),
            backgroundColor: MaterialStatePropertyAll(palette.grey),

            //  elevation: const MaterialStatePropertyAll(0)
          ),
        ),
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
                backgroundColor:
                    const MaterialStatePropertyAll(Colors.transparent),
                foregroundColor: MaterialStatePropertyAll(palette.white),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))))),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: const TextStyle(
            color: Colors.transparent,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          hintStyle: TextStyle(
            color: palette.white,
          ),
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: const BorderSide(
                color: Colors.transparent,
              )),
          counterStyle: TextStyle(
            color: palette.lightPurple,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: const BorderSide(
              color: Colors.white,
              style: BorderStyle.none,
              strokeAlign: BorderSide.strokeAlignCenter,
              // width: BorderSide.strokeAlignInside,
            ),
          ),
          //focusColor: palette.grey,
          //fillColor: palette.grey,
          //hoverColor: palette.grey,
        ),

        dropdownMenuTheme: DropdownMenuThemeData(
            inputDecorationTheme: InputDecorationTheme(
                constraints: const BoxConstraints(maxHeight: 37, maxWidth: 120),
                fillColor: palette.grey,
                hoverColor: palette.grey,
                focusColor: palette.grey,
                counterStyle: TextStyle(color: palette.black),
                floatingLabelStyle: TextStyle(color: palette.black),
                filled: true,
                helperStyle: TextStyle(color: palette.black),
                hintStyle: TextStyle(color: palette.black),
                labelStyle: TextStyle(
                  color: palette.black,
                )),
            menuStyle: MenuStyle(
                alignment: Alignment.center,
                backgroundColor: MaterialStatePropertyAll(palette.black),
                surfaceTintColor: MaterialStatePropertyAll(palette.black)),
            textStyle: TextStyle(color: palette.white, fontSize: 14)),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: palette.black,
          elevation: 0,
          height: 50,
          surfaceTintColor: palette.white,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          indicatorColor: Colors.transparent,
        ),
        bottomSheetTheme: BottomSheetThemeData(
          modalBackgroundColor: palette.black,
          backgroundColor: palette.black,
        ),
        indicatorColor: palette.black,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: palette.black,
          elevation: 0,
          showUnselectedLabels: false,
          showSelectedLabels: true,
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          type: BottomNavigationBarType.shifting,
          selectedItemColor: palette.selectedIconColor,
          unselectedItemColor: palette.iconColor,
          selectedIconTheme:
              IconThemeData(color: palette.selectedIconColor, size: 30),
          unselectedIconTheme: IconThemeData(
            color: palette.iconColor,
          ),
        ),
        hoverColor: Colors.transparent,
        progressIndicatorTheme: ProgressIndicatorThemeData(
            color: palette.white, refreshBackgroundColor: palette.grey),
        toggleButtonsTheme: ToggleButtonsThemeData(
            disabledColor: palette.lightPurple,
            borderColor: palette.red,
            selectedBorderColor: palette.red),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: palette.white,
          actionTextColor: palette.black,

          closeIconColor: palette.red,
          //behavior: SnackBarBehavior.fixed,
          contentTextStyle: TextStyle(color: palette.white),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(9))),
        ),
        iconTheme: IconThemeData(
            color: palette.white,
            fill: 0.5,
            shadows: [Shadow(color: palette.lightPurple, blurRadius: 10)]),
        searchBarTheme: SearchBarThemeData(
            backgroundColor: MaterialStatePropertyAll(palette.amber),
            shadowColor: MaterialStatePropertyAll(palette.amber),
            elevation: const MaterialStatePropertyAll(0),
            constraints: const BoxConstraints(maxHeight: 50),
            surfaceTintColor: MaterialStatePropertyAll(palette.lightPurple),
            textStyle:
                MaterialStatePropertyAll(TextStyle(color: palette.white))),
        radioTheme: RadioThemeData(
          overlayColor: MaterialStatePropertyAll(palette.red),
          fillColor: MaterialStatePropertyAll(palette.red),
        ),
        scaffoldBackgroundColor: palette.black,
        disabledColor: palette.lightPurple,
        dividerColor: palette.white,
      ),
      home: const SplashScreen(),
    ));
  }
}
