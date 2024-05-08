import 'package:gym_app/infraestructure/models/regular_event_model.dart';

abstract class RegularEventsRepository {
  Future<List<RegularEventModel>> getRegularEvents();
}
