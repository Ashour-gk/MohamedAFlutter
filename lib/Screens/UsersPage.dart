import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trail_b/Providers/Userprovider.dart';
import 'package:trail_b/Screens/UserDetails.dart';

class Userspage extends StatelessWidget {
  const Userspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text("UserPage"),
      ),
      body: Consumer<Userprovider>(
        builder: (context, value, child) {
          if (value.userModel == null) {
            value.getAllUsrData();
            return Center(child: CircularProgressIndicator());
          }

          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 5),
            itemBuilder: (context, index) {
              var us = value.userModel!.user[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Userdetails(
                        img: us.image,
                        nam: us.fname,
                        lnm: us.sname,
                        em: us.email,
                        addr: us.address,
                      ),
                    ),
                  );
                },
                child: Card(
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      CircleAvatar(backgroundImage: NetworkImage(us.image)),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                us.fname,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                us.sname,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Text(us.email),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: value.userModel!.user.length,
          );
        },
      ),
    );
  }
}
