// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:medication/models/medication_model.dart';
import 'package:medication/widgets/custom_text_form_feild.dart';
import 'package:medication/widgets/elvated_button.dart';

class AddMedicationScreen extends StatefulWidget {
  const AddMedicationScreen({super.key});

  @override
  State<AddMedicationScreen> createState() => _AddMedicationScreenState();
}

class _AddMedicationScreenState extends State<AddMedicationScreen> {
  final formKey = GlobalKey<FormState>();
  String name = '', dose = '', time = '';
  bool isTaken = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Medication')),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextFormFeild(
                hinttext: 'Name',
                onsaved: (value) {
                  name = value!;
                },
              ),
              SizedBox(height: 15.h),
              CustomTextFormFeild(
                hinttext: 'Dose',
                onsaved: (value) {
                  dose = value!;
                },
              ),
              SizedBox(height: 15.h),
              CustomTextFormFeild(
                hinttext: 'Time (e.g)',
                onsaved: (value) {
                  time = value!;
                },
              ),
              SizedBox(height: 15.h),
              SwitchListTile(
                title: const Text('Taken?'),
                value: isTaken,
                onChanged: (value) {
                  setState(() => isTaken = value);
                },
              ),
              SizedBox(height: 15.h),
              ElvatedButton(
                title: 'Save',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    final newMed = Medication(
                      name: name,
                      dose: dose,
                      time: time,
                      isTaken: isTaken,
                    );

                    Hive.box<Medication>('medications').add(newMed);
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
