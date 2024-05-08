import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/infraestructure/models/regular_event_model.dart';

class RegularEvent extends StatelessWidget {
  final RegularEventModel event;

  const RegularEvent({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    String time = DateFormat('HH:mm').format(event.date);

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [Colors.black87, Colors.black12]),
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Text(time),
                ),
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
                      Text(event.instructor),
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
