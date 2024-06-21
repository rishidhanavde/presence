import 'package:flutter/material.dart';
import 'package:animation_search_bar/animation_search_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedSearchBarPage(),
    );
  }
}

class AnimatedSearchBarPage extends StatefulWidget {
  @override
  _AnimatedSearchBarPageState createState() => _AnimatedSearchBarPageState();
}

class _AnimatedSearchBarPageState extends State<AnimatedSearchBarPage> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimationSearchBar(
                backIconColor: Colors.black,
                centerTitle: 'App Title',
                onChanged: (text) => debugPrint(text),
                searchTextEditingController: controller,
                horizontalPadding: 5,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 20, // Example list length
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Item #$index'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
