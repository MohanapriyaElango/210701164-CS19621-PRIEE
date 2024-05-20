import 'package:pree/provider/loginuid.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:pree/Api_call/apiCall.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  Future<List<dynamic>> getFoodData() async {
    List response = await apiCall.getFood("a@123", "123");
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<loginuid>(
      builder: (context, value, child) => Scaffold(
        body: FutureBuilder<List<dynamic>>(
          future: getFoodData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              List<dynamic> foodData = snapshot.data!;
              return ListView.builder(
                itemCount: foodData.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(foodData[index]['foodName']),
                          subtitle: Text(
                            'Quantity: ${foodData[index]['quantity']}',
                          ),
                          onTap: () {
                            // Handle card tap
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(foodData[index]['location']),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    await apiCall.changeStatus(
                                        foodData[index]['_id'], "1");

                                    setState(() {
                                      // Perform any necessary operations here
                                    });
                                  },
                                  child: Text('Request'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text("No data found"),
              );
            }
          },
        ),
      ),
    );
  }
}
