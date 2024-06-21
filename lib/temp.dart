import 'package:animation_search_bar/animation_search_bar.dart';
import 'package:flutter/material.dart';
// import 'package:lucide_icons/lucide_icons.dart';

var Scrwidth;

class Temporary extends StatefulWidget {
  const Temporary({super.key});

  @override
  State<Temporary> createState() => _TemporaryState();
}

class _TemporaryState extends State<Temporary> {
  // bool _showSearchBar = false;
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    bool _isSearchOpen = false;
    Scrwidth = screenWidth;

    final List<Map<String, String>> Names = [
      {'name': 'Rishikesh Dhanavde', 'email': 'rishidhanavde@gmail.com'},
      {'name': 'Mukul Sardar', 'email': 'mukulsardar@gmail.com'},
      {'name': 'Sanchit Yadav', 'email': 'sanchityadav@gmail.com'},
      {'name': 'Rushikesh Sardar', 'email': 'rushikeshsardar@gmail.com'},
      {'name': 'Rishikesh Dhanavde', 'email': 'rishidhanavde@gmail.com'},
      {'name': 'Mukul Sardar', 'email': 'mukulsardar@gmail.com'},
      {'name': 'Sanchit Yadav', 'email': 'sanchityadav@gmail.com'},
      {'name': 'Rushikesh Sardar', 'email': 'rushikeshsardar@gmail.com'},
      {'name': 'Rishikesh Dhanavde', 'email': 'rishidhanavde@gmail.com'},
      {'name': 'Mukul Sardar', 'email': 'mukulsardar@gmail.com'},
      {'name': 'Sanchit Yadav', 'email': 'sanchityadav@gmail.com'},
      {'name': 'Rushikesh Sardar', 'email': 'rushikeshsardar@gmail.com'},
    ];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: screenHeight * 0.18,
            pinned: true,
            actions: [
              CustomAnimationSearchBar(
                onSearchOpen: () {
                  setState(() {
                    _isSearchOpen = true;
                  });
                },
                hintText: 'Search',
                centerTitle: '',
                onChanged: (text) => debugPrint(text),
                searchTextEditingController: controller,
                horizontalPadding: 5,
                onSearchClose: () {
                  setState(() {
                    _isSearchOpen = false;
                  });
                },
              ),
            ],
            // leading: IconButton(
            //   onPressed: () => Navigator.pop(context),
            //   icon: Icon(
            //     Icons.adaptive.arrow_back,
            //     size: 30,
            //     color: Colors.grey.shade700,
            //   ),
            // ),
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                // var top = constraints.biggest.height;
                // _showSearchBar = top <= screenHeight * 0.22; // Adjust as per your design
                return FlexibleSpaceBar(
                  titlePadding: EdgeInsets.only(bottom: 10, left: 60),
                  title: !_isSearchOpen
                      ? const Text(
                          'Employees',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )
                      : null,
                  background: Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.grey.shade200,
                  ),
                );
              },
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return CustomListTile(
                  names: Names[index]['name']!,
                  email: Names[index]['email']!,
                  width: Scrwidth,
                );
              },
              childCount: Names.length, // Number of items in the list
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAnimationSearchBar extends StatefulWidget {
  final String hintText;
  final String centerTitle;
  final ValueChanged<String> onChanged;
  final TextEditingController searchTextEditingController;
  final double horizontalPadding;
  final VoidCallback onSearchOpen;
  final VoidCallback onSearchClose;

  const CustomAnimationSearchBar({
    Key? key,
    required this.hintText,
    required this.centerTitle,
    required this.onChanged,
    required this.searchTextEditingController,
    required this.horizontalPadding,
    required this.onSearchOpen,
    required this.onSearchClose,
  }) : super(key: key);

  @override
  _CustomAnimationSearchBarState createState() =>
      _CustomAnimationSearchBarState();
}

class _CustomAnimationSearchBarState extends State<CustomAnimationSearchBar> {
  bool isSearchOpen = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSearchOpen = !isSearchOpen;
          if (isSearchOpen) {
            widget.onSearchOpen();
          } else {
            widget.onSearchClose();
          }
        });
      },
      child: AnimationSearchBar(
        hintText: widget.hintText,
        centerTitle: widget.centerTitle,
        onChanged: widget.onChanged,
        searchTextEditingController: widget.searchTextEditingController,
        horizontalPadding: widget.horizontalPadding,
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
    {'name': 'Rishikesh Dhanavde', 'email': 'rishidhanavde@gmail.com'},
    {'name': 'Mukul Sardar', 'email': 'mukulsardar@gmail.com'},
    {'name': 'Sanchit Yadav', 'email': 'sanchityadav@gmail.com'},
    {'name': 'Rushikesh Sardar', 'email': 'rushikeshsardar@gmail.com'},
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
