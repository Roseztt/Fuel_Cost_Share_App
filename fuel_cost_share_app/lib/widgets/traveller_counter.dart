import 'package:flutter/material.dart';

class TravellerCounter extends StatelessWidget {
  const new({
    super.key,
    required this._personCount,
    required this.theme,
    required this.onIncrement,
    required this.onDecrement,
  });

  final int _personCount;
  final ThemeData theme;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: onDecrement, icon: Icon(Icons.remove)),
        Text('$_personCount', style: theme.textTheme.titleMedium),
        IconButton(onPressed: onIncrement, icon: Icon(Icons.add)),
      ],
    );
  }
}
