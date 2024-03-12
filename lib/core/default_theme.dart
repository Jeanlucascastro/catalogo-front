import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Azul InfoSolutions #2F54A3
var infoBlue = const Color.fromRGBO(47, 84, 163, 1); //#2F54A3
var infoBlueLight = const Color.fromRGBO(69, 121, 231, 1); // #4579e7

// Laranja iCeasa
var infoLaranjaEscuro = const Color.fromRGBO(245, 134, 52, 1); // #F58634
var infoLaranjaClaro = const Color.fromRGBO(254, 195, 43, 1); // #FEC32b

ThemeData themeDefault = ThemeData(
  useMaterial3: false,
  platform: TargetPlatform.iOS,
  appBarTheme: const AppBarTheme(
    elevation: 1,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      letterSpacing: -0.8,
    ),
  ),
  fontFamily: GoogleFonts.openSans().fontFamily,
  colorScheme: ColorScheme.fromSwatch().copyWith(primary: infoBlue),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: infoBlue,
      disabledForegroundColor: Colors.grey.withOpacity(0.38),
      disabledBackgroundColor: infoBlue.withOpacity(0.7),
    ),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: infoBlue,
    textTheme: ButtonTextTheme.primary,
    shape: const RoundedRectangleBorder(),
  ),
  checkboxTheme: CheckboxThemeData(
    // The color that fills the checkbox
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (!states.contains(MaterialState.selected)) {
        return Colors.transparent;
      }
      return null;
    }),
    //The color to use for the check icon when this checkbox is checked
    checkColor: MaterialStateProperty.all(Colors.white),
    //shape: CircleBorder(), // diplay checkbox with circle shape
    // shape: RoundedRectangleBorder(
    //   borderRadius:
    //       BorderRadius.circular(5), // or make the border slightly rounded
    // ),
    side: MaterialStateBorderSide.resolveWith(
      (states) => const BorderSide(width: 1.3, color: Color.fromARGB(255, 54, 52, 52)),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
    fillColor: Colors.grey.shade100,
    focusColor: Colors.grey.shade200,
    filled: true,
    // this.errorBorder,
    // this.focusedBorder,
    // this.focusedErrorBorder,
    // this.disabledBorder,
    // this.enabledBorder,
    // this.border,
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide: const BorderSide(
        color: Colors.red,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide: const BorderSide(
        color: Colors.red,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide: const BorderSide(
        color: Colors.white70,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide: BorderSide(
        color: infoBlue,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide: BorderSide(
        color: Colors.grey.shade400,
        width: 1.0,
      ),
    ),
    hintStyle: TextStyle(
      color: Colors.grey.shade300,
    ),
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    // floatingLabelStyle: TextStyle(
    //   color: Colors.grey.shade300,
    // ),
  ),
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) return Colors.grey.shade400;
        if (states.contains(MaterialState.selected)) return infoBlue;
        return Colors.white; // Default color
      },
    ),
    trackColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) return Colors.grey.shade300;
        if (states.contains(MaterialState.selected)) return infoBlue.withOpacity(0.5);
        return Colors.grey.shade400;
      },
    ),
  ),
);

class MyButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color buttonColor;
  final bool isDisabled;
  final Function() onPressed;
  const MyButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.buttonColor = Colors.green,
    this.textColor = Colors.white,
    this.isDisabled = false,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: infoBlue,
      minWidth: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      onPressed: isDisabled ? null : onPressed,
      disabledColor: infoBlue.withOpacity(0.5),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: textColor, fontSize: 18),
      ),
    );
  }
}

TextStyle buttonTextStyle = const TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w500,
  letterSpacing: -0.8,
);

TextStyle numberTextStyle = TextStyle(
  fontFamily: GoogleFonts.robotoSlab().fontFamily,
);

// TODO: Copiar o 'buttonThemeStyleRed' e fazer o estado disabled
var buttonThemeStyleGrey = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(Colors.grey.shade50),
  side: MaterialStateProperty.all(
    BorderSide(width: 1, color: Colors.grey.shade300),
  ),
);

// TODO: Copiar o 'buttonThemeStyleRed' e fazer o estado disabled
var buttonThemeStyleBlue = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(infoBlueLight),
  side: MaterialStateProperty.all(
    BorderSide(width: 1, color: infoBlue),
  ),
);

// TODO: Copiar o 'buttonThemeStyleRed' e fazer o estado disabled
var buttonThemeStyleOrange = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(Colors.orange.shade50),
  side: MaterialStateProperty.all(
    BorderSide(width: 1, color: Colors.orange.shade200),
  ),
  foregroundColor: MaterialStateColor.resolveWith((states) {
    if (states.contains(MaterialState.disabled)) {
      return Colors.orange.shade400;
    }
    return Colors.orange.shade600;
  }),
);

// Disabled enabled
var buttonThemeStyleRed = ButtonStyle(
  side: MaterialStateProperty.resolveWith<BorderSide>((Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return BorderSide(width: 1, color: Colors.grey.shade300); // Disabled state border color
    }
    return BorderSide(width: 1, color: Colors.red.shade200); // Default/normal state border color
  }),
  backgroundColor: MaterialStateColor.resolveWith((states) {
    if (states.contains(MaterialState.disabled)) {
      return Colors.grey.shade100;
    }
    return Colors.red.shade50;
  }),
  foregroundColor: MaterialStateColor.resolveWith((states) {
    if (states.contains(MaterialState.disabled)) {
      return Colors.grey.shade400;
    }
    return Colors.red.shade600;
  }),
);
