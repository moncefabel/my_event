import 'package:flutter/material.dart';

class MyStuff extends StatefulWidget {
  const MyStuff({super.key});

  @override
  State<MyStuff> createState() => _MyStuffState();
}

class _MyStuffState extends State<MyStuff> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Text(
                'Modify user information',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: 20.0),
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.only(top: 150.0),
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width / 2,
              child: SingleChildScrollView(
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        onSaved: (email) {},
                        decoration: const InputDecoration(
                          hintText: "Your email",
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(Icons.person),
                          ),
                        ),
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Enter your your email';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
                          textInputAction: TextInputAction.done,
                          decoration: const InputDecoration(
                            hintText: "First Name",
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(10.0),
                            ),
                          ),
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Enter your first name';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
                          textInputAction: TextInputAction.done,
                          decoration: const InputDecoration(
                            hintText: "Last Name",
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(10.0),
                            ),
                          ),
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Enter your last name';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
                          textInputAction: TextInputAction.done,
                          decoration: const InputDecoration(
                            hintText: "Phone number",
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(10.0),
                            ),
                          ),
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Enter your phone number';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 10.0 / 2),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Save".toUpperCase()),
                      ),
                      const SizedBox(height: 10.0),
                      ElevatedButton(
                          onPressed: () {}, child: const Text("Log out"))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
