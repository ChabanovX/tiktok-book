import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rsvp_flutter_app/rspv_engine/rsvp_token_model.dart';

part 'book_model.freezed.dart';

@freezed
abstract class BookModel with _$BookModel {
  const factory BookModel({
    required String name,

    @Default([])
    List<RsvpToken> tokens,
  }) = _BookModel;
}
