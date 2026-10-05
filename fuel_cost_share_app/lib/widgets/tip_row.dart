import 'package:flutter/material.dart';

// Row widget to display the tip amount.
//input: theme, tip
class TipRow extends StatelessWidget {
  // Constructor for the TipRow widget.
  const new({super.key, required this.theme, required this.tip});

  // The theme data for styling the text.
  final ThemeData theme;
  // The tip amount to display.
  final double tip;

  // Builds the row widget.
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Tip', style: theme.textTheme.titleMedium),
        Text(tip.toStringAsFixed(2), style: theme.textTheme.titleMedium),
      ],
    );
  }
}
