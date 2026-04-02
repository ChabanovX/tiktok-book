// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookMetaModel {

 BookFile get bookFile; String? get name; List<RsvpToken> get tokens;
/// Create a copy of BookMetaModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookMetaModelCopyWith<BookMetaModel> get copyWith => _$BookMetaModelCopyWithImpl<BookMetaModel>(this as BookMetaModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookMetaModel&&(identical(other.bookFile, bookFile) || other.bookFile == bookFile)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.tokens, tokens));
}


@override
int get hashCode => Object.hash(runtimeType,bookFile,name,const DeepCollectionEquality().hash(tokens));

@override
String toString() {
  return 'BookMetaModel(bookFile: $bookFile, name: $name, tokens: $tokens)';
}


}

/// @nodoc
abstract mixin class $BookMetaModelCopyWith<$Res>  {
  factory $BookMetaModelCopyWith(BookMetaModel value, $Res Function(BookMetaModel) _then) = _$BookMetaModelCopyWithImpl;
@useResult
$Res call({
 BookFile bookFile, String? name, List<RsvpToken> tokens
});




}
/// @nodoc
class _$BookMetaModelCopyWithImpl<$Res>
    implements $BookMetaModelCopyWith<$Res> {
  _$BookMetaModelCopyWithImpl(this._self, this._then);

  final BookMetaModel _self;
  final $Res Function(BookMetaModel) _then;

/// Create a copy of BookMetaModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bookFile = null,Object? name = freezed,Object? tokens = null,}) {
  return _then(_self.copyWith(
bookFile: null == bookFile ? _self.bookFile : bookFile // ignore: cast_nullable_to_non_nullable
as BookFile,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,tokens: null == tokens ? _self.tokens : tokens // ignore: cast_nullable_to_non_nullable
as List<RsvpToken>,
  ));
}

}


/// Adds pattern-matching-related methods to [BookMetaModel].
extension BookMetaModelPatterns on BookMetaModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookMetaModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookMetaModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookMetaModel value)  $default,){
final _that = this;
switch (_that) {
case _BookMetaModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookMetaModel value)?  $default,){
final _that = this;
switch (_that) {
case _BookMetaModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BookFile bookFile,  String? name,  List<RsvpToken> tokens)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookMetaModel() when $default != null:
return $default(_that.bookFile,_that.name,_that.tokens);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BookFile bookFile,  String? name,  List<RsvpToken> tokens)  $default,) {final _that = this;
switch (_that) {
case _BookMetaModel():
return $default(_that.bookFile,_that.name,_that.tokens);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BookFile bookFile,  String? name,  List<RsvpToken> tokens)?  $default,) {final _that = this;
switch (_that) {
case _BookMetaModel() when $default != null:
return $default(_that.bookFile,_that.name,_that.tokens);case _:
  return null;

}
}

}

/// @nodoc


class _BookMetaModel implements BookMetaModel {
  const _BookMetaModel({required this.bookFile, this.name, final  List<RsvpToken> tokens = const []}): _tokens = tokens;
  

@override final  BookFile bookFile;
@override final  String? name;
 final  List<RsvpToken> _tokens;
@override@JsonKey() List<RsvpToken> get tokens {
  if (_tokens is EqualUnmodifiableListView) return _tokens;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tokens);
}


/// Create a copy of BookMetaModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookMetaModelCopyWith<_BookMetaModel> get copyWith => __$BookMetaModelCopyWithImpl<_BookMetaModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookMetaModel&&(identical(other.bookFile, bookFile) || other.bookFile == bookFile)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._tokens, _tokens));
}


@override
int get hashCode => Object.hash(runtimeType,bookFile,name,const DeepCollectionEquality().hash(_tokens));

@override
String toString() {
  return 'BookMetaModel(bookFile: $bookFile, name: $name, tokens: $tokens)';
}


}

/// @nodoc
abstract mixin class _$BookMetaModelCopyWith<$Res> implements $BookMetaModelCopyWith<$Res> {
  factory _$BookMetaModelCopyWith(_BookMetaModel value, $Res Function(_BookMetaModel) _then) = __$BookMetaModelCopyWithImpl;
@override @useResult
$Res call({
 BookFile bookFile, String? name, List<RsvpToken> tokens
});




}
/// @nodoc
class __$BookMetaModelCopyWithImpl<$Res>
    implements _$BookMetaModelCopyWith<$Res> {
  __$BookMetaModelCopyWithImpl(this._self, this._then);

  final _BookMetaModel _self;
  final $Res Function(_BookMetaModel) _then;

/// Create a copy of BookMetaModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bookFile = null,Object? name = freezed,Object? tokens = null,}) {
  return _then(_BookMetaModel(
bookFile: null == bookFile ? _self.bookFile : bookFile // ignore: cast_nullable_to_non_nullable
as BookFile,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,tokens: null == tokens ? _self._tokens : tokens // ignore: cast_nullable_to_non_nullable
as List<RsvpToken>,
  ));
}


}

// dart format on
