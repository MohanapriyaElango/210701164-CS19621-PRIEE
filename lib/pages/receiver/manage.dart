import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pree/pages/receiver/acceptedFood.dart';
import 'package:pree/pages/receiver/viewFood.dart';

class studentRequest extends StatefulWidget {
  const studentRequest({Key? key}) : super(key: key);

  @override
  State<studentRequest> createState() => _studentRequestState();
}

class _studentRequestState extends State<studentRequest> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    final Screen = [FoodPage(), accFoodPage()];
    final app_text = ["Food List", "Accepted Food"];
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          color: Color.fromRGBO(183, 154, 223, 1),
          backgroundColor: Colors.transparent,
          index: i,
          onTap: (index) {
            setState(() {
              i = index;
            });
          },
          items: const [
            Icon(
              Icons.request_page_rounded,
            ),
            Icon(Icons.history)
          ]),
      appBar: AppBar(
        title: Text(app_text[i]),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => StudentProfile(),
                //     ));
              },
              icon: Icon(Icons.account_circle_outlined)),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.logout)),
        ],
      ),
      body: Screen[i],
      // ),
      // ),
    );
  }
}
