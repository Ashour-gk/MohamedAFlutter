import 'package:flutter/material.dart';

class Userdetails extends StatelessWidget {
  final String img;
  final String nam;
  final String lnm;
  final String em;
  final String addr;

  const Userdetails({
    required this.img,
    required this.nam,
    required this.lnm,
    required this.em,
    required this.addr,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text("UserDetails"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 3,
          margin: EdgeInsets.only(bottom: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(backgroundImage: NetworkImage(img)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Name:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 5),
                    Text(nam),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Email:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(em),
                    SizedBox(width: 5),
                    Text(lnm, style: TextStyle(fontSize: 10)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Address:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 5),
                    Text(addr),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
