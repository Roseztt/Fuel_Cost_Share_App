import 'package:flutter/material.dart';
// import the different refactored widgets from the widgets folder.
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

// State class for the Fgift widget, managing the state of the application.
class _FgiftState extends State<Fgift> {
  //keep track of the number of travellers and the bill amount.
  int _personCount = 1;
  double _billAmount = 00.00;

  // The current tip percentage, as a decimal between 0 and 0.5.
  double _giftPercentage = 0.0;

  //Methods

  // Method to increment the number of travellers by 1.
  void increment() {
    setState(() {
      _personCount = _personCount + 1;
    });
  }

  // Method to decrement the number of travellers by 1
  // make sure it doesn't go below 1.
  void decrement() {
    setState(() {
      if (_personCount > 1) {
        _personCount = _personCount - 1;
      }
    });
  }

  // Method to update the bill amount based on user input.
  void _updateFuelCost(String value) {
    setState(() {
      _billAmount = double.tryParse(value) ?? 0.0;
    });
  }

  // Method to update the tip percentage based on user input from the slider.
  void _updatePercentage(double value) {
    setState(() {
      _giftPercentage = value;
    });
  }

  // Method to calculate the total tip based on the bill amount and tip percentage.
  double totalTip() {
    return _billAmount * _giftPercentage;
  }

  // Method to calculate the total amount per person, including the tip.
  double totalPerPerson() {
    double totalAmount = _billAmount + totalTip();
    return totalAmount / _personCount;
  }

  // Builds the main UI of the application.
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final style = theme.textTheme.titleMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );

    // Calculate the total tip and total amount per person.
    double tip = totalTip();
    double perPerson = totalPerPerson();

    return Scaffold(
      // AppBar and body of the application.
      appBar: AppBar(title: const Text('Fuel Cost Sharing')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Use the refactored TotalPerTraveller widget to display the total cost per traveller.
          // Pass the calculated perPerson value, style, and theme to the widget.
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
                  // Use the refactored TextFieldFuelCost widget to handle user input for the fuel cost.
                  // Pass the _updateFuelCost method as the onChanged to update the state when the user enters a new value.
                  TextFieldFuelCost(onChanged: _updateFuelCost),

                  //Split Bill area
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Split", style: theme.textTheme.titleMedium),
                      // Use the refactored TravellerCounter widget to manage the number of travellers.
                      // Pass the current person count, theme, and increment/decrement callbacks to the widget.
                      TravellerCounter(
                        personCount: _personCount,
                        theme: theme,
                        onIncrement: increment,
                        onDecrement: decrement,
                      ),
                    ],
                  ),
                  // Use the refactored TipRow widget to display the calculated tip amount.
                  // Pass the current theme and calculated tip to the widget.
                  TipRow(theme: theme, tip: tip),
                  Text('${(_giftPercentage * 100).round()}%'),
                  // Use the refactored TipSlider widget to allow the user to select a tip percentage.
                  // Pass the current tip percentage and the _updatePercentage
                  // method as the onChanged to update the state when the user changes the slider value.
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
