import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/components/providers/weight/weight_provider.dart';
import 'package:gym_app/components/screens/home/components/weight_chart.dart';
import 'package:intl/intl.dart';

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
            ),
            _PlanValidUntil(
              date: DateTime.now().add(const Duration(days: 200)),
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

class _PlanValidUntil extends StatelessWidget {
  final DateTime date;

  const _PlanValidUntil({required this.date});

  @override
  Widget build(BuildContext context) {
    String monthName = DateFormat('MMM').format(date).toUpperCase();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.black26,
        child: Row(children: [
          const Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Text(
                'Plan válido hasta',
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.end,
              )),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Column(
              children: [
                Text(
                  '${date.day}',
                  style: const TextStyle(
                      fontSize: 60, fontWeight: FontWeight.w700, height: 1),
                  textAlign: TextAlign.start,
                ),
                Text(
                  monthName,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
