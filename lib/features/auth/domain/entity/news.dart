import 'package:equatable/equatable.dart';

class News extends Equatable {
  final int id;
  final String title;
  final String? summary;
  final String? link;
  const News({
    required this.id,
    required this.title,
    required this.link,
    required this.summary,
  });

  @override
  List<Object?> get props => [id, title, link, summary];
}
