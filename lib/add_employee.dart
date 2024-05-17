import 'package:flutter/material.dart';

class AddEmployee extends StatelessWidget {
  const AddEmployee({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      backgroundColor: Colors.grey.shade200,
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.all(8),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.adaptive.arrow_back,
                    size: 45,
                    color: Colors.blueGrey.shade600,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Employee',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
                  ),
                  const CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('assets/images/Owner.jpg'),
                  ),
                  SizedBox(
                    child: Column(
                      children: [
                        Container(
                          width: screenWidth,
                          margin: const EdgeInsets.symmetric(horizontal: 35),
                          child: TextField(
                            cursorColor: Colors.grey,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              labelText: 'Name',
                              labelStyle:
                                  TextStyle(color: Colors.grey.shade900),
                              fillColor: Colors.grey.shade300,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade900,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: screenWidth,
                          margin: const EdgeInsets.symmetric(horizontal: 35),
                          child: TextField(
                            cursorColor: Colors.grey,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.alternate_email),
                              labelText: 'Email',
                              labelStyle:
                                  TextStyle(color: Colors.grey.shade900),
                              fillColor: Colors.grey.shade300,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade900,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    width: screenWidth,
                    margin: const EdgeInsets.symmetric(horizontal: 35),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        'A D D   E M P L O Y E E',
                        style: TextStyle(
                          fontFamily: 'AlumniSans',
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
