import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/components/providers/events/event_provider.dart';
import 'package:gym_app/components/screens/events/components/event.dart';

class EventsScreen extends ConsumerStatefulWidget {
  const EventsScreen({super.key});

  @override
  ConsumerState<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends ConsumerState<EventsScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(eventsProvider.notifier).getEvents();
  }

  @override
  Widget build(BuildContext context) {
    final eventsValue = ref.watch(eventsProvider);

    return ListView.builder(
      itemCount: eventsValue.length,
      itemBuilder: (context, index) {
        final event = eventsValue[index];
        return Event(event: event);
      },
    );
  }
}
