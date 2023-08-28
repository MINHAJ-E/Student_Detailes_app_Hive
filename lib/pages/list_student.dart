// ignore_for_file: prefer_const_constructors
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_hive_project_3/functions/db_functions.dart';
import 'package:flutter_hive_project_3/model/model.dart';
import 'package:flutter_hive_project_3/pages/add_student.dart';
import 'package:flutter_hive_project_3/pages/update.dart';
import 'package:flutter_hive_project_3/pages/user_profile.dart';

class Liststudent extends StatefulWidget {
  Liststudent({super.key});

  @override
  State<Liststudent> createState() => _ListstudentState();
}

class _ListstudentState extends State<Liststudent> {
  String _search = '';
  List<Studentmodel> searchedlist = [];
 // Added this list to store all students

  loadstudent() async {
    searchedlist = await getAllStudents();
    searchResult(); // Moved searchResult call here
  }

  @override
  void initState() {
    loadstudent();
    super.initState();
  }

  void searchResult() {
    setState(() {
      searchedlist = studentListNotifier.value
          .where((StudentModel) =>
              StudentModel.name.toLowerCase().contains(_search.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // getAllStudents();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Student List'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        ),
     
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextFormField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Search',
                contentPadding: EdgeInsets.all(15),
                prefixIcon: Icon(Icons.search, color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                filled: true,
                fillColor: Colors.amber,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 79, 24, 4), width: 2),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _search = value;
                });
                searchResult();
              },
            ),
          ),
          Expanded(
           child: ValueListenableBuilder<List<Studentmodel>>(
              valueListenable: studentListNotifier,
              builder:
                  (BuildContext ctx, List<Studentmodel> studentList, Widget? child) {
                return ListView.builder(
                  itemCount: searchedlist.length,
                  itemBuilder: (BuildContext context, int index) {
                    final data = searchedlist[index];
                    
                    
                    return Card(
                      
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 20,
                      
                      child: ListTile(
                        
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => userProfileView(
                                    name: data.name,
                                    age: data.age,
                                    phone: data.phone,
                                    adress: data.adress,
                                  )));
                        },
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage("images/computer.jpg"),
                          // backgroundImage: data.image != null
                          // ? FileImage(File(data.image!))
                          // : AssetImage('assets/images/profile.png')
                          // as ImageProvider
                        ),
                        title: Text(data.name),
                        subtitle: Text(data.age),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                deletestudent(index);
                              },
                              icon: const Icon(Icons.delete, color: Colors.red),
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) => UpdateStudent(
                                            name: data.name,
                                            age: data.age,
                                            phone: data.phone,
                                            adress: data.adress,
                                            index: index,
                                            //  data:data ,
                                            //  image: Image,
                            )));
                                },
                                icon: Icon(Icons.edit)),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
        ),
        
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Addstudent(),
          ));
        },
        backgroundColor: Colors.amber,
        child: Icon(Icons.add),
      ),
    );
  }
}
