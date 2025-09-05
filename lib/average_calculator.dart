import 'package:flutter/material.dart';

class AverageCalculator extends StatefulWidget {
  const AverageCalculator({super.key});

  @override
  State<AverageCalculator> createState() => _AverageCalculatorState();
}

class _AverageCalculatorState extends State<AverageCalculator> {
  final TextEditingController _grade1 = TextEditingController();
  final TextEditingController _grade2 = TextEditingController();
  final TextEditingController _grade3 = TextEditingController();
  double? _average;

  void _calculateAverage() {
    final grade1 = double.tryParse(_grade1.text) ?? 0;
    final grade2 = double.tryParse(_grade2.text) ?? 0;
    final grade3 = double.tryParse(_grade3.text) ?? 0;
    setState(() {
      _average = (grade1 + grade2 + grade3) / 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _grade1,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Nota 1',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _grade2,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Nota 2',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _grade3,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Nota 3',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: _calculateAverage,
          child: const Text('Calcular Média'),
        ),
        const SizedBox(height: 16),
        if (_average != null)
          Text(
            'A média: ${_average!.toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
      ],
    );
  }
}
