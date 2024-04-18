import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/infraestructure/datasource/local_weight_datasource.dart';
import 'package:gym_app/infraestructure/repositories/weight_repository_impl.dart';

final weightRepositoryProvider = Provider((ref) {
  final datasource = LocalWeightDatasource();

  return WeightRepositoryImpl(datasource: datasource);
});
