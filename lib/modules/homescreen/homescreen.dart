import 'package:flutter/material.dart';
import 'package:flutter_calendar_week/flutter_calendar_week.dart';
import 'package:intl/intl.dart';

import '../../utils/common_widgets/event_card.dart';
import '../../utils/common_widgets/event_list_item.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CalendarWeekController _calendarWeekController = CalendarWeekController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_dark,
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: SafeArea(
          child: Container(
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.center,
            color: color_dark,
            child: _buildCustomAppBar(),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          // Header section
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello User 👋",
                        style: largeText.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Let's explore what's happening near you",
                        style: normalText.copyWith(
                          fontSize: 13,
                          color: Colors.white70,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: color_gold.withOpacity(0.4), width: 1.5),
                      boxShadow: [
                        BoxShadow(
                          color: color_gold.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      backgroundImage: NetworkImage("https://picsum.photos/200/300"),
                      radius: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Calendar section
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.02),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white.withOpacity(0.04), width: 1),
              ),
              child: CalendarWeek(
                controller: _calendarWeekController,
                height: 115,
                backgroundColor: Colors.transparent,
                dateBackgroundColor: Colors.transparent,
                todayBackgroundColor: color_gold.withOpacity(0.2),
                dateStyle: normalText.copyWith(fontWeight: FontWeight.w500),
                dayOfWeekStyle: normalText.copyWith(color: Colors.white54, fontSize: 12),
                weekendsStyle: normalText.copyWith(color: Colors.white38, fontSize: 12),
                todayDateStyle: normalText.copyWith(color: color_gold, fontWeight: FontWeight.bold),
                pressedDateBackgroundColor: color_gold,
                pressedDateStyle: normalText.copyWith(color: color_dark, fontWeight: FontWeight.bold),
                showMonth: true,
                minDate: DateTime.now().add(const Duration(days: -365)),
                maxDate: DateTime.now().add(const Duration(days: 365)),
                monthViewBuilder: (DateTime time) => Align(
                  alignment: FractionalOffset.center,
                  child: Container(
                    margin: const EdgeInsets.only(top: 8, bottom: 4),
                    child: Text(
                      DateFormat.yMMMM().format(time),
                      style: const TextStyle(
                        color: color_gold,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
                onDatePressed: (DateTime datetime) {
                  setState(() {});
                },
                onWeekChanged: () {},
              ),
            ),
          ),

          // All Events Title
          SliverPadding(
            padding: const EdgeInsets.only(left: 16, top: 16, bottom: 8),
            sliver: SliverToBoxAdapter(
              child: Text(
                "Featured Events",
                style: mediumText.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),

          // All Events Cards Horizontal List
          SliverToBoxAdapter(
            child: SizedBox(
              height: 135.0,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: EventCard(
                      title: 'Tech Summit $index',
                      icon: index % 2 == 0 ? Icons.rocket_launch : Icons.event,
                      onTap: () {},
                    ),
                  );
                },
              ),
            ),
          ),

          // Events Near You Title
          SliverPadding(
            padding: const EdgeInsets.only(left: 16, top: 24, bottom: 8),
            sliver: SliverToBoxAdapter(
              child: Text(
                "Events Near You",
                style: mediumText.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),

          // Events Vertical List
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return EventListItem(
                  title: "Summer Music Festival $index",
                  date: "27/11/2026",
                  location: "Creamfields, Sector 47, USA",
                  imageUrl: "https://picsum.photos/id/${(index + 10) * 3}/200/300",
                  onTap: () {},
                );
              },
              childCount: 15,
            ),
          ),
          
          // Extra space at bottom to prevent nav bar occlusion
          const SliverToBoxAdapter(
            child: SizedBox(height: 100),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              'assets/icons/logo@2x.png',
              width: 32,
              height: 32,
            ),
            const SizedBox(width: 8),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                text: 'UVE',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: color_white,
                  letterSpacing: 0.5,
                ),
                children: [
                  TextSpan(
                    text: 'NTO',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: color_gold,
                      fontSize: 22,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.notifications_outlined, size: 24, color: color_white),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.grid_view_outlined, size: 24, color: color_white),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
