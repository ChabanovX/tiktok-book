// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rsvp_bionic_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RsvpBionicToken {

 String get boldText; String get semiboldText; String get regularText; int get index;
/// Create a copy of RsvpBionicToken
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RsvpBionicTokenCopyWith<RsvpBionicToken> get copyWith => _$RsvpBionicTokenCopyWithImpl<RsvpBionicToken>(this as RsvpBionicToken, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RsvpBionicToken&&(identical(other.boldText, boldText) || other.boldText == boldText)&&(identical(other.semiboldText, semiboldText) || other.semiboldText == semiboldText)&&(identical(other.regularText, regularText) || other.regularText == regularText)&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,boldText,semiboldText,regularText,index);

@override
String toString() {
  return 'RsvpBionicToken(boldText: $boldText, semiboldText: $semiboldText, regularText: $regularText, index: $index)';
}


}

/// @nodoc
abstract mixin class $RsvpBionicTokenCopyWith<$Res>  {
  factory $RsvpBionicTokenCopyWith(RsvpBionicToken value, $Res Function(RsvpBionicToken) _then) = _$RsvpBionicTokenCopyWithImpl;
@useResult
$Res call({
 String boldText, String semiboldText, String regularText, int index
});




}
/// @nodoc
class _$RsvpBionicTokenCopyWithImpl<$Res>
    implements $RsvpBionicTokenCopyWith<$Res> {
  _$RsvpBionicTokenCopyWithImpl(this._self, this._then);

  final RsvpBionicToken _self;
  final $Res Function(RsvpBionicToken) _then;

/// Create a copy of RsvpBionicToken
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? boldText = null,Object? semiboldText = null,Object? regularText = null,Object? index = null,}) {
  return _then(_self.copyWith(
boldText: null == boldText ? _self.boldText : boldText // ignore: cast_nullable_to_non_nullable
as String,semiboldText: null == semiboldText ? _self.semiboldText : semiboldText // ignore: cast_nullable_to_non_nullable
as String,regularText: null == regularText ? _self.regularText : regularText // ignore: cast_nullable_to_non_nullable
as String,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RsvpBionicToken].
extension RsvpBionicTokenPatterns on RsvpBionicToken {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RsvpBionicToken value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RsvpBionicToken() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RsvpBionicToken value)  $default,){
final _that = this;
switch (_that) {
case _RsvpBionicToken():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RsvpBionicToken value)?  $default,){
final _that = this;
switch (_that) {
case _RsvpBionicToken() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String boldText,  String semiboldText,  String regularText,  int index)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RsvpBionicToken() when $default != null:
return $default(_that.boldText,_that.semiboldText,_that.regularText,_that.index);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String boldText,  String semiboldText,  String regularText,  int index)  $default,) {final _that = this;
switch (_that) {
case _RsvpBionicToken():
return $default(_that.boldText,_that.semiboldText,_that.regularText,_that.index);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String boldText,  String semiboldText,  String regularText,  int index)?  $default,) {final _that = this;
switch (_that) {
case _RsvpBionicToken() when $default != null:
return $default(_that.boldText,_that.semiboldText,_that.regularText,_that.index);case _:
  return null;

}
}

}

/// @nodoc


class _RsvpBionicToken implements RsvpBionicToken {
  const _RsvpBionicToken({required this.boldText, required this.semiboldText, required this.regularText, required this.index});
  

@override final  String boldText;
@override final  String semiboldText;
@override final  String regularText;
@override final  int index;

/// Create a copy of RsvpBionicToken
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RsvpBionicTokenCopyWith<_RsvpBionicToken> get copyWith => __$RsvpBionicTokenCopyWithImpl<_RsvpBionicToken>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RsvpBionicToken&&(identical(other.boldText, boldText) || other.boldText == boldText)&&(identical(other.semiboldText, semiboldText) || other.semiboldText == semiboldText)&&(identical(other.regularText, regularText) || other.regularText == regularText)&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,boldText,semiboldText,regularText,index);

@override
String toString() {
  return 'RsvpBionicToken(boldText: $boldText, semiboldText: $semiboldText, regularText: $regularText, index: $index)';
}


}

/// @nodoc
abstract mixin class _$RsvpBionicTokenCopyWith<$Res> implements $RsvpBionicTokenCopyWith<$Res> {
  factory _$RsvpBionicTokenCopyWith(_RsvpBionicToken value, $Res Function(_RsvpBionicToken) _then) = __$RsvpBionicTokenCopyWithImpl;
@override @useResult
$Res call({
 String boldText, String semiboldText, String regularText, int index
});




}
/// @nodoc
class __$RsvpBionicTokenCopyWithImpl<$Res>
    implements _$RsvpBionicTokenCopyWith<$Res> {
  __$RsvpBionicTokenCopyWithImpl(this._self, this._then);

  final _RsvpBionicToken _self;
  final $Res Function(_RsvpBionicToken) _then;

/// Create a copy of RsvpBionicToken
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? boldText = null,Object? semiboldText = null,Object? regularText = null,Object? index = null,}) {
  return _then(_RsvpBionicToken(
boldText: null == boldText ? _self.boldText : boldText // ignore: cast_nullable_to_non_nullable
as String,semiboldText: null == semiboldText ? _self.semiboldText : semiboldText // ignore: cast_nullable_to_non_nullable
as String,regularText: null == regularText ? _self.regularText : regularText // ignore: cast_nullable_to_non_nullable
as String,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
