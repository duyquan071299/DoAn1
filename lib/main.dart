import 'dart:io';
import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:best_flutter_ui_templates/fitness_app/my_diary/Components/BodyProvider.dart';
import 'package:flutter/material.dart';
import 'package:best_flutter_ui_templates/fitness_app/my_diary/booking_page.dart';
import 'package:best_flutter_ui_templates/fitness_app/my_diary/store_page.dart';
import 'package:best_flutter_ui_templates/fitness_app/my_diary/calendar_page.dart';
import 'package:flutter/services.dart';
import 'package:best_flutter_ui_templates/fitness_app/fitness_app_home_screen.dart';
import 'package:provider/provider.dart';

import 'fitness_app/my_diary/Components/ChartProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Chart()),
        ChangeNotifierProvider(create: (_) => Body()),
      ],
      child: MaterialApp(
        title: 'Flutter UI',
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          '/booking': (context) => BookingScreen(),
          '/store': (context) => StoreScreen(),
          '/calendar': (context) => CalendarScreen(),
          // When navigating to the "/second" route, build the SecondScreen widget.
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: AppTheme.textTheme,
          platform: TargetPlatform.iOS,
        ),
        home: FitnessAppHomeScreen(),
      ),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
