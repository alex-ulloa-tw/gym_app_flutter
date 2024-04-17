import 'package:flutter/material.dart';
import 'package:gym_app/components/screens/home/components/weight_chart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(1),
        child: Column(
          children: [
            _DaysTraining(
              days: 80,
            ),
            LineChartSample2()
          ],
        ),
      ),
    );
  }
}

class _DaysTraining extends StatelessWidget {
  final int days;

  const _DaysTraining({required this.days});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$days',
          style: const TextStyle(
            fontSize: 80,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,
          ),
        ),
        const Text('Días entrenando'),
      ],
    );
  }
}
