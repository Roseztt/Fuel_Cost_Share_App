import 'package:flutter/material.dart';
import 'package:fuel_cost_share_app/widgets/traveller_counter.dart';
import 'package:fuel_cost_share_app/widgets/tip_slider.dart';
import 'package:fuel_cost_share_app/widgets/textfield.dart';
import 'package:fuel_cost_share_app/widgets/total_per_traveller.dart';
import 'package:fuel_cost_share_app/widgets/tip_row.dart';

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

  double totalTip() {
    return _billAmount * _giftPercentage;
  }

  double totalPerPerson() {
    double totalAmount = _billAmount + totalTip();
    return totalAmount / _personCount;
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final style = theme.textTheme.titleMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );

    double tip = totalTip();
    double perPerson = totalPerPerson();

    return Scaffold(
      appBar: AppBar(title: const Text('Fuel Cost Sharing')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TotalPerTraveller(style: style, perPerson: perPerson, theme: theme),
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
                  TipRow(theme: theme, tip: tip),
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
