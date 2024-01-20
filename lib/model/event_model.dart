// ignore_for_file: public_member_api_docs, sort_constructors_first

class EventModel {
  String? name;
  String? begin;
  String? end;
  int? color;

  EventModel({
    this.name,
    this.begin,
    this.end,
    this.color,
  });

  factory EventModel.fromJson(
      Map<String, dynamic> json, String uId, String stringAsFixed) {
    return EventModel(
      name: json["name"],
      end: json["end"],
      color: json["color"],
      begin: json["begin"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'end': end,
      'color': color,
      'begin': begin,
    };
  }
//
}
