import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class DataSource extends CalendarDataSource {
  DataSource(this.source);

  List<Appointment> source;

  @override
  List<dynamic> get appointments => source;
}

DataSource getCalendarDataSource() {
  final List<Appointment> appointments = <Appointment>[];
  appointments.add(Appointment(
    startTime: DateTime.now(),
    endTime: DateTime.now().add(const Duration(hours: 1)),
    subject: 'Meeting',
    color: Colors.pink,
    isAllDay: true,
  ));
  appointments.add(Appointment(
    startTime: DateTime.now().add(const Duration(hours: 4, days: -1)),
    endTime: DateTime.now().add(const Duration(hours: 5, days: -1)),
    subject: 'Release Meeting',
    color: Colors.lightBlueAccent,
  ));
  appointments.add(Appointment(
    startTime: DateTime.now().add(const Duration(hours: 2, days: -3)),
    endTime: DateTime.now().add(const Duration(hours: 3, days: -2)),
    subject: 'Performance check',
    color: Colors.amber,
  ));
  // appointments.add(Appointment(
  //   startTime: DateTime.now().add(const Duration(hours: 6, days: -3)),
  //   endTime: DateTime.now().add(const Duration(hours: 7, days: -3)),
  //   subject: 'Support',
  //   color: Colors.green,
  // ));
  appointments.add(Appointment(
    startTime: DateTime.now().add(const Duration(hours: 6, days: 2)),
    endTime: DateTime.now().add(const Duration(hours: 7, days: 2)),
    subject: 'Retrospective',
    color: Colors.purple,
  ));

  return DataSource(appointments);
}
