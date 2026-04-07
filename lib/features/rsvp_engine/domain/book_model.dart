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
}
