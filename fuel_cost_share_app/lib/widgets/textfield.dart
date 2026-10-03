import 'package:flutter/material.dart';

class TextFieldFuelCost extends StatelessWidget {
  const new({super.key, required this.onChanged});

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter Fuel Cost',
      ),
      keyboardType: TextInputType.number,
      onChanged: onChanged,
    );
  }
}
