import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

dynamic headingFontSize;
dynamic cardFontSize;

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final textScale = MediaQuery.of(context).textScaleFactor;

    void textScaleSetter() {
      if (textScale == 1.0) {
        headingFontSize = 35.0;
        cardFontSize = 18.0;
      } else if (textScale == 1.25) {
        headingFontSize = 25.0;
        cardFontSize = 15.0;
      }
    }

    textScaleSetter();

    return Scaffold(
      backgroundColor: Colors.blueGrey.shade600,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: screenHeight * 0.35,
                  width: screenWidth,
                  color: Colors.blueGrey,
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8),
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
                        margin:
                            EdgeInsets.only(top: 20, left: screenWidth - 180),
                        child: InkWell(
                          onTap: () =>
                              Navigator.pushNamed(context, 'edit profile'),
                          child: const Hero(
                            tag: 'avatar',
                            child: CircleAvatar(
                              radius: 80,
                              backgroundColor: Colors.blue,
                              backgroundImage:
                                  AssetImage('assets/images/Owner.jpg'),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: screenWidth,
                        margin: EdgeInsets.only(
                          left: 10,
                          top: screenHeight * 0.175,
                          bottom: 2,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Rishi Dhanavde',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: headingFontSize,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Android Developer, Shree Ganesh Electrical',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: cardFontSize+2,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: screenWidth,
                    color: Colors.grey.shade200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MyCardButton(
                              titleText: 'Employees',
                              cardIcon: LucideIcons.contact,
                              onTap: () =>
                                  Navigator.pushNamed(context, 'employees'),
                            ),
                            MyCardButton(
                              titleText: 'Work Calendar',
                              cardIcon: LucideIcons.calendarDays,
                              onTap: () =>
                                  Navigator.pushNamed(context, 'work calendar'),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MyCardButton(
                              titleText: 'View Attendance',
                              cardIcon: LucideIcons.userCheck,
                              onTap: () {
                                print('View Attendance Card pressed');
                              },
                            ),
                            MyCardButton(
                              titleText: 'Download Attendance',
                              cardIcon: LucideIcons.bookDown,
                              onTap: () {
                                print('Download Attendance Card pressed');
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                right: 10,
                left: screenWidth - 100,
                top: screenHeight * 0.30,
              ),
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, 'add employee'),
                child: const CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.amber,
                  child: Icon(
                    Icons.add,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCardButton extends StatelessWidget {
  final String titleText;
  final IconData cardIcon;
  final VoidCallback onTap;
  const MyCardButton({
    super.key,
    required this.titleText,
    required this.cardIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            SizedBox(
              height: 180,
              width: 151,
              child: Card(
                color: Colors.blueGrey.shade100,
                child: ListTile(
                  title: Text(
                    titleText,
                    style: TextStyle(
                      fontSize: cardFontSize,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 5,
              right: 5,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 45,
                child: Icon(
                  cardIcon,
                  color: Colors.grey.shade700,
                  size: 50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
