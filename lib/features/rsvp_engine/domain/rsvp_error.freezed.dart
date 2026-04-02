// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rsvp_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RSVPError {

 Object? get error; StackTrace? get st;
/// Create a copy of RSVPError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RSVPErrorCopyWith<RSVPError> get copyWith => _$RSVPErrorCopyWithImpl<RSVPError>(this as RSVPError, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RSVPError&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.st, st) || other.st == st));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error),st);

@override
String toString() {
  return 'RSVPError(error: $error, st: $st)';
}


}

/// @nodoc
abstract mixin class $RSVPErrorCopyWith<$Res>  {
  factory $RSVPErrorCopyWith(RSVPError value, $Res Function(RSVPError) _then) = _$RSVPErrorCopyWithImpl;
@useResult
$Res call({
 Object? error, StackTrace? st
});




}
/// @nodoc
class _$RSVPErrorCopyWithImpl<$Res>
    implements $RSVPErrorCopyWith<$Res> {
  _$RSVPErrorCopyWithImpl(this._self, this._then);

  final RSVPError _self;
  final $Res Function(RSVPError) _then;

/// Create a copy of RSVPError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? error = freezed,Object? st = freezed,}) {
  return _then(_self.copyWith(
error: freezed == error ? _self.error : error ,st: freezed == st ? _self.st : st // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}

}


/// Adds pattern-matching-related methods to [RSVPError].
extension RSVPErrorPatterns on RSVPError {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _PickingError value)?  pickingError,TResult Function( _ParsingError value)?  parsingError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PickingError() when pickingError != null:
return pickingError(_that);case _ParsingError() when parsingError != null:
return parsingError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _PickingError value)  pickingError,required TResult Function( _ParsingError value)  parsingError,}){
final _that = this;
switch (_that) {
case _PickingError():
return pickingError(_that);case _ParsingError():
return parsingError(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _PickingError value)?  pickingError,TResult? Function( _ParsingError value)?  parsingError,}){
final _that = this;
switch (_that) {
case _PickingError() when pickingError != null:
return pickingError(_that);case _ParsingError() when parsingError != null:
return parsingError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Object? error,  StackTrace? st)?  pickingError,TResult Function( Object? error,  StackTrace? st)?  parsingError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PickingError() when pickingError != null:
return pickingError(_that.error,_that.st);case _ParsingError() when parsingError != null:
return parsingError(_that.error,_that.st);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Object? error,  StackTrace? st)  pickingError,required TResult Function( Object? error,  StackTrace? st)  parsingError,}) {final _that = this;
switch (_that) {
case _PickingError():
return pickingError(_that.error,_that.st);case _ParsingError():
return parsingError(_that.error,_that.st);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Object? error,  StackTrace? st)?  pickingError,TResult? Function( Object? error,  StackTrace? st)?  parsingError,}) {final _that = this;
switch (_that) {
case _PickingError() when pickingError != null:
return pickingError(_that.error,_that.st);case _ParsingError() when parsingError != null:
return parsingError(_that.error,_that.st);case _:
  return null;

}
}

}

/// @nodoc


class _PickingError implements RSVPError {
  const _PickingError({this.error, this.st});
  

@override final  Object? error;
@override final  StackTrace? st;

/// Create a copy of RSVPError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PickingErrorCopyWith<_PickingError> get copyWith => __$PickingErrorCopyWithImpl<_PickingError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PickingError&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.st, st) || other.st == st));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error),st);

@override
String toString() {
  return 'RSVPError.pickingError(error: $error, st: $st)';
}


}

/// @nodoc
abstract mixin class _$PickingErrorCopyWith<$Res> implements $RSVPErrorCopyWith<$Res> {
  factory _$PickingErrorCopyWith(_PickingError value, $Res Function(_PickingError) _then) = __$PickingErrorCopyWithImpl;
@override @useResult
$Res call({
 Object? error, StackTrace? st
});




}
/// @nodoc
class __$PickingErrorCopyWithImpl<$Res>
    implements _$PickingErrorCopyWith<$Res> {
  __$PickingErrorCopyWithImpl(this._self, this._then);

  final _PickingError _self;
  final $Res Function(_PickingError) _then;

/// Create a copy of RSVPError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = freezed,Object? st = freezed,}) {
  return _then(_PickingError(
error: freezed == error ? _self.error : error ,st: freezed == st ? _self.st : st // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class _ParsingError implements RSVPError {
  const _ParsingError({this.error, this.st});
  

@override final  Object? error;
@override final  StackTrace? st;

/// Create a copy of RSVPError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParsingErrorCopyWith<_ParsingError> get copyWith => __$ParsingErrorCopyWithImpl<_ParsingError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParsingError&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.st, st) || other.st == st));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error),st);

@override
String toString() {
  return 'RSVPError.parsingError(error: $error, st: $st)';
}


}

/// @nodoc
abstract mixin class _$ParsingErrorCopyWith<$Res> implements $RSVPErrorCopyWith<$Res> {
  factory _$ParsingErrorCopyWith(_ParsingError value, $Res Function(_ParsingError) _then) = __$ParsingErrorCopyWithImpl;
@override @useResult
$Res call({
 Object? error, StackTrace? st
});




}
/// @nodoc
class __$ParsingErrorCopyWithImpl<$Res>
    implements _$ParsingErrorCopyWith<$Res> {
  __$ParsingErrorCopyWithImpl(this._self, this._then);

  final _ParsingError _self;
  final $Res Function(_ParsingError) _then;

/// Create a copy of RSVPError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = freezed,Object? st = freezed,}) {
  return _then(_ParsingError(
error: freezed == error ? _self.error : error ,st: freezed == st ? _self.st : st // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

// dart format on
