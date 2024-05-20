import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pree/pages/addFood.dart';
import 'package:pree/pages/requestedFood.dart';

class hotelMange extends StatefulWidget {
  const hotelMange({super.key});

  @override
  State<hotelMange> createState() => _hotelMangeState();
}

class _hotelMangeState extends State<hotelMange> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    final Screen = [AddFood(), reqPage()];
    final app_text = ["Add Food", "Requested Food"];
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
