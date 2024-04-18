import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/components/providers/repositories/weight_repository_provider.dart';
import 'package:gym_app/infraestructure/models/chart_model.dart';

typedef WeightCallback = Future<ChartModel> Function();

final weightProvider = StateNotifierProvider<WeightNotifier, ChartModel>((ref) {
  final getWeightFunction = ref.watch(weightRepositoryProvider).getWeight;
  return WeightNotifier(getWeightFunction: getWeightFunction);
});

class WeightNotifier extends StateNotifier<ChartModel> {
  WeightCallback getWeightFunction;

  WeightNotifier({required this.getWeightFunction})
      : super(ChartModel(values: []));

  Future getWeight() async {
    final newWeight = await getWeightFunction();
    state = newWeight;
  }
}
