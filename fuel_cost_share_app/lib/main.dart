import 'package:flutter/material.dart';
import 'package:fuel_cost_share_app/widgets/traveller_counter.dart';
import 'package:fuel_cost_share_app/widgets/tip_slider.dart';
import 'package:fuel_cost_share_app/widgets/textfield.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fgift',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepOrange)),
      home: Fgift(),
    );
  }
}

class Fgift extends StatefulWidget {
  const Fgift({super.key});

  @override
  State<Fgift> createState() => _FgiftState();
}

class _FgiftState extends State<Fgift> {
  int _personCount = 1;
  double _billAmount = 00.00;

  double _giftPercentage = 0.0;

  //Methods
  void increment() {
    setState(() {
      _personCount = _personCount + 1;
    });
  }

  void decrement() {
    setState(() {
      if (_personCount > 1) {
        _personCount = _personCount - 1;
      }
    });
  }

  void _updateFuelCost(String value) {
    setState(() {
      _billAmount = double.tryParse(value) ?? 0.0;
    });
  }

  void _updatePercentage(double value) {
    setState(() {
      _giftPercentage = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final style = theme.textTheme.titleMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );

    double tip = _billAmount * _giftPercentage;
    double totalAmount = _billAmount + tip;
    double perPerson = totalAmount / _personCount;
    return Scaffold(
      appBar: AppBar(title: const Text('Fuel Cost Sharing')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
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
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: theme.colorScheme.primary, width: 2),
              ),
              child: Column(
                children: [
                  TextFieldFuelCost(onChanged: _updateFuelCost),

                  //Split Bill area
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Split", style: theme.textTheme.titleMedium),
                      TravellerCounter(
                        personCount: _personCount,
                        theme: theme,
                        onIncrement: increment,
                        onDecrement: decrement,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tip', style: theme.textTheme.titleMedium),
                      Text(
                        tip.toStringAsFixed(2),
                        style: theme.textTheme.titleMedium,
                      ),
                    ],
                  ),
                  Text('${(_giftPercentage * 100).round()}%'),
                  TipSlider(
                    giftPercentage: _giftPercentage,
                    onChanged: _updatePercentage,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
