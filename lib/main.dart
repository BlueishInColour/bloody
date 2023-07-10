import "package:flutter/material.dart";
import 'Screens/swagr_house.dart';

main() async {
  runApp(const Swagr());
}

class Palette {
  Palette();

  final Color lightPurple = const Color.fromARGB(41, 129, 50, 219);
  //

  final Color red = const Color.fromARGB(41, 247, 3, 23);

  final Color black = const Color.fromARGB(255, 0, 0, 0);
  final Color white = const Color.fromARGB(255, 255, 255, 255);
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
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        primaryColor: palette.red,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                splashFactory: InkSparkle.splashFactory,
                shadowColor: MaterialStatePropertyAll(palette.lightPurple),
                backgroundColor: MaterialStatePropertyAll(palette.red))),
        badgeTheme: BadgeThemeData(
          backgroundColor: palette.lightPurple,
          textColor: palette.white,
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
          headerForegroundColor: palette.white,
        ),
        dialogBackgroundColor: palette.lightPurple,
        dialogTheme: DialogTheme(
          elevation: 0,
          alignment: Alignment.center,
          backgroundColor: palette.black,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,

          // shadowColor: palette.lightPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          ),
          contentTextStyle: TextStyle(color: palette.white, fontSize: 15),
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
          dividerColor: palette.lightPurple,
          shadowColor: palette.lightPurple,
          elevation: 2,
          contentTextStyle: TextStyle(color: palette.white),
        ),
        shadowColor: palette.lightPurple,
        buttonTheme: ButtonThemeData(
          buttonColor: palette.red,
          disabledColor: palette.red,
          focusColor: palette.lightPurple,
          textTheme: ButtonTextTheme.normal,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(9))),
        ),
        fontFamily: 'Geologica',
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
              iconColor: MaterialStatePropertyAll(palette.red),
              shadowColor: MaterialStatePropertyAll(palette.lightPurple),
              backgroundColor: MaterialStatePropertyAll(palette.red),
              elevation: const MaterialStatePropertyAll(0)),
        ),
        textButtonTheme: const TextButtonThemeData(
            style: ButtonStyle(
          backgroundColor:
              MaterialStatePropertyAll(Color.fromARGB(0, 231, 6, 6)),
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
                borderSide: const BorderSide(
                  color: Colors.transparent,
                )),
            counterStyle: TextStyle(
              color: palette.lightPurple,
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
          indicatorColor: Colors.transparent,
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
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
        ),
        hoverColor: palette.lightPurple,
        progressIndicatorTheme: ProgressIndicatorThemeData(
            color: palette.red, refreshBackgroundColor: palette.lightPurple),
        toggleButtonsTheme: ToggleButtonsThemeData(
            disabledColor: palette.lightPurple,
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
            shadows: [Shadow(color: palette.lightPurple, blurRadius: 10)]),
        searchBarTheme: SearchBarThemeData(
            backgroundColor: MaterialStatePropertyAll(palette.white),
            shadowColor: MaterialStatePropertyAll(palette.lightPurple),
            elevation: const MaterialStatePropertyAll(0),
            constraints: const BoxConstraints(maxHeight: 50),
            surfaceTintColor: MaterialStatePropertyAll(palette.lightPurple),
            textStyle:
                MaterialStatePropertyAll(TextStyle(color: palette.black))),
        radioTheme: RadioThemeData(
          overlayColor: MaterialStatePropertyAll(palette.red),
          fillColor: MaterialStatePropertyAll(palette.red),
        ),
        scaffoldBackgroundColor: palette.white,
        disabledColor: palette.lightPurple,
        dividerColor: palette.lightPurple,
      ),
      home: const SwagrHouse(),
    ));
  }
}
