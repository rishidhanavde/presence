import 'package:flutter/material.dart';
// import 'package:lucide_icons/lucide_icons.dart';

var Scrwidth;

class EmployeesList extends StatelessWidget {
  const EmployeesList({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    Scrwidth = screenWidth;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.22,
              color: Colors.grey.shade200,
              child: const Align(
                alignment: Alignment(-0.85, 0.25),
                child: Text(
                  'Employees',
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.grey.shade100,
                child: EmployeeList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EmployeeList extends StatelessWidget {
  EmployeeList({super.key});
  final List<Map<String, String>> Names = [
    {'name': 'Rishikesh Dhanavde', 'email': 'rishidhanavde@gmail.com'},
    {'name': 'Mukul Sardar', 'email': 'mukulsardar@gmail.com'},
    {'name': 'Sanchit Yadav', 'email': 'sanchityadav@gmail.com'},
    {'name': 'Rushikesh Sardar', 'email': 'rushikeshsardar@gmail.com'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Names.length,
        itemBuilder: (context, index) {
          return CustomListTile(
            names: Names[index]['name']!,
            email: Names[index]['email']!,
            width: Scrwidth,
          );
        });
  }
}

class CustomListTile extends StatelessWidget {
  CustomListTile({
    super.key,
    required this.width,
    required this.names,
    required this.email,
  });

  final double width;
  final String names;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: width,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black12, width: 1.5)),
      child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          names,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          email,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () => null,
                    child: const Text(
                      'Update Info',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/Owner.jpg'),
            ),
          ],
        ),
      ),
    );
  }
}
