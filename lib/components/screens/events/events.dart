import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/components/providers/events/event_provider.dart';
import 'package:gym_app/components/screens/events/components/calendar.dart';
import 'package:gym_app/components/screens/events/components/event.dart';

class EventsScreen extends ConsumerStatefulWidget {
  const EventsScreen({super.key});

  @override
  ConsumerState<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends ConsumerState<EventsScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    ref.read(eventsProvider.notifier).getEvents();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final eventsValue = ref.watch(eventsProvider);
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: const [
            Tab(child: Text('Especiales')),
            Tab(child: Text('Regular')),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              ListView.builder(
                itemCount: eventsValue.length,
                itemBuilder: (context, index) {
                  final event = eventsValue[index];
                  return Event(event: event);
                },
              ),
              const TableEventsExample(
                title: 'Clases normales',
              )
            ],
          ),
        ),
      ],
    );
  }
}
