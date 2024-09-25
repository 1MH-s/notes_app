class NoteModel {
  const NoteModel({
    required this.title,
    required this.content,
    required this.date,
    required this.color,
  });
  final String title;
  final String content;
  final DateTime date;
  final int color;
}
