import 'package:clean_architecture/core/injection/injectable.dart';
import 'package:clean_architecture/features/auth/presentaion/view/news/news_screen.dart';
import 'package:flutter/material.dart';

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
      home: NewsScreen(),
    );
  }
}
