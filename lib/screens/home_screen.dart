// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medication/models/medication_model.dart';
import 'package:medication/screens/add_medication_screen.dart';
import 'package:medication/screens/edit_medication_screen.dart';
import 'package:medication/widgets/elvated_button.dart';
import 'package:medication/widgets/medication_item.dart';
import 'package:medication/widgets/theme_button.dart' show ThemeButton;

class HomeScreen extends StatelessWidget {
  final bool isDark;
  final VoidCallback colortheme;

  const HomeScreen({super.key, required this.isDark, required this.colortheme});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<Medication>('medications');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medication Reminder'),
        centerTitle: true,
        actions: [ThemeButton(isDark: isDark, Theme: colortheme)],
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: box.listenable(),
              builder: (context, Box<Medication> meds, oldvalue) {
                if (meds.isEmpty) {
                  return const Center(child: Text('No Medications'));
                } else {
                  return ListView.builder(
                    itemCount: meds.length,
                    itemBuilder: (context, index) {
                      final med = meds.getAt(index)!;
                      return MedicationItem(
                        medication: med,
                        onEdit: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (oldvalue) =>
                                EditMedicationScreen(medication: med),
                          ),
                        ),
                        onDelete: () => med.delete(),
                      );
                    },
                  );
                }
              },
            ),
          ),
          SizedBox(height: 10.h),
          ElvatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const AddMedicationScreen()),
              );
            },
            title: 'Click To Add New Medicine',
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
