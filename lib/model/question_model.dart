class Question {
  final String text;
  final bool isClickable;
  final List<String>? followUpQuestions;
  final bool isAssistant;
  final String? response;

  Question({
    required this.text,
    this.isClickable = false,
    this.isAssistant = true,
    this.followUpQuestions,
    this.response,
  });
}
