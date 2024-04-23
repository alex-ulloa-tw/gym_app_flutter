import 'package:gym_app/infraestructure/models/event_model.dart';

abstract class EventsDatasource {
  Future<List<EventModel>> getEvents();
}
