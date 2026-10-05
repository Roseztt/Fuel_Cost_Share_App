import 'package:flutter/material.dart';

// Widget to display the total fuel cost per traveller.
//input: style, perPerson, theme
class TotalPerTraveller extends StatelessWidget {
  // Constructor for the TotalPerTraveller widget.
  const new({
    super.key,
    required this.style,
    required this.perPerson,
    required this.theme,
  });

  // The text style for the displayed text.
  final TextStyle style;
  // The total fuel cost per traveller.
  final double perPerson;
  // The theme data for styling the text.
  final ThemeData theme;

  // Builds the widget.
  @override
  Widget build(BuildContext context) {
    return Container(
      // Padding and decoration for the container.
      padding: const EdgeInsets.all(18),
      // Styling the container with a background color and rounded corners.
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inversePrimary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          // Display the total fuel cost per traveller.
          Text('Total Fuel Cost Per Traveller', style: style),
          Text(
            '£${perPerson.toStringAsFixed(2)}',
            style: style.copyWith(
              color: theme.colorScheme.onPrimary,
              fontSize: theme.textTheme.displaySmall?.fontSize,
            ),
          ),
        ],
      ),
    );
  }
}
