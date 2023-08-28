// ignore_for_file: prefer_const_constructors
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hive_project_3/Screen_home.dart';
import 'package:flutter_hive_project_3/functions/db_functions.dart';
import 'package:flutter_hive_project_3/model/model.dart';
import 'package:flutter_hive_project_3/pages/list_student.dart';
import 'package:flutter_hive_project_3/pages/update.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker/image_picker.dart';
//  import 'package:image_picker/image_picker.dart';

class UpdateStudent extends StatefulWidget {
  final String name;
  final String age;
  final String phone;
  final String adress;
  final dynamic image;
  // final Studentmodel data;
  final int index;

  UpdateStudent({
    super.key,
    required this.name,
    required this.age,
    required this.phone,
    required this.adress,
    //  required this.data,
    required this.image,
    required this.index,
    //  required this.image
  });

  @override
  State<UpdateStudent> createState() => _UpdateStudentState();
}

class _UpdateStudentState extends State<UpdateStudent> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  // final ImagePicker _picker = ImagePicker();
  File? selectedimage;

  // final _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _ageController = TextEditingController(text: widget.age);
    _phoneController = TextEditingController(text: widget.phone);
    _addressController = TextEditingController(text: widget.adress);

    // selectedimage = widget. image!= null ? File(widget.image) : null;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: SafeArea(
        child: Container(
          color: Colors.grey[200], // Overall background color
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              imageprofile(),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  errorStyle: TextStyle(color: Colors.red),
                  filled: true,
                  fillColor: Colors.white, // Input field background color
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 40),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(
                  labelText: 'Age',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.calendar_today),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  errorStyle: TextStyle(color: Colors.red),
                  filled: true,
                  fillColor: Colors.white, // Input field background color
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Age is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 40),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  errorStyle: TextStyle(color: Colors.red),
                  filled: true,
                  fillColor: Colors.white, // Input   field background color
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Phone number is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 40),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.home),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  errorStyle: TextStyle(color: Colors.red),
                  filled: true,
                  fillColor: Colors.white, // Input field background color
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Address is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  update();
                  // Navigator.of(context).push(MaterialPageRoute(builder: ((context) => Liststudent())));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Button color
                  onPrimary: Colors.white, // Text color
                ),
                child: Text('Update'),
              ),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      )),
    );
  }

  imageprofile() {
    return Stack(
      children: [
        CircleAvatar(
            radius: 100,
            backgroundImage: selectedimage != null
                ? FileImage(selectedimage!)
                : AssetImage("images/computer.jpg") as ImageProvider),
        Positioned(
          bottom: 30.0,
          right: 30.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context, builder: ((Builder) => bottomsheet()));
            },
            child: Icon(
              Icons.camera_alt,
              color: Colors.teal,
            ),
          ),
        )
      ],
    );
  }

  bottomsheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Text(
            "choose profile photo",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          // SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {
                  photocamera();
                },
                child: Icon(Icons.camera),
                tooltip: 'Open Camera',
              ),
              SizedBox(
                width: 40,
              ),
              FloatingActionButton(
                onPressed: () {
                  photogallery();
                },
                child: Icon(Icons.image),
                tooltip: 'Open Gallery',
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> update() async {
    final edited_name = _nameController.text.trim();
    final edited_age = _ageController.text.trim();
    final edited_phone = _phoneController.text.trim();
    final edited_address = _addressController.text.trim();
    final edited_image = selectedimage?.path;

    // final edited_image = selectedimage?.path;

    if (edited_name.isEmpty ||
        edited_age.isEmpty ||
        edited_phone.isEmpty ||
        edited_address.isEmpty ||
        edited_image == null) {
      return;
    } else {
      final updated = Studentmodel(
        name: edited_name,
        age: edited_age,
        phone: edited_phone,
        adress: edited_address,

        
      );
      editList(widget.index, updated);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => Liststudent()));
    }
  }

  photogallery() async {
    final returnedimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      selectedimage = File(returnedimage!.path);
    });
  }

  photocamera() async {
    final returnedimage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      selectedimage = File(returnedimage!.path);
    });
  }
}
