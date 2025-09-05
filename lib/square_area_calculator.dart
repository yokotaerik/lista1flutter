import 'package:flutter/material.dart';

class SquareAreaCalculator extends StatefulWidget {
  const SquareAreaCalculator({super.key});

  @override
  State<SquareAreaCalculator> createState() => _SquareAreaCalculatorState();
}

class _SquareAreaCalculatorState extends State<SquareAreaCalculator> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _lenghtController = TextEditingController();
  double? _area;

  void _convert() {
    final height = double.tryParse(_heightController.text);
    final lenght = double.tryParse(_lenghtController.text);

    setState(() {
        if (height != null && lenght != null) {
      _area = lenght * height;
    }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _heightController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: "Altura ",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _lenghtController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: "Base ",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(onPressed: _convert, child: const Text('Calcular')),
        const SizedBox(height: 16),
        if (_area != null)
          Text(
            'A area é: ${_area!.toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
      ],
    );
  }
}
