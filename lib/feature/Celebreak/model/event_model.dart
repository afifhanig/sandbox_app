class EventModel {
  final DateTime time; // DateTime for Time & Duration
  final String title; // Title of the event
  final String location; // Location of the event
  final int availableSpots; // Number of available spots
  final double price; // Price of the event
  final String duration;

  EventModel({
    required this.time,
    required this.title,
    required this.location,
    required this.availableSpots,
    required this.price,
    required this.duration, //
  });

  // Factory constructor for creating an EventModel from JSON
  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      time: DateTime.parse(json['time']),
      title: json['title'],
      location: json['location'],
      availableSpots: json['availableSpots'],
      price: json['price'].toDouble(),
      duration: json['duration'],
    );
  }

  // Convert EventModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'time': time.toIso8601String(),
      'title': title,
      'location': location,
      'availableSpots': availableSpots,
      'price': price,
      'duration': duration,
    };
  }
}
