import 'package:gym_app/infraestructure/models/chart_model.dart';

abstract class WeightDatasource {
  Future<ChartModel> getWeight();
}
