class EventItem {
  final String id;
  final String title;
  final String dateDay;
  final String dateMonth;
  final String time;
  final String location;
  final String imageUrl;
  final String organizer;
  final String description;

  const EventItem({
    required this.id,
    required this.title,
    required this.dateDay,
    required this.dateMonth,
    required this.time,
    required this.location,
    required this.imageUrl,
    required this.organizer,
    required this.description,
  });
}
