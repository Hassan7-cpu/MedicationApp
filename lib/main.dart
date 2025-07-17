// ignore_for_file: non_constant_identifier_names, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medication/screens/edit_medication_screen.dart';
import 'package:medication/screens/home_screen.dart';
import 'package:medication/models/medication_model.dart';
import 'package:medication/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MedicationAdapter());
  await Hive.openBox<Medication>('medications');
  runApp(const MedicationApp());
}

class MedicationApp extends StatefulWidget {
  const MedicationApp({super.key});

  @override
  State<MedicationApp> createState() => _MyAppState();
}

class _MyAppState extends State<MedicationApp> {
  bool isDark = false;

  void Theme() {
    setState(() => isDark = !isDark);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Medication Reminder',
        theme: isDark ? darkTheme : lightTheme,
        home: HomeScreen(isDark: isDark, colortheme: Theme),
      ),
    );
  }
}
