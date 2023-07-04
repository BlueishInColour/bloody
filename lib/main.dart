import "package:flutter/material.dart";
import 'Screens/swagr_house.dart';

main() async {
  runApp(const Swagr());
}

class Palette {
  Palette();
  final Color red = const Color.fromARGB(239, 240, 15, 15);
  final Color lightRed = const Color.fromARGB(82, 240, 15, 15);

  final Color purple = const Color.fromARGB(255, 129, 50, 219);
  final Color lightPurple = const Color.fromARGB(41, 129, 50, 219);

  final Color black = const Color.fromARGB(255, 0, 0, 0);
  final Color white = const Color.fromARGB(255, 255, 255, 255);

  final Color grey = const Color.fromARGB(255, 72, 72, 73);
  final Color lightGrey = const Color.fromARGB(36, 72, 72, 73);

  final Color blue = const Color.fromARGB(255, 30, 15, 240);
  final Color lightBlue = const Color.fromARGB(78, 30, 15, 240);
}

final palette = Palette();

class Swagr extends StatelessWidget {
  const Swagr({super.key});

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      title: 'Swagr',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            elevation: 0,
            backgroundColor: palette.white,
            foregroundColor: palette.black,
            titleTextStyle: TextStyle(
                color: palette.black,
                fontSize: 30,
                fontWeight: FontWeight.bold)),
        primaryColor: palette.red,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                splashFactory: InkSparkle.splashFactory,
                shadowColor: MaterialStatePropertyAll(palette.grey),
                backgroundColor: MaterialStatePropertyAll(palette.red))),
        badgeTheme: BadgeThemeData(
          backgroundColor: palette.purple,
          textColor: palette.white,
          alignment: Alignment.topRight,
          textStyle: TextStyle(color: palette.white),
          smallSize: 5,
        ),
        applyElevationOverlayColor: true,
        cardTheme: CardTheme(
          clipBehavior: Clip.antiAlias,
          color: palette.lightPurple,
          shadowColor: palette.lightGrey,
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
          headerBackgroundColor: palette.purple,
          headerForegroundColor: palette.white,
        ),
        dialogBackgroundColor: palette.lightPurple,
        dialogTheme: DialogTheme(
          elevation: 2,
          alignment: Alignment.center,
          backgroundColor: palette.lightPurple,
          // shadowColor: palette.lightGrey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          ),
          contentTextStyle: TextStyle(color: palette.black),
          iconColor: palette.red,
        ),
        dividerTheme: DividerThemeData(
          color: palette.lightPurple,
          indent: 12,
          endIndent: 12,
        ),
        splashColor: palette.lightPurple,
        primarySwatch: Colors.brown,
        // cardColor: palette.lightPurple,
        bannerTheme: MaterialBannerThemeData(
          // backgroundColor: palette.lightPurple,
          dividerColor: palette.lightGrey,
          shadowColor: palette.lightGrey,
          elevation: 2,
          contentTextStyle: TextStyle(color: palette.white),
        ),
        shadowColor: palette.lightGrey,
        buttonTheme: ButtonThemeData(
          buttonColor: palette.red,
          disabledColor: palette.red,
          focusColor: palette.purple,
          textTheme: ButtonTextTheme.normal,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(9))),
        ),
        fontFamily: 'Geologica',
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
              iconColor: MaterialStatePropertyAll(palette.red),
              shadowColor: MaterialStatePropertyAll(palette.lightGrey),
              backgroundColor: MaterialStatePropertyAll(palette.red),
              elevation: const MaterialStatePropertyAll(2)),
        ),
        textButtonTheme: const TextButtonThemeData(
            style: ButtonStyle(
          backgroundColor:
              MaterialStatePropertyAll(Color.fromARGB(0, 231, 6, 6)),
          padding:
              MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 20)),
          elevation: MaterialStatePropertyAll(2),
        )),
        inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(
              color: palette.white,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            hintStyle: TextStyle(
              color: palette.white,
            ),
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
                borderSide: BorderSide(
                  color: Colors.transparent,
                )),
            counterStyle: TextStyle(
              color: palette.purple,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: const BorderSide(
                color: Colors.transparent,
                style: BorderStyle.none,
                strokeAlign: BorderSide.strokeAlignCenter,
                // width: BorderSide.strokeAlignInside,
              ),
            ),
            focusColor: Colors.black,
            fillColor: Colors.transparent,
            hoverColor: Colors.black),

        dropdownMenuTheme: DropdownMenuThemeData(
            inputDecorationTheme: InputDecorationTheme(
                fillColor: palette.lightPurple,
                counterStyle: TextStyle(color: palette.white),
                floatingLabelStyle: TextStyle(color: palette.white),
                filled: true,
                helperStyle: TextStyle(color: palette.white),
                hintStyle: TextStyle(color: palette.white),
                labelStyle: TextStyle(
                  color: palette.white,
                )),
            menuStyle: MenuStyle(
                alignment: Alignment.center,
                backgroundColor: MaterialStatePropertyAll(palette.white),
                surfaceTintColor: MaterialStatePropertyAll(palette.white)),
            textStyle: TextStyle(color: palette.black)),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: palette.white,
          elevation: 0,
          height: 50,
          surfaceTintColor: palette.black,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          indicatorColor: palette.lightPurple,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: palette.white,
          elevation: 0,
          showUnselectedLabels: false,
          showSelectedLabels: true,
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          type: BottomNavigationBarType.shifting,
          selectedItemColor: palette.red,
          unselectedItemColor: palette.black,
          selectedIconTheme: IconThemeData(color: palette.red, size: 30),
          unselectedIconTheme: const IconThemeData(
            color: Color.fromRGBO(60, 12, 219, 0.475),
          ),
        ),
        hoverColor: palette.lightPurple,
        progressIndicatorTheme: ProgressIndicatorThemeData(
            color: palette.red, refreshBackgroundColor: palette.lightPurple),
        toggleButtonsTheme: ToggleButtonsThemeData(
            disabledColor: palette.lightGrey,
            borderColor: palette.red,
            selectedBorderColor: palette.red),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: palette.lightPurple,
          actionTextColor: palette.black,
          closeIconColor: palette.red,
          //behavior: SnackBarBehavior.fixed,
          contentTextStyle: TextStyle(color: palette.black),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(9))),
        ),
        iconTheme: IconThemeData(
            color: palette.red,
            fill: 0.5,
            shadows: [Shadow(color: palette.lightGrey, blurRadius: 10)]),
        searchBarTheme: SearchBarThemeData(
            backgroundColor: MaterialStatePropertyAll(palette.white),
            shadowColor: MaterialStatePropertyAll(palette.lightGrey),
            elevation: MaterialStatePropertyAll(0),
            constraints: BoxConstraints(maxHeight: 50),
            surfaceTintColor: MaterialStatePropertyAll(palette.lightPurple),
            textStyle:
                MaterialStatePropertyAll(TextStyle(color: palette.black))),
        radioTheme: RadioThemeData(
          overlayColor: MaterialStatePropertyAll(palette.red),
          fillColor: MaterialStatePropertyAll(palette.red),
        ),
        scaffoldBackgroundColor: palette.white,
        disabledColor: palette.lightPurple,
        dividerColor: palette.lightGrey,
      ),
      home: const SwagrHouse(),
    ));
  }
}
