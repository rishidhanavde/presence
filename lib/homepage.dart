import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey.shade600,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: screenHeight * 0.35,
                width: screenWidth,
                color: Colors.blueGrey,
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 8, top: 8),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.menu,
                          size: 45,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: screenWidth - 180),
                      child: const CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.blue,
                        backgroundImage: AssetImage('assets/images/Owner.jpg'),
                      ),
                    ),
                    Container(
                      width: screenWidth,
                      margin: EdgeInsets.only(
                        left: 10,
                        top: screenHeight * 0.175,
                      ),
                      child: const Text(
                        'Rishi\nDhanavde',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: screenWidth,
                  color: Colors.white,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MyCardButton(
                            titleText: 'Title 1',
                            subtitleText: 'Subtitle 1',
                          ),
                          MyCardButton(
                            titleText: 'Title 2',
                            subtitleText: 'Subtitle 2',
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MyCardButton(
                            titleText: 'Title 3',
                            subtitleText: 'Subtitle 3',
                          ),
                          MyCardButton(
                            titleText: 'Title 4',
                            subtitleText: 'Subtitle 4',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyCardButton extends StatelessWidget {
  final String titleText;
  final String subtitleText;
  const MyCardButton({
    super.key,
    required this.titleText,
    required this.subtitleText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: 151,
      child: Card(
        color: Colors.blueGrey.shade100,
        child: ListTile(
          title: Text(titleText),
          subtitle: Text(subtitleText),
        ),
      ),
    );
  }
}
