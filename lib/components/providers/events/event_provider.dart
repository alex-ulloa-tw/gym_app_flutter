import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/components/providers/repositories/events_repository_provider.dart';
import 'package:gym_app/infraestructure/models/event_model.dart';

typedef EventsCallback = Future<List<EventModel>> Function();

final eventsProvider =
    StateNotifierProvider<EventsNotifier, List<EventModel>>((ref) {
  final getEventsFunction = ref.watch(eventsRepositoryProvider).getEvents;
  return EventsNotifier(getEventsFunction: getEventsFunction);
});

class EventsNotifier extends StateNotifier<List<EventModel>> {
  EventsCallback getEventsFunction;

  EventsNotifier({required this.getEventsFunction}) : super([]);

  Future getEvents() async {
    final newEvents = await getEventsFunction();
    state = newEvents;
  }
}
