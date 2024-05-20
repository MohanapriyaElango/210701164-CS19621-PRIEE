import 'package:flutter/material.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  TextEditingController pass = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JoinUs"),
        centerTitle: true,
      ),
      body: Form(
        child: ListView(
          children: [
            // Image.asset("Assets/createacc.png"),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: email,
              decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.deepPurple, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  iconColor: Colors.deepPurple,
                  hintText: "Enter the Email",
                  icon: Icon(Icons.account_box_rounded)),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: true,
              controller: pass,
              decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.deepPurple, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  iconColor: Colors.deepPurple,
                  hintText: "Enter Password(more than 8 and less than 15 char)",
                  icon: Icon(Icons.account_balance_wallet)),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.deepPurple, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  iconColor: Colors.deepPurple,
                  hintText: "Enter the Address",
                  icon: Icon(Icons.add_location)),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.deepPurple, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  iconColor: Colors.deepPurple,
                  hintText: "Enter the Phone number",
                  icon: Icon(Icons.add_call)),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.deepPurple, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  iconColor: Colors.deepPurple,
                  hintText: "FCRA Id:",
                  icon: Icon(Icons.password)),
            ),
            const SizedBox(
              height: 70,
            ),
            ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Create',
                ))
          ],
        ),
      ),
    );
  }
}
