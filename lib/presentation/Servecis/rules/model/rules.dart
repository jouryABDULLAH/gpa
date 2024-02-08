class Rule {
  final String title;
  final String description;
  final String steps;
  bool isExpanded;

  Rule({
    required this.title,
    required this.description,
    required this.steps,
    this.isExpanded = false,
  });

  static List<Rule> fetchAll() {
    return [
      Rule(title: 'title1', description: 'description1', steps: 'steps1'),
      Rule(title: 'title1', description: 'description1', steps: 'steps1'),
      Rule(title: 'title1', description: 'description1', steps: 'steps1'),
      Rule(title: 'title1', description: 'description1', steps: 'steps1'),
      Rule(title: 'title1', description: 'description1', steps: 'steps1'),
      Rule(title: 'title1', description: 'description1', steps: 'steps1'),
      Rule(title: 'title1', description: 'description1', steps: 'steps1'),
    ];
  }
}
