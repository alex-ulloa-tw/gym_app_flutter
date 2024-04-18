import 'package:gym_app/domain/datasources/weight_datasource.dart';
import 'package:gym_app/infraestructure/models/chart_model.dart';

class LocalWeightDatasource extends WeightDatasource {
  @override
  Future<ChartModel> getWeight() async {
    List<SpotValue> listOfWeight = [
      SpotValue(date: DateTime.utc(2024, 04, 01), value: 70),
      SpotValue(date: DateTime.utc(2024, 03, 02), value: 71.4),
      SpotValue(date: DateTime.utc(2024, 02, 10), value: 72.4),
      SpotValue(date: DateTime.utc(2024, 01, 20), value: 68.8),
    ];

    return ChartModel(values: listOfWeight);
  }
}
