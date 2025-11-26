import 'package:flutter/material.dart';

class Textcustom extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool obsecure;
  final TextEditingController controller;
  final String? Function(String?)? valid;

  const Textcustom({
    super.key,
    required this.label,
    required this.icon,
    this.obsecure = false,
    required this.controller,
    required this.valid,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        obscureText: obsecure,
        validator: valid,
        decoration: InputDecoration(
          label: Text(label),
          suffixIcon: Icon(icon),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
