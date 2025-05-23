import 'package:flutter/material.dart';
import 'package:presence/employer/add_employee.dart';
import 'package:presence/employer/edit_profile.dart';
import 'package:presence/employer/homepage.dart';
import 'package:presence/employer/login_page.dart';
import 'package:presence/employer/employees/employees.dart';
import 'package:presence/employer/work_calendar/work_calendar.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true),
    initialRoute: 'login',
    routes: {
      'login': (context) => const LoginPage(),
      'homepage': (context) => const Homepage(),
      'add employee':(context) => const AddEmployee(),
      'edit profile':(context) => const EditProfile(),
      'employees':(context) => const Employees(),
      'work calendar':(context) => const WorkCalendar(),
    },
  ));
}
