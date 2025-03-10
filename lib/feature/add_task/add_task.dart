import 'package:flutter/material.dart';
import 'package:notes_app/core/utils/colors.dart';
import 'package:notes_app/core/utils/style.dart';
import 'package:notes_app/feature/add_task/widget/custom_batton.dart';
import 'package:notes_app/feature/add_task/widget/text_form_filed.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final formKey = GlobalKey<FormState>();
   TextEditingController titleController = TextEditingController();
   TextEditingController noteController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();



  DateTime? selectedDate;
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  int _selectedColorIndex = 0;
  List<Color> colorOptions = [AppColors.primaryColor, Colors.cyan, Colors.orange];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Add Task",
          style: AppTextStyle.fontStyle20Bold.copyWith(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey, //عشان ال validator
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormFieldWithTitle(
                  title: "Title",
                  hintText: "Enter title",
                  controller: titleController,
                  validator: (value){
                    if (value == null ||value.isEmpty){
                      return " This title is required";
                    }
                  },
                ),
                TextFormFieldWithTitle(
                  title: "Note",
                  hintText: "Enter Note",
                  controller: noteController,
                  validator: (value){
                    if (value == null ||value.isEmpty){
                      return " This note is required";
                    }
                  },


                ),
                TextFormFieldWithTitle(

                  controller: dateController,
                  title: "Date",
                  hintText: selectedDate != null
                      ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                      : "Select Date",
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2027),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        selectedDate = pickedDate;
                        dateController.text = "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"; // ⬅️ تحديث الحقل

                      });
                      formKey.currentState!.validate();

                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          TextFormFieldWithTitle(
                            onChanged: (value){
                              setState(() {

                              });
                            },
                            controller: startTimeController,
                            readOnly: true,
                            title: "Start Time",
                            hintText: startTime != null
                                ? startTime!.format(context)
                                : "Select Time",
                            onTap: () async {
                              TimeOfDay? pickedTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                              if (pickedTime != null) {
                                setState(() {
                                  startTime = pickedTime;
                                });

                              }
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },


                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 7),
                    Expanded(
                      child: Column(
                        children: [
                          TextFormFieldWithTitle(

                            onChanged: (value){
                              setState(() {

                              });
                            },
                            controller: endTimeController,
                            readOnly: true,
                            title: "End Time",
                            hintText: endTime != null
                                ? endTime!.format(context)
                                : "Select Time",
                            onTap: () async {
                              TimeOfDay? pickedTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                              if (pickedTime != null) {
                                setState(() {
                                  endTime = pickedTime;
                                });

                              }
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 9,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Color", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: List.generate(
                        colorOptions.length,
                            (index) => GestureDetector(
                          onTap: () => setState(() => _selectedColorIndex = index),
                          child: Container(
                            margin: EdgeInsets.all(5),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: colorOptions[index],
                              shape: BoxShape.circle,
                              border: Border.all(color: _selectedColorIndex == index ? Colors.black : Colors.transparent, width: 2),
                            ),
                          ),
                        ),
                      ),

                    ),
                  ],
                )
             ,
                SizedBox(height: 20),
                Container(
                  width: 200,
                  height: 50,
                  child:CustomButton(
                    title: "Create Task",
                    onTap: (){
                      if (formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),);
    }
    },

                  ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
