import 'package:flutter/material.dart';

class TipSlider extends StatelessWidget {
  const new({
    super.key,
    required this._giftPercentage,
    required this.onChanged,
  });

  final double _giftPercentage;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _giftPercentage,
      onChanged: onChanged,
      min: 0,
      max: 0.5,
      divisions: 5,
      label: '${(_giftPercentage * 100).round()}%',
    );
  }
}
