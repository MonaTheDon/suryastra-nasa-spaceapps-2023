import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magnetic_reconnection_space_app/constants.dart';
import 'package:magnetic_reconnection_space_app/features/landingScreen/screens/landing_screen.dart';
import 'package:magnetic_reconnection_space_app/providers/daily_lives_provider.dart';
import 'package:magnetic_reconnection_space_app/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (ctx) => DailyLivesProvider())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        designSize: const Size(360, 640),
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Constants.backgroundColor,
              fontFamily: "Urbanist",
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: child,
            onGenerateRoute: (settings) => generateRoute(settings),
          );
        },
        child: const LandingScreen());
  }
}
