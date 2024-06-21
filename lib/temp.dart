import 'package:flutter/material.dart';

class Temporary extends StatefulWidget {
  const Temporary({super.key});

  @override
  State<Temporary> createState() => _TemporaryState();
}

class _TemporaryState extends State<Temporary> {
  bool _showSearchBar = false;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  var top = constraints.biggest.height;
                  _showSearchBar =
                      top <= screenHeight * 0.22; // Adjust as per your design
                  return FlexibleSpaceBar(
                      title: Text(
                        'Employees',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                      ),
                      background: Expanded(
                          child: Container(
                        color: Colors.grey.shade200,
                      )));
                },
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Item #$index'),
                  );
                },
                childCount: 50, // Number of items in the list
              ),
            ),
          ],
        ),
      ),
    );
  }
}
