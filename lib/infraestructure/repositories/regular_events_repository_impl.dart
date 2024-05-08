import 'package:gym_app/domain/datasources/regular_events_datasource.dart';
import 'package:gym_app/domain/repository/regular_events_repository.dart';
import 'package:gym_app/infraestructure/models/regular_event_model.dart';

class RegularEventsRepositoryImpl extends RegularEventsRepository {
  final RegularEventsDatasource datasource;

  RegularEventsRepositoryImpl({required this.datasource});

  @override
  Future<List<RegularEventModel>> getRegularEvents() {
    return datasource.getRegularEvents();
  }
}
