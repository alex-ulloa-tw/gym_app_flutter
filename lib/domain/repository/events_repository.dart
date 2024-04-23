import 'package:gym_app/infraestructure/models/event_model.dart';

abstract class EventsRepository {
  Future<List<EventModel>> getEvents();
}
