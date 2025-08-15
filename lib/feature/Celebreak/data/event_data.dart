import 'package:sandbox_flutter_3/feature/Celebreak/model/event_model.dart';

class EventDetails {
  List<EventModel> eventDatas = [
    EventModel(
      time: DateTime.now(), // Today's date and current time
      title: "Morning Yoga",
      location: "Community Hall A",
      availableSpots: 20,
      price: 15.00,
      duration: "60 min",
    ),
    EventModel(
      time: DateTime.now().add(Duration(hours: 3)), // Today, 3 hours later
      title: "Team Meeting",
      location: "Tech Hub",
      availableSpots: 12,
      price: 0.00, // Free event
      duration: "60 min",
    ),
    EventModel(
      time: DateTime.now().add(Duration(hours: 6)), // Today, 6 hours later
      title: "Cooking Demo",
      location: "Downtown Kitchen Studio",
      availableSpots: 8,
      price: 40.00,
      duration: "60 min",
    ),
    EventModel(
      time: DateTime.now().add(Duration(hours: 9)), // Today, 9 hours later
      title: "Evening Jazz Night",
      location: "The Velvet Lounge",
      availableSpots: 50,
      price: 25.00,
      duration: "60 min",
    ),
  ];
}
