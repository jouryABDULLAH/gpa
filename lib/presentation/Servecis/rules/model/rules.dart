class Rule {
  final String title;
  final String description;
  final String videoLink;

  Rule({
    required this.title,
    required this.description,
    required this.videoLink,
  });

  @override
  String toString() {
    return "$title $description $videoLink";
  }
}
