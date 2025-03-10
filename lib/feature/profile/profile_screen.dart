import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notes_app/feature/add_task/widget/text_form_filed.dart';

import '../../core/utils/colors.dart';
import '../../core/utils/style.dart';
import '../add_task/widget/custom_batton.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName = "Rahma Eisa";
  final ImagePicker picker = ImagePicker();
  XFile? image;
  pickFromCamera() async {
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        image = pickedImage;
      });
    }
  }
  pickFromGallery()async{
    await picker.pickImage(source: ImageSource.gallery);

  }


  void updateName() async {
    final updatedName = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        TextEditingController nameController =
        TextEditingController(text: userName);
        return Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Enter new name",),
              ),
              SizedBox(height: 15),
              CustomButton(
                title: "Update Name",

                onTap: () {
                  String newName = nameController.text.trim();
                  if (newName.isNotEmpty) {
                    Navigator.pop(context, newName);
                  }
                },
              ),
            ],
          ),
        );
      },
    );

    if (updatedName != null && updatedName.isNotEmpty) {
      setState(() {
        userName = updatedName;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile Screen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
                alignment: Alignment.bottomRight,

                children:[
                  InkWell(
                    onTap: (){
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context){
                            return Wrap(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.
                                  symmetric(
                                      horizontal: 15,
                                      vertical: 16
                                  ),
                                  child: Column(
                                    children: [
                                      CustomButton(title: "Upload from camera", onTap: ()async{
                                        await pickFromCamera();

                                      }),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      CustomButton(title: "Upload from gallery", onTap: ()async {
                                        await pickFromGallery();

                                      }),

                                    ],
                                  ),
                                ),
                              ],
                            );
                          });
                    },
                    child: Container(
                      width: 200,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryColor,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:Colors.indigo,
                          image: DecorationImage(fit: BoxFit.contain,
                              image: Image.file(File(image?.path??" ")).image),
                        ),
                        child: image == null
                            ? Icon(Icons.camera_alt, color: Colors.white, size: 18)
                            : null,
                      ),
                    ),
                  ),
                ]
            ),
            SizedBox(
              height: 35,
            ),
            Divider(
              color: AppColors.primaryColor,
              thickness: 1.7,
              endIndent: 20,
              indent: 20,
            ),

            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 14
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(userName ,
                                  style: AppTextStyle.fontStyle20Bold.copyWith(
                    color: AppColors.primaryColor,
                    fontSize: 22,),
                    ),
                  ),
                  InkWell(
                    onTap:updateName,
                    child: Container(
                      width: 50,
                      height: 35,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color:AppColors.primaryColor)
                      ),
                      child: Icon(Icons.edit_outlined , color: AppColors.primaryColor,
                        size: 23,),
                    ),
                  )

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
