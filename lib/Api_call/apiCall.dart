import 'dart:convert';
import 'dart:typed_data';
import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:pree/provider/loginuid.dart';

class apiCall {
  static var baseurl = "http://192.168.11.72/api/";

  static Future<int> login(String email, String pass, loginuid a) async {
    var url = Uri.parse("${baseurl}donor");

    var jsonData = {"emailId": email, "password": pass};
    try {
      final res = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(jsonData));
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        var donorData = data["donor"];
        String organisationName = donorData["organisationName"];
        // print(organisationName);
        a.setUser_org(organisationName);
        a.setUser_name(donorData["name"]);
        a.setId(donorData["_id"]);
        a.setemail(donorData["emailId"]);
        if (donorData["isDonor"])
          a.setRole("1");
        else
          a.setRole("0");
        // print(data.runtimeType);
        print(donorData["isDonor"]);
        // print(data);
        // if(donorData[isDonor"])
        return 1;
      } else {
        print(res.statusCode);
        print("Failed to connect");
        return 0;
      }
    } catch (e) {
      print("Error: $e");
      return 0;
    }
  }

  static Future<List<dynamic>> getFood(String email, String pass) async {
    var jsonData = {"emailId": email, "password": pass};

    var url = Uri.parse("${baseurl}foodItemsWithStatusMinusOne");
    try {
      final res1 = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(jsonData));

      if (res1.statusCode == 200) {
        // var data = res1.body.toString();
        // var d1 = jsonDecode(data);

        Map<String, dynamic> jsonData = jsonDecode(res1.body.toString());
        List<dynamic> foodItems = jsonData['foodItems'];

        // print(res1.body.toString());
        // List<dynamic> dataList = jsonDecode(res1.body.toString());
        // print("**");
        print(foodItems[0]); // Should print: List<dynamic>
        // print("**");
        return foodItems;
      } else {
        print("Failed to connect, status code: ${res1.statusCode}");
        return [];
      }
    } catch (e) {
      print("Error: $e");
      return [];
    }
  }

  static postFood(
    String email,
    String fName,
    String fQuan,
    String org_name,
    String loc,

  ) async {
    var url = Uri.parse("${baseurl}addfood");

    final res = await http.post(url, 
    // headers: {"Content-Type": "application/json"},
    body: {
      "emailId": email,
      "quantity": fQuan,
      "foodName": fName,
      "organisationName": org_name,
      "foodstatus": "-1",
      "location": loc,
      "link": "not avail",
      "recv_emailId": "not avail"
    });

    try {
      if (res.statusCode == 201) {
        var data = jsonDecode(res.body.toString());
        print(data);
        return 1;
      } else {
        print("failed to connect");
        return 0;
      }
    } catch (e) {
      print(e.toString());
      return 0;
    }
  }

  static changeStatus(
    String orderID,
    String status,
  ) async {
    print(orderID);
    var url = Uri.parse("${baseurl}updateFoodStatus/${orderID}");

    final res = await http.post(url, body: {
      "foodstatus": status,
    });

    try {
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        print(data);
        return 1;
      } else {
        print("failed to connect");
        return 0;
      }
    } catch (e) {
      print(e.toString());
      return 0;
    }
  }

  static Future<List<dynamic>> getFoodFind(String email, String status) async {
    var jsonData = {"emailId": email, "foodstatus": status};

    var url = Uri.parse("${baseurl}foodItemsfind");
    try {
      final res1 = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(jsonData));

      if (res1.statusCode == 200) {
        // var data = res1.body.toString();
        // var d1 = jsonDecode(data);

        Map<String, dynamic> jsonData = jsonDecode(res1.body.toString());
        List<dynamic> foodItems = jsonData['foodItems'];

        // print(res1.body.toString());
        // List<dynamic> dataList = jsonDecode(res1.body.toString());
        // print("**");
        print(foodItems[0]); // Should print: List<dynamic>
        // print("**");
        return foodItems;
      } else {
        print("Failed to connect, status code: ${res1.statusCode}");
        return [];
      }
    } catch (e) {
      print("Error: $e");
      return [];
    }
  }
}
