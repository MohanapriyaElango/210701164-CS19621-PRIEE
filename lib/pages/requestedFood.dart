import 'package:flutter/material.dart';
import 'package:pree/Api_call/apiCall.dart';
import 'package:pree/provider/loginuid.dart';
import 'package:provider/provider.dart';

class reqPage extends StatefulWidget {
  const reqPage({super.key});

  @override
  State<reqPage> createState() => _reqPageState();
}

class _reqPageState extends State<reqPage> {
  Future<List<dynamic>> getFoodData(String email) async {
    List response = await apiCall.getFoodFind(email, "1");
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<loginuid>(
      builder: (context, value, child) => Scaffold(
        body: FutureBuilder<List<dynamic>>(
          future: getFoodData(value.email),
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
                              ElevatedButton(
                                onPressed: () async {
                                  await apiCall.changeStatus(
                                      foodData[index]['_id'], "0");

                                  setState(() {
                                    // Perform any necessary operations here
                                  });
                                },
                                child: Text('Accept'),
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
