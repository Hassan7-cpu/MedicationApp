import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medication/models/medication_model.dart';

class MedicationItem extends StatefulWidget {
  final Medication medication;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const MedicationItem({
    super.key,
    required this.medication,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  State<MedicationItem> createState() => _MedicationItemState();
}

class _MedicationItemState extends State<MedicationItem> {
  late bool isTaken;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.r),
      child: ListTile(
        title: Text(widget.medication.name),
        subtitle: Text('${widget.medication.dose} • ${widget.medication.time}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              value: widget.medication.isTaken,
              onChanged: (value) async {
                setState(() {
                  isTaken = value!;
                });
                widget.medication.isTaken = value!;
                await widget.medication.save();
              },
            ),
            IconButton(icon: const Icon(Icons.edit), onPressed: widget.onEdit),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: widget.onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
