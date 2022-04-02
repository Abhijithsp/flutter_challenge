import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_week/flutter_calendar_week.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/text_styles.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: color_dark,
        resizeToAvoidBottomInset: true,
        appBar: PreferredSize(
          preferredSize: const Size(120, 80),
          child: SafeArea(
            child: Container(
              height: 50,
              color: color_dark,
              child: Customappbar(),
            ),
          ),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 55.0,
              backgroundColor: color_dark,
              pinned: true,
              floating: false,
              snap: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0.5, horizontal: 5),
                          child: Text(
                            "Hello User",
                            style: mediumText,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 1, horizontal: 5),
                          child: Text(
                            "lets explore whats happening near you",
                            style: normalText,
                          ),
                        ),
                      ],
                    ),
                    const CircleAvatar(
                      backgroundImage:
                          NetworkImage("https://picsum.photos/200/300"),
                      radius: 35,
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                // return TableCalendar(
                //   firstDay: DateTime.utc(2010, 10, 16),
                //   lastDay: DateTime.utc(2030, 3, 14),
                //   focusedDay: _focusedDay,
                //   calendarFormat: _calendarFormat,
                //   selectedDayPredicate: (day) {
                //     return isSameDay(_selectedDay, day);
                //   },
                //   onDaySelected: (selectedDay, focusedDay) {
                //     if (!isSameDay(_selectedDay, selectedDay)) {
                //       // Call `setState()` when updating the selected day
                //       setState(() {
                //         _selectedDay = selectedDay;
                //         _focusedDay = focusedDay;
                //       });
                //     }
                //   },
                //   onFormatChanged: (format) {
                //     if (_calendarFormat != format) {
                //       // Call `setState()` when updating calendar format
                //       setState(() {
                //         _calendarFormat = format;
                //       });
                //     }
                //   },
                //   onPageChanged: (focusedDay) {
                //     // No need to call `setState()` here
                //     _focusedDay = focusedDay;
                //   },
                // );
                return CalendarWeek(
                  controller: CalendarWeekController(),
                  height: 100,
                  backgroundColor: color_dark,
                  dateBackgroundColor: color_dark,
                  todayBackgroundColor: color_dark,
                  dateStyle: mediumText,
                  showMonth: true,
                  minDate: DateTime.now().add(
                    const Duration(days: -365),
                  ),
                  maxDate: DateTime.now().add(
                    const Duration(days: 365),
                  ),
                  onDatePressed: (DateTime datetime) {
                    // Do something
                  },
                  onDateLongPressed: (DateTime datetime) {
                    // Do something
                  },
                  onWeekChanged: () {
                    // Do something
                  },
                  monthViewBuilder: (DateTime time) => Align(
                    alignment: FractionalOffset.center,
                    child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          DateFormat.yMMMM().format(time),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w600),
                        )),
                  ),
                  decorations: [
                    DecorationItem(
                        decorationAlignment: FractionalOffset.bottomRight,
                        date: DateTime.now(),
                        decoration: const Icon(
                          Icons.today,
                          color: Colors.blue,
                        )),
                  ],
                );
              }, childCount: 1),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              sliver: SliverToBoxAdapter(
                child: SizedBox(
                  height: 140.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          flex: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "All Events",
                              style: mediumText,
                            ),
                          )),
                      Expanded(
                        flex: 1,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              color: color_lightdark,
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: color_lightdark,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                width: 120.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(
                                      Icons.event,
                                      color: color_white,
                                      size: 20,
                                    ),
                                    Text(
                                      'Event $index',
                                      style: mediumText,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Card(
                    margin: EdgeInsets.all(8),
                    elevation: 10,
                    color: color_lightdark,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      height: 110,
                      decoration: const BoxDecoration(
                          color: color_lightdark,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                  flex: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 5),
                                    child: Text(
                                      "Dummy heading $index",
                                      style: normalText,
                                    ),
                                  )),
                              Expanded(
                                  flex: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 5),
                                    child: Text(
                                      "27/11/2022 $index",
                                      style: normalText,
                                    ),
                                  )),
                              Expanded(
                                  flex: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 5),
                                    child: SizedBox(
                                        width: 200,
                                        child: Text(
                                          "⛿" +
                                              " " +
                                              "place Creamfields,sector 47,Usa",
                                          maxLines: 2,
                                          softWrap: true,
                                          style: normalTextOverflow,
                                        )),
                                  )),
                            ],
                          ),
                          SizedBox(
                            width: 110,
                            height: 110.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: CachedNetworkImage(
                                fit: BoxFit.fill,
                                imageUrl: "https://picsum.photos/200/300",
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                childCount: 50,
              ),
            ),
          ],
        ));
  }

  Widget Customappbar() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/icons/logo@2x.png',
                width: 35,
                height: 35,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                    text: 'UVE',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: color_white),
                    children: [
                      TextSpan(
                        text: 'NTO',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: color_gold,
                            fontSize: 25),
                      ),
                    ]),
              ),
            ],
          ),
          Row(
            children: const [
              Icon(
                Icons.notifications_outlined,
                size: 28,
                color: color_white,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.grid_view_outlined, size: 28, color: color_white),
            ],
          ),
        ],
      ),
    );
  }
}
