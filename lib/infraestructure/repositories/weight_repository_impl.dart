import 'package:gym_app/domain/datasources/weight_datasource.dart';
import 'package:gym_app/domain/repository/weight_repository.dart';
import 'package:gym_app/infraestructure/models/chart_model.dart';

class WeightRepositoryImpl extends WeightRepository {
  final WeightDatasource datasource;

  WeightRepositoryImpl({required this.datasource});

  @override
  Future<ChartModel> getWeight() {
    return datasource.getWeight();
  }
}
