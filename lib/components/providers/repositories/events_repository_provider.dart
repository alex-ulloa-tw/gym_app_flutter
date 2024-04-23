import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/infraestructure/datasource/local_events_datasource.dart';
import 'package:gym_app/infraestructure/repositories/events_repository_impl.dart';

final eventsRepositoryProvider = Provider((ref) {
  final datasource = LocalEventsDatasource();

  return EventsRepositoryImpl(datasource: datasource);
});
