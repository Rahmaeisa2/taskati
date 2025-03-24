import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/core/utils/colors.dart';
import 'package:notes_app/feature/add_task/widget/color_picker.dart';
import 'package:notes_app/feature/add_task/widget/text_form_filed.dart';

import '../../core/Models/task_maneger_model.dart';
import '../../core/Models/task_model.dart';


class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();


  int selectedIndexColor = -1;
  List<Color> availableColors = [AppColors.primaryColor, Colors.orange.shade500, Colors.pinkAccent];
  DateTime selectedDate = DateTime.now();





  void _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null) {
      setState(() {
        dateController.text = DateFormat("MM/dd/yyyy").format(selectedDate);
      });
    }
  }

  void _pickTime(TextEditingController controller) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        controller.text = pickedTime.format(context);
      });
    }
  }

  void _createTask() {
    if (_formKey.currentState!.validate()) {
      if (selectedIndexColor == -1) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please select a color!", style: TextStyle(color: Colors.red))),
        );
      } else {
        setState(() {
          TaskManager.manager.addTask(TaskModel(title: titleController.text,
              note: noteController.text,
              date:dateController.text,
              startTime: startTimeController.text,
              endTime: endTimeController.text,
              color: availableColors[selectedIndexColor].value));

        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Task Created Successfully! ")),
        );
        Navigator.pop(context);


      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Task", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.black), onPressed: () => Navigator.pop(context)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 12
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(controller: titleController, label: "Title", hint: "Enter title here"),
                SizedBox(height: 8,),
                CustomTextField(controller: noteController, label: "Note", hint: "Enter note here"),
                SizedBox(height: 8,),
            
                CustomTextField(controller: dateController, label: "Date", hint: "Select Date", readOnly: true, onTap: _pickDate, suffixIcon: Icons.calendar_today),
            
                Row(
                  children: [
                    Expanded(child: CustomTextField(controller: startTimeController, label: "Start Time", hint: "Select Time", readOnly: true, onTap: () => _pickTime(startTimeController), suffixIcon: Icons.access_time)),
                    const SizedBox(width: 10),
                    Expanded(child: CustomTextField(controller: endTimeController, label: "End Time", hint: "Select Time", readOnly: true, onTap: () => _pickTime(endTimeController), suffixIcon: Icons.access_time)),
                  ],
                ),
            
                const Text("Color", style: TextStyle(fontWeight: FontWeight.bold)),
                ColorPicker(availableColors: availableColors, selectedIndex: selectedIndexColor, onSelect: (index) => setState(() => selectedIndexColor = index)),
            
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
            
                      backgroundColor: AppColors.primaryColor,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    ),
                    onPressed: _createTask,
                    child: const Text("Create Task" ,
                        style: TextStyle(color: Colors.white),
                  ),
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
