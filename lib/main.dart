import 'package:erikbolado/discount_calculator.dart';
import 'package:erikbolado/square_area_calculator.dart';
import 'package:flutter/material.dart';
import 'celsius_to_fahrenheit_converter.dart';
import 'average_calculator.dart';
import 'shopping_list.dart';
import 'daily_tasks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Conversor Celsius para Fahrenheit'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CelsiusToFahrenheitConverter(),
              SizedBox(height: 32),
              AverageCalculator(),
              SquareAreaCalculator(),
              DiscountCalculator(),
              SizedBox(height: 32),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShoppingListPage(),
                    ),
                  );
                },
                child: Text('Lista de Compras'),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DailyTasksPage(),
                    ),
                  );
                },
                child: Text('Tarefas Diárias'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
