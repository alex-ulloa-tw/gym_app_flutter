import 'package:gym_app/infraestructure/models/regular_event_model.dart';

abstract class RegularEventsDatasource {
  Future<List<RegularEventModel>> getRegularEvents();
}
