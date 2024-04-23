import 'package:gym_app/domain/datasources/events_datasource.dart';
import 'package:gym_app/domain/repository/events_repository.dart';
import 'package:gym_app/infraestructure/models/event_model.dart';

class EventsRepositoryImpl extends EventsRepository {
  final EventsDatasource datasource;

  EventsRepositoryImpl({required this.datasource});

  @override
  Future<List<EventModel>> getEvents() {
    return datasource.getEvents();
  }
}
