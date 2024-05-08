import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/infraestructure/datasource/local_regular_events_datasource.dart';
import 'package:gym_app/infraestructure/repositories/regular_events_repository_impl.dart';

final regularEventsRepositoryProvider = Provider((ref) {
  final datasource = LocalRegularEventsDatasource();

  return RegularEventsRepositoryImpl(datasource: datasource);
});
