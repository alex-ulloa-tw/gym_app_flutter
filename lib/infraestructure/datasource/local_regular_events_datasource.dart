import 'package:gym_app/domain/datasources/regular_events_datasource.dart';
import 'package:gym_app/infraestructure/models/regular_event_model.dart';

class LocalRegularEventsDatasource extends RegularEventsDatasource {
  @override
  Future<List<RegularEventModel>> getRegularEvents() async {
    List<DateTime> datesList = List<DateTime>.generate(
        60,
        (i) => DateTime.utc(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day,
              0,
              0,
            ).add(Duration(days: i)));

    List<RegularEventModel> listOfEvents = [];
    for (var date in datesList) {
      String instructor = '';
      List<RegularEventModel> eventsOftheDay = [];

      switch (date.weekday) {
        case DateTime.monday:
          instructor = 'Diego Herrera';
          eventsOftheDay = [
            RegularEventModel(
                title: 'BJJ GI',
                instructor: instructor,
                date: date.add(const Duration(hours: 6))),
            RegularEventModel(
                title: 'BJJ GI',
                instructor: instructor,
                date: date.add(const Duration(hours: 7, minutes: 15))),
            RegularEventModel(
                title: 'Pro team',
                instructor: instructor,
                date: date.add(const Duration(hours: 11, minutes: 0))),
            RegularEventModel(
                title: 'Pro team',
                instructor: instructor,
                date: date.add(const Duration(hours: 12, minutes: 30))),
            RegularEventModel(
                title: 'Kids',
                instructor: instructor,
                date: date.add(const Duration(hours: 16, minutes: 00))),
            RegularEventModel(
                title: 'BJJ GI',
                instructor: instructor,
                date: date.add(const Duration(hours: 17, minutes: 30))),
            RegularEventModel(
                title: 'BJJ GI',
                instructor: instructor,
                date: date.add(const Duration(hours: 19, minutes: 00))),
          ];
          break;

        case DateTime.tuesday:
          instructor = 'Ricardo Centeno';
          eventsOftheDay = [
            RegularEventModel(
                title: 'Striking',
                instructor: instructor,
                date: date.add(const Duration(hours: 6))),
            RegularEventModel(
                title: 'MMA No GI',
                instructor: instructor,
                date: date.add(const Duration(hours: 7, minutes: 15))),
            RegularEventModel(
                title: 'Pro team',
                instructor: instructor,
                date: date.add(const Duration(hours: 11, minutes: 0))),
            RegularEventModel(
                title: 'Pro team',
                instructor: instructor,
                date: date.add(const Duration(hours: 12, minutes: 30))),
            RegularEventModel(
                title: 'Begginers',
                instructor: instructor,
                date: date.add(const Duration(hours: 16, minutes: 00))),
            RegularEventModel(
                title: 'MMA No GI',
                instructor: instructor,
                date: date.add(const Duration(hours: 17, minutes: 30))),
            RegularEventModel(
                title: 'Striking',
                instructor: instructor,
                date: date.add(const Duration(hours: 19, minutes: 00))),
          ];
          break;

        case DateTime.wednesday:
          instructor = 'Diego Herrera';
          eventsOftheDay = [
            RegularEventModel(
                title: 'BJJ GI',
                instructor: instructor,
                date: date.add(const Duration(hours: 6))),
            RegularEventModel(
                title: 'BJJ GI',
                instructor: instructor,
                date: date.add(const Duration(hours: 7, minutes: 15))),
            RegularEventModel(
                title: 'Pro team',
                instructor: instructor,
                date: date.add(const Duration(hours: 11, minutes: 0))),
            RegularEventModel(
                title: 'Pro team',
                instructor: instructor,
                date: date.add(const Duration(hours: 12, minutes: 30))),
            RegularEventModel(
                title: 'Kids',
                instructor: instructor,
                date: date.add(const Duration(hours: 16, minutes: 00))),
            RegularEventModel(
                title: 'BJJ GI',
                instructor: instructor,
                date: date.add(const Duration(hours: 17, minutes: 30))),
            RegularEventModel(
                title: 'BJJ GI',
                instructor: instructor,
                date: date.add(const Duration(hours: 19, minutes: 00))),
          ];
          break;

        case DateTime.thursday:
          instructor = 'Ricardo Centeno';
          eventsOftheDay = [
            RegularEventModel(
                title: 'Striking',
                instructor: instructor,
                date: date.add(const Duration(hours: 6))),
            RegularEventModel(
                title: 'MMA No GI',
                instructor: instructor,
                date: date.add(const Duration(hours: 7, minutes: 15))),
            RegularEventModel(
                title: 'Pro team',
                instructor: instructor,
                date: date.add(const Duration(hours: 11, minutes: 0))),
            RegularEventModel(
                title: 'Pro team',
                instructor: instructor,
                date: date.add(const Duration(hours: 12, minutes: 30))),
            RegularEventModel(
                title: 'Begginers',
                instructor: instructor,
                date: date.add(const Duration(hours: 16, minutes: 00))),
            RegularEventModel(
                title: 'MMA No GI',
                instructor: instructor,
                date: date.add(const Duration(hours: 17, minutes: 30))),
            RegularEventModel(
                title: 'Striking',
                instructor: instructor,
                date: date.add(const Duration(hours: 19, minutes: 00))),
          ];
          break;

        case DateTime.friday:
          instructor = 'Ricardo Centeno';
          eventsOftheDay = [
            RegularEventModel(
                title: 'Striking',
                instructor: instructor,
                date: date.add(const Duration(hours: 6))),
            RegularEventModel(
                title: 'MMA No GI',
                instructor: instructor,
                date: date.add(const Duration(hours: 7, minutes: 15))),
            RegularEventModel(
                title: 'Pro team',
                instructor: instructor,
                date: date.add(const Duration(hours: 11, minutes: 0))),
            RegularEventModel(
                title: 'Pro team',
                instructor: instructor,
                date: date.add(const Duration(hours: 12, minutes: 30))),
            RegularEventModel(
                title: 'Begginers',
                instructor: instructor,
                date: date.add(const Duration(hours: 16, minutes: 00))),
            RegularEventModel(
                title: 'MMA No GI',
                instructor: instructor,
                date: date.add(const Duration(hours: 17, minutes: 30))),
            RegularEventModel(
                title: 'Striking',
                instructor: instructor,
                date: date.add(const Duration(hours: 19, minutes: 00))),
          ];
          break;

        case DateTime.saturday:
        case DateTime.sunday:
          eventsOftheDay = [
            RegularEventModel(
                title: 'Open mat',
                instructor: 'Open mat kids',
                date: date.add(const Duration(hours: 11, minutes: 00))),
          ];
          break;
      }

      listOfEvents.addAll(eventsOftheDay);
    }

    return listOfEvents;
  }
}
