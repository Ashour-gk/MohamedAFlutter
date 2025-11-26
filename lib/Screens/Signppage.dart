import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trail_b/Providers/AuthProvidder.dart';
import 'package:trail_b/Screens/LoginPage.dart';
import 'package:trail_b/Widgets/TextCustom.dart';

class Signppage extends StatelessWidget {
  const Signppage({super.key});

  @override
  Widget build(BuildContext context) {
    var namecon = TextEditingController();
    var phonecon = TextEditingController();
    var emailcon = TextEditingController();
    var passcon = TextEditingController();
    var fromkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text("Signup"),
        actions: [Icon(Icons.settings)],
      ),
      body: Center(
        child: Form(
          key: fromkey,
          child: Column(
            children: [
              Icon(
                Icons.account_circle_outlined,
                size: 200,
                color: Colors.purple,
              ),
              Textcustom(
                label: "UserName",
                icon: Icons.person,

                controller: namecon,
                valid: (value) {
                  if (value == null || value.isEmpty) {
                    return "The Name field is required.";
                  }

                  return null;
                },
              ),
              SizedBox(height: 20),
              Textcustom(
                label: "Phone",
                icon: Icons.phone,

                controller: phonecon,
                valid: (value) {
                  if (value == null || value.isEmpty) {
                    return "The Phone field is required.";
                  }

                  return null;
                },
              ),
              SizedBox(height: 20),
              Textcustom(
                label: "Email",
                icon: Icons.email,
                controller: emailcon,
                valid: (value) {
                  if (value == null || value.isEmpty) {
                    return "The Email field is required.";
                  }
                  if (!value.contains('@')) {
                    return "Enter Valid Email.";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              Textcustom(
                label: "Password",
                icon: Icons.lock,
                obsecure: true,
                controller: passcon,
                valid: (value) {
                  if (value == null || value.isEmpty) {
                    return "The password field is required.";
                  }

                  return null;
                },
              ),
              SizedBox(height: 20),
              Consumer<Authprovidder>(
                builder: (context, value, child) {
                  return ElevatedButton(
                    onPressed: () async {
                      if (fromkey.currentState!.validate()) {
                        await value.SignUpdata(
                          name: namecon.text,
                          phone: phonecon.text,
                          Email: emailcon.text,
                          Pass: passcon.text,
                        );
                        if (value.authmodel!.status == true) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Loginpage(),
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(value.authmodel!.message),
                              backgroundColor: Colors.green,
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(value.authmodel!.message)),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.white,
                    ),
                    child: Text("SignUp"),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Loginpage()),
                      );
                    },
                    child: Text("login", style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
