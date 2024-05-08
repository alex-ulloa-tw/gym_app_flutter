import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/components/providers/regularEvents/regular_event_provider.dart';
import 'package:gym_app/components/screens/events/components/regular_event.dart';
import 'package:gym_app/infraestructure/models/regular_event_model.dart';
import 'package:table_calendar/table_calendar.dart';

class TableEventsExample extends ConsumerStatefulWidget {
  final String title;
  const TableEventsExample({super.key, required this.title});

  @override
  TableEventsExampleState createState() => TableEventsExampleState();
}

class TableEventsExampleState extends ConsumerState<TableEventsExample> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();

    ref.read(regularEventsProvider.notifier).getRegularEvents();

    _selectedDay = _focusedDay;
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<RegularEventModel> _getEventsForDay(DateTime day) {
    final eventsValue = ref.read(regularEventsProvider);
    return eventsValue.where((event) => isSameDay(event.date, day)).toList();
  }

  List<RegularEventModel> _filterByDay(
      DateTime? day, List<RegularEventModel> list) {
    return list.where((event) => isSameDay(event.date, day)).toList();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final events = ref.watch(regularEventsProvider);
    List<RegularEventModel> eventsOfTheDay = _filterByDay(_selectedDay, events);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          TableCalendar<RegularEventModel>(
            firstDay: DateTime.now(),
            lastDay: DateTime.now().add(const Duration(days: 60)),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            calendarFormat: _calendarFormat,
            rangeSelectionMode: RangeSelectionMode.disabled,
            eventLoader: _getEventsForDay,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: const CalendarStyle(
              // Use `CalendarStyle` to customize the UI
              outsideDaysVisible: false,
            ),
            onDaySelected: _onDaySelected,
            availableCalendarFormats: const {
              CalendarFormat.week: 'Semana',
              CalendarFormat.month: 'Mes',
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ListView.builder(
              itemCount: eventsOfTheDay.length,
              itemBuilder: (context, index) {
                return RegularEvent(
                  event: eventsOfTheDay[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
