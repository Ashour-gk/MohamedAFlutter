import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trail_b/Providers/AuthProvidder.dart';
import 'package:trail_b/Screens/Signppage.dart';
import 'package:trail_b/Screens/UsersPage.dart';
import 'package:trail_b/Widgets/TextCustom.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailcon = TextEditingController();
    var passcon = TextEditingController();
    var fromkey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text("Login"),
        actions: [Icon(Icons.settings)],
      ),
      body: Center(
        child: Form(
          key: fromkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.account_circle_outlined,
                size: 200,
                color: Colors.purple,
              ),
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
                icon: Icons.remove_red_eye,
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
                        await value.Logindata(
                          Email: emailcon.text,
                          Pass: passcon.text,
                        );
                        if (value.authmodel!.status == true) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Userspage(),
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
                    child: Text("Login"),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Signppage()),
                      );
                    },
                    child: Text("Signup", style: TextStyle(color: Colors.blue)),
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
