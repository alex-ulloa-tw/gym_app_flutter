import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/components/providers/weight/weight_provider.dart';
import 'package:gym_app/components/screens/home/components/weight_chart.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  final String weightTitle = 'Peso';

  @override
  void initState() {
    super.initState();
    ref.read(weightProvider.notifier).getWeight();
  }

  @override
  Widget build(BuildContext context) {
    final weightValues = ref.watch(weightProvider);

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: Column(
          children: [
            const _DaysTraining(
              days: 80,
            ),
            CustomLineChart(
              title: weightTitle,
              lineChartValues: weightValues,
            )
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
              height: 1),
        ),
        const Text(
          'Días entrenando',
        ),
      ],
    );
  }
}
