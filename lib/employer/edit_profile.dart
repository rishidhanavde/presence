import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.9;
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: screenHeight * 0.55,
              width: double.infinity,
              child: Stack(
                children: [
                  SizedBox(
                    child: Image.asset(
                      'assets/images/Owner.jpg',
                      height: double.infinity,
                      fit: BoxFit.cover,
                      color: Colors.white.withOpacity(0.5),
                      colorBlendMode: BlendMode.modulate,
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height:
                            300, // Adjust the height to cover the desired amount
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.grey.shade200,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.adaptive.arrow_back,
                  size: 45,
                  color: Colors.grey.shade800,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Edit Profile',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
                ),
                const Hero(
                  tag: 'avatar',
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('assets/images/Owner.jpg'),
                  ),
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
                            labelStyle: TextStyle(color: Colors.grey.shade900),
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
                            labelStyle: TextStyle(color: Colors.grey.shade900),
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
                      'E D I T  P R O F I L E',
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
    );
  }
}
