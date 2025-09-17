import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class DarMode extends StatefulWidget {
  const DarkMode({super.key});

  @override
  State<DarkMode> createState() => _DarkMode();
}

class _DarkMode extends State<DarkMode> {
  String _selectedValue = "On"; // default selected value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(224, 124, 124, 1),
        title: const Text("Setting"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // go back
          },
        ),
      ),
      body: Column(
        children: [
          RadioListTile<String>(
            title: const Text("On"),
            value: "On",
            groupValue: _selectedValue,
            onChanged: (value) {
              setState(() {
                _selectedValue = value!;
              });
            },
          ),
          RadioListTile<String>(
            title: const Text("Off"),
            value: "Off",
            groupValue: _selectedValue,
            onChanged: (value) {
              setState(() {
                _selectedValue = value!;
              });
            },
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Selected: $_selectedValue"),
                ),
              );
            },
            child: const Text("Confirm"),
          ),
        ],
      ),
    );
  }
}
