class NotificationModel{
  final String eventName;
  final String start;
  final String end;

  const NotificationModel({
    required this.eventName,
    required this.start,
    required this.end,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      eventName: json["eventName"],
      start: json["start"],
      end: json["end"]??"",
    );
  }
//
}