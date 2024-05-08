import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/components/providers/repositories/regular_events_repository_provider.dart';
import 'package:gym_app/infraestructure/models/regular_event_model.dart';

typedef EventsCallback = Future<List<RegularEventModel>> Function();

final regularEventsProvider =
    StateNotifierProvider<RegularEventsNotifier, List<RegularEventModel>>(
        (ref) {
  final getRegularEventsFunction =
      ref.watch(regularEventsRepositoryProvider).getRegularEvents;
  return RegularEventsNotifier(
      getRegularEventsFunction: getRegularEventsFunction);
});

class RegularEventsNotifier extends StateNotifier<List<RegularEventModel>> {
  EventsCallback getRegularEventsFunction;

  RegularEventsNotifier({required this.getRegularEventsFunction}) : super([]);

  Future getRegularEvents() async {
    final newEvents = await getRegularEventsFunction();
    state = newEvents;
  }
}
