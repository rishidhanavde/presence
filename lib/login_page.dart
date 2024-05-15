import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.amber,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.amber.shade200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'Lobster',
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber.shade700,
                  ),
                ),
                const SizedBox(height: 50),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text(
                          'Username',
                          style: TextStyle(
                            fontFamily: 'Caveat',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber.shade700,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.amber.shade700,
                          ),
                          const SizedBox(
                            width: 300,
                            child: TextField(
                              style: TextStyle(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text(
                          'Password',
                          style: TextStyle(
                            fontFamily: 'Caveat',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber.shade700,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.lock,
                            color: Colors.amber.shade700,
                          ),
                          const SizedBox(
                            width: 300,
                            child: TextField(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 75),
                ElevatedButton(
                  onPressed: null,
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.amber)),
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
