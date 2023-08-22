import "package:flutter/material.dart";
import 'screens/splash_screen.dart';
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

  final Color lightPurple = const Color.fromARGB(41, 129, 50, 219);
  final Color red = const Color.fromARGB(255, 255, 0, 21);

  final Color black = Colors.black87;
  final Color grey = const Color.fromARGB(179, 238, 234, 234);
  final Color white = const Color.fromARGB(255, 255, 255, 255);
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
            backgroundColor: palette.white,
            foregroundColor: palette.black,
            titleTextStyle: TextStyle(
                color: palette.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        primaryColor: palette.grey,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                splashFactory: InkSparkle.splashFactory,
                shadowColor: MaterialStatePropertyAll(palette.lightPurple),
                backgroundColor: MaterialStatePropertyAll(palette.grey))),
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
        //  primarySwatch: Colors.amber,
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
          buttonColor: palette.black,
          disabledColor: palette.black,
          focusColor: palette.lightPurple,
          textTheme: ButtonTextTheme.normal,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(9))),
        ),
        fontFamily: 'Geologica',
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            iconColor: MaterialStatePropertyAll(palette.black),
            shadowColor: MaterialStatePropertyAll(palette.grey),
            backgroundColor: MaterialStatePropertyAll(palette.grey),

            //  elevation: const MaterialStatePropertyAll(0)
          ),
        ),
        textButtonTheme: const TextButtonThemeData(
            style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Color.fromARGB(0, 0, 0, 0)),
          foregroundColor: MaterialStatePropertyAll(Colors.white),
        )),
        inputDecorationTheme: InputDecorationTheme(
            labelStyle: const TextStyle(
              color: Colors.transparent,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            hintStyle: TextStyle(
              color: palette.black,
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
            focusColor: palette.grey,
            fillColor: palette.grey,
            hoverColor: palette.grey),

        dropdownMenuTheme: DropdownMenuThemeData(
            inputDecorationTheme: InputDecorationTheme(
                constraints: const BoxConstraints(maxHeight: 37, maxWidth: 120),
                fillColor: palette.grey,
                hoverColor: palette.grey,
                focusColor: palette.grey,
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
            textStyle: TextStyle(color: palette.black, fontSize: 14)),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: palette.white,
          elevation: 0,
          height: 50,
          surfaceTintColor: palette.black,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          indicatorColor: Colors.transparent,
        ),
        bottomSheetTheme: BottomSheetThemeData(
          modalBackgroundColor: palette.black,
        ),
        indicatorColor: palette.white,
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
        hoverColor: Colors.transparent,
        progressIndicatorTheme: ProgressIndicatorThemeData(
            color: palette.black, refreshBackgroundColor: palette.grey),
        toggleButtonsTheme: ToggleButtonsThemeData(
            disabledColor: palette.lightPurple,
            borderColor: palette.red,
            selectedBorderColor: palette.red),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: palette.black,
          actionTextColor: palette.white,

          closeIconColor: palette.red,
          //behavior: SnackBarBehavior.fixed,
          contentTextStyle: TextStyle(color: palette.black),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(9))),
        ),
        iconTheme: IconThemeData(
            color: palette.black,
            fill: 0.5,
            shadows: [Shadow(color: palette.lightPurple, blurRadius: 10)]),
        searchBarTheme: SearchBarThemeData(
            backgroundColor: MaterialStatePropertyAll(palette.white),
            shadowColor: MaterialStatePropertyAll(palette.grey),
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
      home: const SplashScreen(),
    ));
  }
}
