// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rsvp_bloc_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RsvpBlocEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RsvpBlocEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RsvpBlocEvent()';
}


}

/// @nodoc
class $RsvpBlocEventCopyWith<$Res>  {
$RsvpBlocEventCopyWith(RsvpBlocEvent _, $Res Function(RsvpBlocEvent) __);
}


/// Adds pattern-matching-related methods to [RsvpBlocEvent].
extension RsvpBlocEventPatterns on RsvpBlocEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _AddBook value)?  addBook,TResult Function( _StartAnimation value)?  startAnimation,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _AddBook() when addBook != null:
return addBook(_that);case _StartAnimation() when startAnimation != null:
return startAnimation(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _AddBook value)  addBook,required TResult Function( _StartAnimation value)  startAnimation,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _AddBook():
return addBook(_that);case _StartAnimation():
return startAnimation(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _AddBook value)?  addBook,TResult? Function( _StartAnimation value)?  startAnimation,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _AddBook() when addBook != null:
return addBook(_that);case _StartAnimation() when startAnimation != null:
return startAnimation(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  addBook,TResult Function()?  startAnimation,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _AddBook() when addBook != null:
return addBook();case _StartAnimation() when startAnimation != null:
return startAnimation();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  addBook,required TResult Function()  startAnimation,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _AddBook():
return addBook();case _StartAnimation():
return startAnimation();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  addBook,TResult? Function()?  startAnimation,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _AddBook() when addBook != null:
return addBook();case _StartAnimation() when startAnimation != null:
return startAnimation();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements RsvpBlocEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RsvpBlocEvent.started()';
}


}




/// @nodoc


class _AddBook implements RsvpBlocEvent {
  const _AddBook();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddBook);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RsvpBlocEvent.addBook()';
}


}




/// @nodoc


class _StartAnimation implements RsvpBlocEvent {
  const _StartAnimation();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartAnimation);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RsvpBlocEvent.startAnimation()';
}


}




/// @nodoc
mixin _$RsvpBlocState {

 BookModel? get selectedBook;
/// Create a copy of RsvpBlocState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RsvpBlocStateCopyWith<RsvpBlocState> get copyWith => _$RsvpBlocStateCopyWithImpl<RsvpBlocState>(this as RsvpBlocState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RsvpBlocState&&(identical(other.selectedBook, selectedBook) || other.selectedBook == selectedBook));
}


@override
int get hashCode => Object.hash(runtimeType,selectedBook);

@override
String toString() {
  return 'RsvpBlocState(selectedBook: $selectedBook)';
}


}

/// @nodoc
abstract mixin class $RsvpBlocStateCopyWith<$Res>  {
  factory $RsvpBlocStateCopyWith(RsvpBlocState value, $Res Function(RsvpBlocState) _then) = _$RsvpBlocStateCopyWithImpl;
@useResult
$Res call({
 BookModel? selectedBook
});


$BookModelCopyWith<$Res>? get selectedBook;

}
/// @nodoc
class _$RsvpBlocStateCopyWithImpl<$Res>
    implements $RsvpBlocStateCopyWith<$Res> {
  _$RsvpBlocStateCopyWithImpl(this._self, this._then);

  final RsvpBlocState _self;
  final $Res Function(RsvpBlocState) _then;

/// Create a copy of RsvpBlocState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedBook = freezed,}) {
  return _then(_self.copyWith(
selectedBook: freezed == selectedBook ? _self.selectedBook : selectedBook // ignore: cast_nullable_to_non_nullable
as BookModel?,
  ));
}
/// Create a copy of RsvpBlocState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookModelCopyWith<$Res>? get selectedBook {
    if (_self.selectedBook == null) {
    return null;
  }

  return $BookModelCopyWith<$Res>(_self.selectedBook!, (value) {
    return _then(_self.copyWith(selectedBook: value));
  });
}
}


/// Adds pattern-matching-related methods to [RsvpBlocState].
extension RsvpBlocStatePatterns on RsvpBlocState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RsvpBlocState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RsvpBlocState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RsvpBlocState value)  $default,){
final _that = this;
switch (_that) {
case _RsvpBlocState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RsvpBlocState value)?  $default,){
final _that = this;
switch (_that) {
case _RsvpBlocState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BookModel? selectedBook)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RsvpBlocState() when $default != null:
return $default(_that.selectedBook);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BookModel? selectedBook)  $default,) {final _that = this;
switch (_that) {
case _RsvpBlocState():
return $default(_that.selectedBook);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BookModel? selectedBook)?  $default,) {final _that = this;
switch (_that) {
case _RsvpBlocState() when $default != null:
return $default(_that.selectedBook);case _:
  return null;

}
}

}

/// @nodoc


class _RsvpBlocState implements RsvpBlocState {
  const _RsvpBlocState({this.selectedBook});
  

@override final  BookModel? selectedBook;

/// Create a copy of RsvpBlocState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RsvpBlocStateCopyWith<_RsvpBlocState> get copyWith => __$RsvpBlocStateCopyWithImpl<_RsvpBlocState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RsvpBlocState&&(identical(other.selectedBook, selectedBook) || other.selectedBook == selectedBook));
}


@override
int get hashCode => Object.hash(runtimeType,selectedBook);

@override
String toString() {
  return 'RsvpBlocState(selectedBook: $selectedBook)';
}


}

/// @nodoc
abstract mixin class _$RsvpBlocStateCopyWith<$Res> implements $RsvpBlocStateCopyWith<$Res> {
  factory _$RsvpBlocStateCopyWith(_RsvpBlocState value, $Res Function(_RsvpBlocState) _then) = __$RsvpBlocStateCopyWithImpl;
@override @useResult
$Res call({
 BookModel? selectedBook
});


@override $BookModelCopyWith<$Res>? get selectedBook;

}
/// @nodoc
class __$RsvpBlocStateCopyWithImpl<$Res>
    implements _$RsvpBlocStateCopyWith<$Res> {
  __$RsvpBlocStateCopyWithImpl(this._self, this._then);

  final _RsvpBlocState _self;
  final $Res Function(_RsvpBlocState) _then;

/// Create a copy of RsvpBlocState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedBook = freezed,}) {
  return _then(_RsvpBlocState(
selectedBook: freezed == selectedBook ? _self.selectedBook : selectedBook // ignore: cast_nullable_to_non_nullable
as BookModel?,
  ));
}

/// Create a copy of RsvpBlocState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookModelCopyWith<$Res>? get selectedBook {
    if (_self.selectedBook == null) {
    return null;
  }

  return $BookModelCopyWith<$Res>(_self.selectedBook!, (value) {
    return _then(_self.copyWith(selectedBook: value));
  });
}
}

// dart format on
