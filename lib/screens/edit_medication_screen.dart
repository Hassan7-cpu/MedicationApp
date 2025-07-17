import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medication/models/medication_model.dart';
import 'package:medication/widgets/custom_text_form_feild.dart';
import 'package:medication/widgets/elvated_button.dart';

class EditMedicationScreen extends StatefulWidget {
  final Medication medication;
  const EditMedicationScreen({super.key, required this.medication});

  @override
  State<EditMedicationScreen> createState() => _EditMedicationScreenState();
}

class _EditMedicationScreenState extends State<EditMedicationScreen> {
  final formKey = GlobalKey<FormState>();
  late String name, dose, time;
  late bool isTaken;

  @override
  void initState() {
    super.initState();
    name = widget.medication.name;
    dose = widget.medication.dose;
    time = widget.medication.time;
    isTaken = widget.medication.isTaken;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Medication')),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextFormFeild(
                initialvalue: name,
                hinttext: 'Name',
                onsaved: (value) {
                  name = value!;
                },
              ),
              SizedBox(height: 15.h),
              CustomTextFormFeild(
                initialvalue: dose,
                hinttext: 'dose',
                onsaved: (value) {
                  dose = value!;
                },
              ),
              SizedBox(height: 15.h),
              CustomTextFormFeild(
                initialvalue: time,
                hinttext: 'time',
                onsaved: (value) {
                  time = value!;
                },
              ),
              SizedBox(height: 15.h),
              SwitchListTile(
                title: const Text('Taken?'),
                value: isTaken,
                onChanged: (val) => setState(() => isTaken = val),
              ),
              SizedBox(height: 15.h),
              ElvatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    widget.medication.name = name;
                    widget.medication.dose = dose;
                    widget.medication.time = time;
                    widget.medication.isTaken = isTaken;
                    widget.medication.save();
                    Navigator.pop(context);
                  }
                },
                title: 'Update',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
