import 'package:flutter/material.dart';
import 'package:project/controller/data_source.dart';
import 'package:project/controller/hex_color.dart';
import 'package:project/widget/daycell.dart';
import 'package:project/widget/home/sidebar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:intl/intl.dart';
import 'package:flutter/scheduler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CalendarController _controller = CalendarController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String? _headerText;
  double? width, cellWidth;
  bool monthChk = false;
  String _text = "";
  @override
  void initState() {
    _headerText = 'month';
    width = 0.0;
    cellWidth = 0.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    cellWidth = ((width! - 26) / 7);
    return Scaffold(
      key: _scaffoldKey,
      // sidebar menu
      drawer: Drawer(width: width! * 0.9, child: const Siderbar()),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            padding: const EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.black,
                        size: 24,
                      ),
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 223, 223, 223),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      width: 150,
                      height: 40,
                      child: Center(
                        child: Text(_headerText!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
                DayCellWidget(
                  width: cellWidth,
                ),
                Expanded(
                  child: SfCalendar(
                    controller: _controller,
                    headerHeight: 0,
                    viewHeaderHeight: 0,
                    view: CalendarView.month,
                    backgroundColor: Colors.white,
                    monthCellBuilder: monthCellBuilder,
                    // timeRegionBuilder: timeregionBuilder,
                    // specialRegions: _getTimeRegions(),
                    cellEndPadding: 0,
                    todayHighlightColor: Colors.red,
                    onTap: selectionTap,
                    selectionDecoration: const BoxDecoration(
                      color: Colors.black12,
                    ),
                    dataSource: getCalendarDataSource(),
                    monthViewSettings: const MonthViewSettings(
                      appointmentDisplayMode:
                          MonthAppointmentDisplayMode.appointment,
                      dayFormat: 'EEE',
                    ),
                    onViewChanged: (ViewChangedDetails viewChangedDetails) {
                      _headerText = DateFormat('MMMM yyyy')
                          .format(viewChangedDetails.visibleDates[
                              viewChangedDetails.visibleDates.length ~/ 2])
                          .toString();
                      SchedulerBinding.instance
                          .addPostFrameCallback((duration) {
                        setState(() {});
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // backgroundColor: hexToColor('#DFDFDF'),
    );
  }

  Widget monthCellBuilder(BuildContext context, MonthCellDetails details) {
    if (details.date.day == 1 && !monthChk) {
      monthChk = true;
    } else if (details.date.day == 1 && monthChk) {
      monthChk = false;
    }

    if (details.date.day == DateTime.now().day &&
        details.date.month == DateTime.now().month) {
      return Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(top: 3),
        decoration: const BoxDecoration(
            border: Border(
          top: BorderSide(color: Colors.black12, width: 1),
        )),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(
                color: Colors.black,
                width: 5,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              details.date.day.toString(),
              style: const TextStyle(color: Colors.white),
            )),
      );
    }
    if (monthChk) {
      return Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(top: 7.5),
        decoration: const BoxDecoration(
            border: Border(
          top: BorderSide(color: Colors.black12, width: 1),
        )),
        child: Text(
          details.date.day.toString(),
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
      );
    } else {
      return Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(top: 7.5),
        decoration: const BoxDecoration(
            border: Border(
          top: BorderSide(color: Colors.black12, width: 1),
        )),
        child: Text(
          details.date.day.toString(),
          style: const TextStyle(fontSize: 16, color: Colors.black45),
        ),
      );
    }
  }

  void selectionTap(CalendarTapDetails details) {
    _text = DateFormat('dd MMMM yyyy').format(details.date!).toString();
    if (details.appointments != null && details.appointments!.isNotEmpty) {
      details.appointments?.forEach((appointment) {
        final Appointment meeting = appointment as Appointment; // แปลงเป็น Meeting object

        // ปริ้นข้อมูลภายใน Meeting object
        print('Meeting Title: ${meeting.subject}');
        print('All: ${meeting.isAllDay}');
        print('from: ${meeting.startTime}');
        print('to: ${meeting.endTime}');
      });
    } else {
      print('No Appointments');
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.95,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 30),
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.black45,
                    height: 2,
                    width: MediaQuery.of(context).size.width / 5,
                  ),
                ),
              ],
            ),
            // Show Date
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    _text,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            // Appointment
            Expanded(
              child: details.appointments != null &&
                      details.appointments!.isNotEmpty
                  ? ListView(
                      children: details.appointments!.map((appointment) {
                        final Appointment meeting = appointment as Appointment;
                        var form = DateFormat('dd').format(meeting.startTime);
                        var to = DateFormat('dd').format(meeting.endTime);
                        var select = DateFormat('dd').format(details.date!);

                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: InkWell(
                            onTap: () {
                              print('111111111');
                            },
                            child: Row(
                              children: [
                                if (!meeting.isAllDay)
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Text(
                                          DateFormat('hh:mm a')
                                              .format(meeting.startTime),
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      if (form != to && select == to)
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Text(
                                            DateFormat('hh:mm a')
                                                .format(meeting.endTime),
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black45,
                                            ),
                                          ),
                                        )
                                      else if (form != to && select != to)
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Text(
                                            '12:00 AM',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black45,
                                            ),
                                          ),
                                        )
                                      else
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Text(
                                            DateFormat('hh:mm a')
                                                .format(meeting.endTime),
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black45,
                                            ),
                                          ),
                                        ),
                                    ],
                                  )
                                else // กรณีเป็น All Day
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 30, right: 10),
                                    child: Text(
                                      'All Day',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                Container(
                                  color: meeting.color,
                                  height: 40,
                                  width: 2,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Text(
                                    meeting.subject,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    )
                  : const Center(
                      child: Text(
                        'No Appointments Available',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
            ),
          ],
        ),
      ),
    ).whenComplete(() {});
  }
}