// import 'package:flutter/material.dart';
// import 'package:flutter_hive_project_3/functions/db_functions.dart';
// import 'package:flutter_hive_project_3/model/model.dart';
// import 'package:flutter_hive_project_3/pages/add_student.dart';
// import 'package:flutter_hive_project_3/pages/list_student.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     getAllStudents();
//     return  Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.red,
//           title: Text("home  app bar"),
//       ),
     
//     body: Liststudent(),
    
//      floatingActionButton: FloatingActionButton(onPressed: (){
//         Navigator.of(context).push(MaterialPageRoute(builder: (context) => Addstudent(),));
//       },
//       child: Icon(Icons.add),),
//     );
//   }
// }