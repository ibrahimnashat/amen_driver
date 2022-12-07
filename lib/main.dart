import 'package:amen_driver/core/injection/injectable.dart';
import 'package:amen_driver/features/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const AmenDriverApplication());
}

class AmenDriverApplication extends StatefulWidget {
  const AmenDriverApplication({Key? key}) : super(key: key);
  @override
  State<AmenDriverApplication> createState() => _AmenDriverApplicationState();
}

class _AmenDriverApplicationState extends State<AmenDriverApplication> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      builder: (context, child) {
        return ResponsiveWrapper.builder(
          child,
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          defaultName: MOBILE,
          defaultNameLandscape: MOBILE,
          breakpoints: [
            const ResponsiveBreakpoint.resize(
              480,
              name: MOBILE,
              scaleFactor: 0.85,
            ),
            const ResponsiveBreakpoint.autoScale(
              800,
              name: TABLET,
              scaleFactor: 0.9,
            ),
            const ResponsiveBreakpoint.resize(
              1000,
              name: DESKTOP,
            ),
            const ResponsiveBreakpoint.autoScale(
              2460,
              name: '4K',
            ),
          ],
        );
      },
    );
  }
}
