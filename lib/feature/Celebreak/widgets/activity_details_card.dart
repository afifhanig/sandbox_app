import 'package:flutter/material.dart';
import 'package:sandbox_flutter_3/feature/Celebreak/data/event_data.dart';
import 'package:sandbox_flutter_3/feature/Celebreak/widgets/event_card_widget.dart';

class ActivityDetailsCard extends StatelessWidget {
  const ActivityDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final eventDetails = EventDetails();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        activitiesPerDayTitleWidget(),
        SizedBox(height: 10),
        EventCardWidget(
          time: eventDetails.eventDatas[1].time,
          duration: eventDetails.eventDatas[1].duration,
          title: eventDetails.eventDatas[1].title,
          location: eventDetails.eventDatas[1].location,
          availableSpots: eventDetails.eventDatas[1].availableSpots,
          price: eventDetails.eventDatas[1].price,
        ),
        EventCardWidget(
          time: eventDetails.eventDatas[2].time,
          duration: eventDetails.eventDatas[2].duration,
          title: eventDetails.eventDatas[2].title,
          location: eventDetails.eventDatas[2].location,
          availableSpots: eventDetails.eventDatas[2].availableSpots,
          price: eventDetails.eventDatas[2].price,
        ),
      ],
    );
  }

  activitiesPerDayTitleWidget() {
    return RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: "Today ",
            style: TextStyle(
              color: Colors.black, // Black color for "Today"
              fontSize: 16, // Adjust font size as needed
              fontWeight: FontWeight.bold, // Optional: Make it bold
            ),
          ),
          TextSpan(
            text: "/ ",
            style: TextStyle(
              color: Colors.grey, // Grey color for "/"
              fontSize: 16,
            ),
          ),
          TextSpan(
            text: "tuesday",
            style: TextStyle(
              color: Colors.grey, // Grey color for "tuesday"
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
