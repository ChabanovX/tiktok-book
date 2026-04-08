import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rsvp_flutter_app/features/file_picking/domain/entities/book_file.dart';
import 'package:rsvp_flutter_app/features/rsvp_engine/domain/rsvp_token_model.dart';

part 'book_model.freezed.dart';

@freezed
abstract class BookMetaModel with _$BookMetaModel {
  const factory BookMetaModel({
    required BookFile bookFile,
    required String documentId,

    String? name,
    String? author,

    @Default(0) int currentIndex,

    @Default([]) List<RsvpToken> tokens,
  }) = _BookMetaModel;
}

extension BookMetaModelX on BookMetaModel {
  String resolveTitle() {
    final name = this.name?.trim();
    if (name != null && name.isNotEmpty) {
      return name;
    }

    return bookFile.name;
  }

  String? resolveAuthor() {
    final author = this.author?.trim();
    if (author == null || author.isEmpty) {
      return null;
    }

    return author;
  }

  bool isFinished() => currentIndex == tokens.length - 1;

  double resolveProgress() {
    if (tokens.isEmpty || currentIndex <= 0) {
      return 0.0;
    }

    final progress = (currentIndex + 1) / tokens.length;
    if (progress <= 0) return 0.0;
    if (progress >= 1) return 1.0;
    return progress;
  }
}
