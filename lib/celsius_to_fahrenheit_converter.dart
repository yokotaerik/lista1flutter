import 'package:flutter/material.dart';

class CelsiusToFahrenheitConverter extends StatefulWidget {
  const CelsiusToFahrenheitConverter({super.key});

  @override
  State<CelsiusToFahrenheitConverter> createState() => _CelsiusToFahrenheitConverterState();
}

class _CelsiusToFahrenheitConverterState extends State<CelsiusToFahrenheitConverter> {
  final TextEditingController _celsiusController = TextEditingController();
  double? _fahrenheit;

  void _convert() {
    final celsius = double.tryParse(_celsiusController.text);
    if (celsius != null) {
      setState(() {
        _fahrenheit = (celsius * 9 / 5) + 32;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _celsiusController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Temperatura em Celsius',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: _convert,
          child: const Text('Converter'),
        ),
        const SizedBox(height: 16),
        if (_fahrenheit != null)
          Text(
            'Temperatura em Fahrenheit: ${_fahrenheit!.toStringAsFixed(2)}°F',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
      ],
    );
  }
}
