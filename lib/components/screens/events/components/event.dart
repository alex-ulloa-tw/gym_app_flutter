import 'package:flutter/material.dart';
import 'package:gym_app/infraestructure/models/event_model.dart';
import 'package:intl/intl.dart';

class Event extends StatelessWidget {
  final EventModel event;

  const Event({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    String dateReadable =
        DateFormat('E dd/M/yyyy').format(event.date).toUpperCase();

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
              gradient:
                  const LinearGradient(colors: [Colors.grey, Colors.black87]),
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Flexible(
                    flex: 1,
                    child: Center(
                        child: Icon(
                      Icons.local_activity_outlined,
                      size: 90,
                    ))),
                const Spacer(),
                Flexible(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(dateReadable),
                      Text(event.location)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
