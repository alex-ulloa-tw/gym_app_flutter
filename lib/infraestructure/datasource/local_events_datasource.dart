import 'package:gym_app/domain/datasources/events_datasource.dart';
import 'package:gym_app/infraestructure/models/event_model.dart';

class LocalEventsDatasource extends EventsDatasource {
  @override
  Future<List<EventModel>> getEvents() async {
    List<EventModel> listOfEvents = [
      EventModel(
          title: 'Abierto Jujitsu',
          date: DateTime(2024, 12, 12),
          location: 'En el gimnasio'),
      EventModel(
          title: 'Abierto Jujitsu',
          date: DateTime(2024, 12, 12),
          location: 'En el gimnasio'),
      EventModel(
          title: 'Abierto Jujitsu',
          date: DateTime(2024, 12, 12),
          location: 'En el gimnasio'),
    ];

    return listOfEvents;
  }
}
