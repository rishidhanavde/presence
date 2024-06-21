import 'package:flutter/material.dart';
import 'package:presence/employer/add_employee.dart';
import 'package:presence/employer/edit_profile.dart';
import 'package:presence/employer/employees/employees_list.dart';
import 'package:presence/employer/homepage.dart';
import 'package:presence/employer/login_page.dart';
import 'package:presence/temp.dart';
import 'package:presence/temp2.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true),
    initialRoute: 'temporary',
    routes: {
      'login': (context) => const LoginPage(),
      'homepage': (context) => const Homepage(),
      'add employee':(context) => const AddEmployee(),
      'edit profile':(context) => const EditProfile(),
      'employees':(context) => const EmployeesList(),
      'temporary':(context) => Temporary(),
      'temporary 2':(context) => AnimatedSearchBarPage(),
    },
  ));
}
