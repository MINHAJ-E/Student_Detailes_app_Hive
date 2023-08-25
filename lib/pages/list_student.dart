import 'package:flutter/material.dart';
import 'package:flutter_hive_project_3/functions/db_functions.dart';
import 'package:flutter_hive_project_3/model/model.dart';
import 'package:flutter_hive_project_3/pages/add_student.dart';
import 'package:flutter_hive_project_3/pages/update.dart';

class Liststudent extends StatelessWidget {
  Liststudent({super.key});

  @override
  Widget build(BuildContext context) {
    getAllStudents();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Student List'),
        
      ),
      body: ValueListenableBuilder<List<Studentmodel>>(
        valueListenable: studentListNotifier,
        builder:
            (BuildContext ctx, List<Studentmodel> studentList, Widget? child) {
          return ListView.builder(
            itemCount: studentList.length,
            itemBuilder: (BuildContext context, int index) {
              final student = studentList[index];

              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 20,
                child: ListTile(
                  onTap: () {
                    // userprofile(context, data);
                  },
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("images/computer.jpg"),
                    // backgroundImage: data.image != null
                    // ? FileImage(File(data.image!))
                    // : AssetImage('assets/images/profile.png')
                    // as ImageProvider
                  ),
                  title: Text(student.name),
                  subtitle: Text(student.age),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          deletestudent(index);
                        },
                        icon: const Icon(Icons.delete,
                        color: Colors.red),
                      ),
                      IconButton(onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>UpdateStudent()));
                      }, icon: Icon(Icons.edit)),
                    ],
                  ),
                ),
              );
            },
          );
        },
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
