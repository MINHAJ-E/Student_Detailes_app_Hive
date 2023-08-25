
import 'package:flutter/material.dart';
import 'package:flutter_hive_project_3/Screen_home.dart';
import 'package:flutter_hive_project_3/functions/db_functions.dart';
import 'package:flutter_hive_project_3/model/model.dart';
import 'package:flutter_hive_project_3/pages/list_student.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';



Future<void> main()async{
    WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
 if (!Hive.isAdapterRegistered(StudentmodelAdapter().typeId)) {
    Hive.registerAdapter(StudentmodelAdapter());
  }
  

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "uaygsda",
      home: Liststudent(),
    );
  }
}

