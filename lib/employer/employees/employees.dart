import 'package:animation_search_bar/animation_search_bar.dart';
import 'package:flutter/material.dart';

class Employees extends StatefulWidget {
  const Employees({super.key});

  @override
  State<Employees> createState() => _EmployeesState();
}

final List<Map<String, String>> Names = [
  {'name': 'Rishikesh Dhanavde', 'email': 'rishidhanavde1@gmail.com'},
  {'name': 'Mukul Sardar', 'email': 'mukulsardar2@gmail.com'},
  {'name': 'Sanchit Yadav', 'email': 'sanchityadav3@gmail.com'},
  {'name': 'Rushikesh Sardar', 'email': 'rushikeshsardar4@gmail.com'},
  {'name': 'Jay Patil', 'email': 'rishidhanavde5@gmail.com'},
  {'name': 'Shubham Ruke', 'email': 'mukulsardar6@gmail.com'},
  {'name': 'Omkar Patil', 'email': 'sanchityadav7@gmail.com'},
  {'name': 'Rohit Birambole', 'email': 'rushikeshsardar8@gmail.com'},
  {'name': 'Vinu Rathod', 'email': 'rishidhanavde9@gmail.com'},
  {'name': 'Shubham Dawale', 'email': 'mukulsardar10@gmail.com'},
  {'name': 'Dweep Kini', 'email': 'sanchityadav11@gmail.com'},
  {'name': 'Jayesh Kamble', 'email': 'rushikeshsardar12@gmail.com'},
];

class _EmployeesState extends State<Employees> {
  TextEditingController controller = TextEditingController();
  late double scrWidth;

  List<Map<String, String>> searched_name = [];

  @override
  void initState() {
    searched_name = Names;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;
    scrWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimationSearchBar(
              searchBarWidth: scrWidth - 20,
              onChanged: (p0) => _runFilter(p0),
              searchTextEditingController: controller,
              backIcon: Icons.arrow_back,
              centerTitle: 'Employees',
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return searched_name.isNotEmpty
                      ? CustomListTile(
                          names: searched_name[index]['name']!,
                          email: searched_name[index]['email']!,
                          width: scrWidth,
                        )
                      : const Text('No Employees found');
                },
                childCount: searched_name.length, // Number of items in the list
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, String>> results = [];
    if (enteredKeyword.isEmpty) {
      // If the search field is empty, show all employees
      results = List.from(Names);
    } else {
      // Filter the employee list based on the entered keyword (name or email)
      results = Names.where((employee) =>
          employee['name']!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()) ||
          employee['email']!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase())).toList();
    }
    setState(() {
      searched_name = results;
    });
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
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
                  Column(
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
