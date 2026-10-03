import 'package:flutter/material.dart';

class TotalPerTraveller extends StatelessWidget {
  const new({
    super.key,
    required this.style,
    required this.perPerson,
    required this.theme,
  });

  final TextStyle style;
  final double perPerson;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inversePrimary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
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
