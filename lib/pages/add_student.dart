// ignore_for_file: prefer_const_constructors
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hive_project_3/Screen_home.dart';
import 'package:flutter_hive_project_3/functions/db_functions.dart';
import 'package:flutter_hive_project_3/model/model.dart';
import 'package:flutter_hive_project_3/pages/list_student.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker/image_picker.dart';
//  import 'package:image_picker/image_picker.dart';

class Addstudent extends StatefulWidget {
  Addstudent({super.key});

  @override
  State<Addstudent> createState() => _AddstudentState();
}

class _AddstudentState extends State<Addstudent> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  // final ImagePicker _picker = ImagePicker();
  File? selectedimage;

  final _formkey = GlobalKey<FormState>();
  @override
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
                  fillColor: Colors.white, // Input field background color
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
                  
                  onStudentButtonClick();

                  Navigator.of(context).push(MaterialPageRoute(builder: ((context) => Liststudent())));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Button color
                  onPrimary: Colors.white, // Text color
                ),
                child: Text('Submit'),
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
                  fromcam();
                },
                child: Icon(Icons.camera),
                tooltip: 'Open Camera',
              ),
              SizedBox(
                width: 40,
              ),
              FloatingActionButton(
                onPressed: () {
                 fromgallery();
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
  fromgallery() async {
    final returnedimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      selectedimage = File(returnedimage!.path);
    });
  }

  fromcam() async {
    final returnedimage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      selectedimage = File(returnedimage!.path);
    });
  }
  Future<void>onStudentButtonClick()async{
    final _name =_nameController.text.trim();
    final _age = _ageController.text.trim();
    final _phone = _phoneController.text.trim();
    final _address = _addressController.text.trim();
  if(_name.isEmpty||_age.isEmpty||_phone.isEmpty||_address.isEmpty){
    return;
  }
  print('$_name $_age $_phone $_address');

    final _student=Studentmodel(name: _name, age: _age, phone: _phone, adress: _address);
   
    insertStudent(_student);
  }
  
  }

