import 'package:flutter/material.dart';

// Text field for entering the fuel cost.
//input: _updateFuelCost onChanged function
class TextFieldFuelCost extends StatelessWidget {
  // Constructor for the TextFieldFuelCost widget.
  const new({super.key, required this.onChanged});

  // Callback for when the user changes the text in the field.
  final ValueChanged<String> onChanged;

  // Builds the text field widget.
  @override
  Widget build(BuildContext context) {
    return TextField(
      // Decoration for the text field, including border and label.
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter Fuel Cost',
      ),
      keyboardType: TextInputType.number,
      onChanged: onChanged,
    );
  }
}
