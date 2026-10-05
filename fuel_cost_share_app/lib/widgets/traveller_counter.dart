import 'package:flutter/material.dart';

// Widget to display the number of travellers and use buttons to increment or decrement the count.
//input: personCount, theme, onIncrement, onDecrement
class TravellerCounter extends StatelessWidget {
  // Constructor for the TravellerCounter widget.
  const new({
    super.key,
    required this._personCount,
    required this.theme,
    required this.onIncrement,
    required this.onDecrement,
  });

  // The current number of travellers.
  final int _personCount;
  // The theme data for styling the text.
  final ThemeData theme;
  // Callback for when the user presses the increment button.
  final VoidCallback onIncrement;
  // Callback for when the user presses the decrement button.
  final VoidCallback onDecrement;

  // Builds the widget.
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Button to decrement the number of travellers.
        IconButton(onPressed: onDecrement, icon: Icon(Icons.remove)),
        // Display the current number of travellers.
        Text('$_personCount', style: theme.textTheme.titleMedium),
        // Button to increment the number of travellers.
        IconButton(onPressed: onIncrement, icon: Icon(Icons.add)),
      ],
    );
  }
}
