import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/core/utils/colors.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _startTime = TimeOfDay(hour: 2, minute: 30);
  TimeOfDay _endTime = TimeOfDay(hour: 2, minute: 45);
  int _selectedColorIndex = 0;

  List<Color> colorOptions = [Colors.blue, Colors.red, Colors.orange];

  void _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _pickTime({required bool isStartTime}) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: isStartTime ? _startTime : _endTime,
    );
    if (pickedTime != null) {
      setState(() {
        if (isStartTime) {
          _startTime = pickedTime;
        } else {
          _endTime = pickedTime;
        }
      });
    }
  }

  void _createTask() {
    if (_titleController.text.isNotEmpty) {
      print("Task Created: ${_titleController.text}, Date: ${DateFormat.yMd().format(_selectedDate)}");
      Navigator.pop(context); // الرجوع للشاشة السابقة
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter a title!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Task")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Title", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              TextField(controller: _titleController, decoration: InputDecoration(border: OutlineInputBorder())),
        
              SizedBox(height: 10),
        
              Text("Note", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              TextField(controller: _noteController, decoration: InputDecoration(border: OutlineInputBorder())),
        
              SizedBox(height: 10),
        
              Text("Date", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              GestureDetector(
                onTap: _pickDate,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(8)),
                  child: Text(DateFormat.yMd().format(_selectedDate)),
                ),
              ),
        
              SizedBox(height: 10),
        
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Start Time", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        GestureDetector(
                          onTap: () => _pickTime(isStartTime: true),
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                            decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(8)),
                            child: Text(_startTime.format(context)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("End Time", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        GestureDetector(
                          onTap: () => _pickTime(isStartTime: false),
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                            decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(8)),
                            child: Text(_endTime.format(context)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
        
              SizedBox(height: 10),
        
              Text("Color", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
              SizedBox(
                height: 12,
              ),
              Center(
                child: SizedBox(
                  width: 160,
                  height: 50,
                  child: ElevatedButton(
                   style:ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor, // لون الخلفية
                        foregroundColor: Colors.white
                    ),
                    onPressed: (){},
                    child: Text("Create Task",
                    style: TextStyle(
                    ),),
                  ),
                ),
              ),
        
            ],
          ),
        ),
      ),
    );
  }
}
