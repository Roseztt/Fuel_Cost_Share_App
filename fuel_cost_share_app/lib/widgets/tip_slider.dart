import 'package:flutter/material.dart';

// Slider for choosing the tip percentage.
//input: giftPercentage, _updatePercentage onChanged function
class TipSlider extends StatelessWidget {
  // Constructor for the TipSlider widget.
  const new({
    super.key,
    required this._giftPercentage,
    required this.onChanged,
  });

  // The current tip percentage, as a decimal between 0 and 0.5.
  final double _giftPercentage;
  // Callback for when the user changes the tip percentage.
  final ValueChanged<double> onChanged;

  // Builds the slider widget.
  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _giftPercentage,
      onChanged: onChanged,
      min: 0,
      max: 0.5,
      // The number of divisions in the slider from 0% to 50%, each step is 10%.
      divisions: 5,
      label: '${(_giftPercentage * 100).round()}%',
    );
  }
}
