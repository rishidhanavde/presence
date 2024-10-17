import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WorkCalendar extends StatefulWidget {
  const WorkCalendar({super.key});

  @override
  State<WorkCalendar> createState() => _WorkCalendarState();
}

class _WorkCalendarState extends State<WorkCalendar> {
  int todaysDate = DateTime.now().day;
  DateTime today = DateTime.now();
  DateTime focusedDay = DateTime.now();
  final Set<DateTime> _holidays = {};
  final Set<DateTime> _sundays = {};

  @override
  void initState() {
    super.initState();
    _fetchHolidaysForNextYears(
        3); // Fetch holidays for current year + next 3 years
  }

  // Fetch holidays for the current year and the next N years
  Future<void> _fetchHolidaysForNextYears(int numYears) async {
    const String apiKey =
        '8u9R2M1Zvj44htlRYSG8axbc7jVIkt1b'; // API key for calendarific.com
    const String country = 'IN'; // Country code for India
    int currentYear = DateTime.now().year; // Get the current year

    for (int year = currentYear; year <= currentYear + numYears; year++) {
      final String url =
          'https://calendarific.com/api/v2/holidays?api_key=$apiKey&country=$country&year=$year';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List holidays = data['response']['holidays'];

        setState(() {
          // Add holidays for the current year to the _holidays set
          _holidays.addAll(holidays.map((holiday) {
            final dateString = holiday['date']['iso'];
            final date = DateTime.parse(dateString);
            return DateTime(date.year, date.month, date.day);
          }));
        });

        // Step 3: Add Sundays for this year
        _addSundays(year);
      } else {
        throw Exception('Failed to load holidays for year $year');
      }
    }
  }

  // Step 3: Add all Sundays of a given year to the _sundays set
  void _addSundays(int year) {
    DateTime firstDayOfYear = DateTime(year, 1, 1);
    DateTime lastDayOfYear = DateTime(year, 12, 31);

    // Find the first Sunday of the year
    DateTime firstSunday =
        firstDayOfYear.add(Duration(days: (7 - firstDayOfYear.weekday) % 7));

    // Loop through the year, adding every Sunday
    for (DateTime day = firstSunday;
        day.isBefore(lastDayOfYear) || isSameDay(day, lastDayOfYear);
        day = day.add(const Duration(days: 7))) {
      setState(() {
        _sundays.add(day);
        _holidays.add(day); // Add Sundays to holidays
      });
    }
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
      this.focusedDay = focusedDay;
    });
  }

  bool get _isCurrentMonth {
    return focusedDay.year == today.year && focusedDay.month == today.month;
  }

  bool _isSunday(DateTime day) {
    return _sundays.contains(DateTime(day.year, day.month, day.day));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Indian Holidays Calendar'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: today,
            firstDay: DateTime.utc(2022),
            lastDay: DateTime.utc(2099),
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            availableGestures: AvailableGestures.all,
            selectedDayPredicate: (day) => isSameDay(day, today),
            onDaySelected: _onDaySelected,

            // Highlight holidays and Sundays
            holidayPredicate: (day) {
              return _holidays.contains(DateTime(day.year, day.month, day.day));
            },

            // Custom Calendar Styling
            calendarStyle: const CalendarStyle(
              holidayTextStyle: TextStyle(
                color: Colors.red, // Red font for holidays and Sundays
              ),
              todayDecoration: BoxDecoration(
                color: Color.fromARGB(255, 120, 185, 238),
                shape: BoxShape.circle,
              ),
              selectedDecoration:
                  BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
              holidayDecoration: BoxDecoration(
                color: Colors.transparent, // No background
                shape: BoxShape.circle,
              ),
              defaultTextStyle: TextStyle(
                color: Colors.black, // Default text color
              ),
              outsideTextStyle: TextStyle(
                color: Colors.grey, // Default text color for outside days
              ),
            ),

            // Add underline only to holidays that are not Sundays
            calendarBuilders: CalendarBuilders(
              holidayBuilder: (context, day, focusedDay) {
                final isSunday = _isSunday(day);
                final isSameMonth = day.month == focusedDay.month &&
                    day.year == focusedDay.year;

                return Center(
                  child: Text(
                    day.day.toString(),
                    style: TextStyle(
                        color: isSameMonth ? Colors.red : Colors.grey,
                        decoration: isSameMonth
                            ? (isSunday
                                ? TextDecoration.none
                                : TextDecoration.underline)
                            : TextDecoration.none,
                        decorationColor:
                            Colors.red, // Change underline color to red
                        decorationStyle: TextDecorationStyle.double),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
              onPressed: () {
                setState(() {
                  focusedDay = DateTime.now();
                  today = DateTime.now();
                });
              },
              backgroundColor: Colors.blue,
              
              child: Text('$todaysDate', style: TextStyle(fontSize: 20, color: Colors.white),)
            ),
    );
  }
}
