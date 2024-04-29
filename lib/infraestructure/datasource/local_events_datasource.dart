import 'package:gym_app/domain/datasources/events_datasource.dart';
import 'package:gym_app/infraestructure/models/event_model.dart';

class LocalEventsDatasource extends EventsDatasource {
  @override
  Future<List<EventModel>> getEvents() async {
    List<EventModel> listOfEvents = [
      EventModel(
          title: 'Abierto Jujitsu',
          date: DateTime(2024, 02, 1),
          location: 'En el gimnasio'),
      EventModel(
          title: 'Solo cinturones negros',
          date: DateTime(2024, 04, 2),
          location: 'En el gimnasio'),
      EventModel(
          title: 'Todos contra todos sin miedo',
          date: DateTime(2024, 10, 12),
          location: 'En el gimnasio'),
    ];

    return listOfEvents;
  }
}
