// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reading_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReadingEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReadingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReadingEvent()';
}


}

/// @nodoc
class $ReadingEventCopyWith<$Res>  {
$ReadingEventCopyWith(ReadingEvent _, $Res Function(ReadingEvent) __);
}


/// Adds pattern-matching-related methods to [ReadingEvent].
extension ReadingEventPatterns on ReadingEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InitializeReadingEvent value)?  initialize,TResult Function( StartReadingEvent value)?  start,TResult Function( PauseReadingEvent value)?  pause,TResult Function( ResumeReadingEvent value)?  resume,TResult Function( NextWordEvent value)?  next,TResult Function( PreviousWordEvent value)?  previous,TResult Function( ChangeWpmEvent value)?  changeWpm,TResult Function( UpdateCurrentTokenEvent value)?  updateCurrentToken,TResult Function( ReadingCompletedEvent value)?  completed,TResult Function( DisposeReadingEvent value)?  dispose,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InitializeReadingEvent() when initialize != null:
return initialize(_that);case StartReadingEvent() when start != null:
return start(_that);case PauseReadingEvent() when pause != null:
return pause(_that);case ResumeReadingEvent() when resume != null:
return resume(_that);case NextWordEvent() when next != null:
return next(_that);case PreviousWordEvent() when previous != null:
return previous(_that);case ChangeWpmEvent() when changeWpm != null:
return changeWpm(_that);case UpdateCurrentTokenEvent() when updateCurrentToken != null:
return updateCurrentToken(_that);case ReadingCompletedEvent() when completed != null:
return completed(_that);case DisposeReadingEvent() when dispose != null:
return dispose(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InitializeReadingEvent value)  initialize,required TResult Function( StartReadingEvent value)  start,required TResult Function( PauseReadingEvent value)  pause,required TResult Function( ResumeReadingEvent value)  resume,required TResult Function( NextWordEvent value)  next,required TResult Function( PreviousWordEvent value)  previous,required TResult Function( ChangeWpmEvent value)  changeWpm,required TResult Function( UpdateCurrentTokenEvent value)  updateCurrentToken,required TResult Function( ReadingCompletedEvent value)  completed,required TResult Function( DisposeReadingEvent value)  dispose,}){
final _that = this;
switch (_that) {
case InitializeReadingEvent():
return initialize(_that);case StartReadingEvent():
return start(_that);case PauseReadingEvent():
return pause(_that);case ResumeReadingEvent():
return resume(_that);case NextWordEvent():
return next(_that);case PreviousWordEvent():
return previous(_that);case ChangeWpmEvent():
return changeWpm(_that);case UpdateCurrentTokenEvent():
return updateCurrentToken(_that);case ReadingCompletedEvent():
return completed(_that);case DisposeReadingEvent():
return dispose(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InitializeReadingEvent value)?  initialize,TResult? Function( StartReadingEvent value)?  start,TResult? Function( PauseReadingEvent value)?  pause,TResult? Function( ResumeReadingEvent value)?  resume,TResult? Function( NextWordEvent value)?  next,TResult? Function( PreviousWordEvent value)?  previous,TResult? Function( ChangeWpmEvent value)?  changeWpm,TResult? Function( UpdateCurrentTokenEvent value)?  updateCurrentToken,TResult? Function( ReadingCompletedEvent value)?  completed,TResult? Function( DisposeReadingEvent value)?  dispose,}){
final _that = this;
switch (_that) {
case InitializeReadingEvent() when initialize != null:
return initialize(_that);case StartReadingEvent() when start != null:
return start(_that);case PauseReadingEvent() when pause != null:
return pause(_that);case ResumeReadingEvent() when resume != null:
return resume(_that);case NextWordEvent() when next != null:
return next(_that);case PreviousWordEvent() when previous != null:
return previous(_that);case ChangeWpmEvent() when changeWpm != null:
return changeWpm(_that);case UpdateCurrentTokenEvent() when updateCurrentToken != null:
return updateCurrentToken(_that);case ReadingCompletedEvent() when completed != null:
return completed(_that);case DisposeReadingEvent() when dispose != null:
return dispose(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<RsvpBionicToken> tokens,  int initialWpm,  int initialIndex)?  initialize,TResult Function()?  start,TResult Function()?  pause,TResult Function()?  resume,TResult Function()?  next,TResult Function()?  previous,TResult Function( int newWpm)?  changeWpm,TResult Function( RsvpBionicToken token)?  updateCurrentToken,TResult Function()?  completed,TResult Function()?  dispose,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InitializeReadingEvent() when initialize != null:
return initialize(_that.tokens,_that.initialWpm,_that.initialIndex);case StartReadingEvent() when start != null:
return start();case PauseReadingEvent() when pause != null:
return pause();case ResumeReadingEvent() when resume != null:
return resume();case NextWordEvent() when next != null:
return next();case PreviousWordEvent() when previous != null:
return previous();case ChangeWpmEvent() when changeWpm != null:
return changeWpm(_that.newWpm);case UpdateCurrentTokenEvent() when updateCurrentToken != null:
return updateCurrentToken(_that.token);case ReadingCompletedEvent() when completed != null:
return completed();case DisposeReadingEvent() when dispose != null:
return dispose();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<RsvpBionicToken> tokens,  int initialWpm,  int initialIndex)  initialize,required TResult Function()  start,required TResult Function()  pause,required TResult Function()  resume,required TResult Function()  next,required TResult Function()  previous,required TResult Function( int newWpm)  changeWpm,required TResult Function( RsvpBionicToken token)  updateCurrentToken,required TResult Function()  completed,required TResult Function()  dispose,}) {final _that = this;
switch (_that) {
case InitializeReadingEvent():
return initialize(_that.tokens,_that.initialWpm,_that.initialIndex);case StartReadingEvent():
return start();case PauseReadingEvent():
return pause();case ResumeReadingEvent():
return resume();case NextWordEvent():
return next();case PreviousWordEvent():
return previous();case ChangeWpmEvent():
return changeWpm(_that.newWpm);case UpdateCurrentTokenEvent():
return updateCurrentToken(_that.token);case ReadingCompletedEvent():
return completed();case DisposeReadingEvent():
return dispose();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<RsvpBionicToken> tokens,  int initialWpm,  int initialIndex)?  initialize,TResult? Function()?  start,TResult? Function()?  pause,TResult? Function()?  resume,TResult? Function()?  next,TResult? Function()?  previous,TResult? Function( int newWpm)?  changeWpm,TResult? Function( RsvpBionicToken token)?  updateCurrentToken,TResult? Function()?  completed,TResult? Function()?  dispose,}) {final _that = this;
switch (_that) {
case InitializeReadingEvent() when initialize != null:
return initialize(_that.tokens,_that.initialWpm,_that.initialIndex);case StartReadingEvent() when start != null:
return start();case PauseReadingEvent() when pause != null:
return pause();case ResumeReadingEvent() when resume != null:
return resume();case NextWordEvent() when next != null:
return next();case PreviousWordEvent() when previous != null:
return previous();case ChangeWpmEvent() when changeWpm != null:
return changeWpm(_that.newWpm);case UpdateCurrentTokenEvent() when updateCurrentToken != null:
return updateCurrentToken(_that.token);case ReadingCompletedEvent() when completed != null:
return completed();case DisposeReadingEvent() when dispose != null:
return dispose();case _:
  return null;

}
}

}

/// @nodoc


class InitializeReadingEvent implements ReadingEvent {
  const InitializeReadingEvent({required final  List<RsvpBionicToken> tokens, this.initialWpm = 300, this.initialIndex = 0}): _tokens = tokens;
  

 final  List<RsvpBionicToken> _tokens;
 List<RsvpBionicToken> get tokens {
  if (_tokens is EqualUnmodifiableListView) return _tokens;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tokens);
}

@JsonKey() final  int initialWpm;
@JsonKey() final  int initialIndex;

/// Create a copy of ReadingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InitializeReadingEventCopyWith<InitializeReadingEvent> get copyWith => _$InitializeReadingEventCopyWithImpl<InitializeReadingEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitializeReadingEvent&&const DeepCollectionEquality().equals(other._tokens, _tokens)&&(identical(other.initialWpm, initialWpm) || other.initialWpm == initialWpm)&&(identical(other.initialIndex, initialIndex) || other.initialIndex == initialIndex));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tokens),initialWpm,initialIndex);

@override
String toString() {
  return 'ReadingEvent.initialize(tokens: $tokens, initialWpm: $initialWpm, initialIndex: $initialIndex)';
}


}

/// @nodoc
abstract mixin class $InitializeReadingEventCopyWith<$Res> implements $ReadingEventCopyWith<$Res> {
  factory $InitializeReadingEventCopyWith(InitializeReadingEvent value, $Res Function(InitializeReadingEvent) _then) = _$InitializeReadingEventCopyWithImpl;
@useResult
$Res call({
 List<RsvpBionicToken> tokens, int initialWpm, int initialIndex
});




}
/// @nodoc
class _$InitializeReadingEventCopyWithImpl<$Res>
    implements $InitializeReadingEventCopyWith<$Res> {
  _$InitializeReadingEventCopyWithImpl(this._self, this._then);

  final InitializeReadingEvent _self;
  final $Res Function(InitializeReadingEvent) _then;

/// Create a copy of ReadingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tokens = null,Object? initialWpm = null,Object? initialIndex = null,}) {
  return _then(InitializeReadingEvent(
tokens: null == tokens ? _self._tokens : tokens // ignore: cast_nullable_to_non_nullable
as List<RsvpBionicToken>,initialWpm: null == initialWpm ? _self.initialWpm : initialWpm // ignore: cast_nullable_to_non_nullable
as int,initialIndex: null == initialIndex ? _self.initialIndex : initialIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class StartReadingEvent implements ReadingEvent {
  const StartReadingEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StartReadingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReadingEvent.start()';
}


}




/// @nodoc


class PauseReadingEvent implements ReadingEvent {
  const PauseReadingEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PauseReadingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReadingEvent.pause()';
}


}




/// @nodoc


class ResumeReadingEvent implements ReadingEvent {
  const ResumeReadingEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResumeReadingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReadingEvent.resume()';
}


}




/// @nodoc


class NextWordEvent implements ReadingEvent {
  const NextWordEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NextWordEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReadingEvent.next()';
}


}




/// @nodoc


class PreviousWordEvent implements ReadingEvent {
  const PreviousWordEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreviousWordEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReadingEvent.previous()';
}


}




/// @nodoc


class ChangeWpmEvent implements ReadingEvent {
  const ChangeWpmEvent(this.newWpm);
  

 final  int newWpm;

/// Create a copy of ReadingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeWpmEventCopyWith<ChangeWpmEvent> get copyWith => _$ChangeWpmEventCopyWithImpl<ChangeWpmEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeWpmEvent&&(identical(other.newWpm, newWpm) || other.newWpm == newWpm));
}


@override
int get hashCode => Object.hash(runtimeType,newWpm);

@override
String toString() {
  return 'ReadingEvent.changeWpm(newWpm: $newWpm)';
}


}

/// @nodoc
abstract mixin class $ChangeWpmEventCopyWith<$Res> implements $ReadingEventCopyWith<$Res> {
  factory $ChangeWpmEventCopyWith(ChangeWpmEvent value, $Res Function(ChangeWpmEvent) _then) = _$ChangeWpmEventCopyWithImpl;
@useResult
$Res call({
 int newWpm
});




}
/// @nodoc
class _$ChangeWpmEventCopyWithImpl<$Res>
    implements $ChangeWpmEventCopyWith<$Res> {
  _$ChangeWpmEventCopyWithImpl(this._self, this._then);

  final ChangeWpmEvent _self;
  final $Res Function(ChangeWpmEvent) _then;

/// Create a copy of ReadingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? newWpm = null,}) {
  return _then(ChangeWpmEvent(
null == newWpm ? _self.newWpm : newWpm // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class UpdateCurrentTokenEvent implements ReadingEvent {
  const UpdateCurrentTokenEvent(this.token);
  

 final  RsvpBionicToken token;

/// Create a copy of ReadingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateCurrentTokenEventCopyWith<UpdateCurrentTokenEvent> get copyWith => _$UpdateCurrentTokenEventCopyWithImpl<UpdateCurrentTokenEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateCurrentTokenEvent&&(identical(other.token, token) || other.token == token));
}


@override
int get hashCode => Object.hash(runtimeType,token);

@override
String toString() {
  return 'ReadingEvent.updateCurrentToken(token: $token)';
}


}

/// @nodoc
abstract mixin class $UpdateCurrentTokenEventCopyWith<$Res> implements $ReadingEventCopyWith<$Res> {
  factory $UpdateCurrentTokenEventCopyWith(UpdateCurrentTokenEvent value, $Res Function(UpdateCurrentTokenEvent) _then) = _$UpdateCurrentTokenEventCopyWithImpl;
@useResult
$Res call({
 RsvpBionicToken token
});


$RsvpBionicTokenCopyWith<$Res> get token;

}
/// @nodoc
class _$UpdateCurrentTokenEventCopyWithImpl<$Res>
    implements $UpdateCurrentTokenEventCopyWith<$Res> {
  _$UpdateCurrentTokenEventCopyWithImpl(this._self, this._then);

  final UpdateCurrentTokenEvent _self;
  final $Res Function(UpdateCurrentTokenEvent) _then;

/// Create a copy of ReadingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? token = null,}) {
  return _then(UpdateCurrentTokenEvent(
null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as RsvpBionicToken,
  ));
}

/// Create a copy of ReadingEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RsvpBionicTokenCopyWith<$Res> get token {
  
  return $RsvpBionicTokenCopyWith<$Res>(_self.token, (value) {
    return _then(_self.copyWith(token: value));
  });
}
}

/// @nodoc


class ReadingCompletedEvent implements ReadingEvent {
  const ReadingCompletedEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReadingCompletedEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReadingEvent.completed()';
}


}




/// @nodoc


class DisposeReadingEvent implements ReadingEvent {
  const DisposeReadingEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DisposeReadingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReadingEvent.dispose()';
}


}




/// @nodoc
mixin _$ReadingState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReadingState()';
}


}

/// @nodoc
class $ReadingStateCopyWith<$Res>  {
$ReadingStateCopyWith(ReadingState _, $Res Function(ReadingState) __);
}


/// Adds pattern-matching-related methods to [ReadingState].
extension ReadingStatePatterns on ReadingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Ready value)?  ready,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Ready() when ready != null:
return ready(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Ready value)  ready,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Ready():
return ready(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Ready value)?  ready,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Ready() when ready != null:
return ready(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( List<RsvpBionicToken> tokens,  RsvpBionicToken currentToken,  int wpm,  int totalWords,  bool isPlaying,  bool isCompleted,  double progress)?  ready,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Ready() when ready != null:
return ready(_that.tokens,_that.currentToken,_that.wpm,_that.totalWords,_that.isPlaying,_that.isCompleted,_that.progress);case _Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( List<RsvpBionicToken> tokens,  RsvpBionicToken currentToken,  int wpm,  int totalWords,  bool isPlaying,  bool isCompleted,  double progress)  ready,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Ready():
return ready(_that.tokens,_that.currentToken,_that.wpm,_that.totalWords,_that.isPlaying,_that.isCompleted,_that.progress);case _Error():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( List<RsvpBionicToken> tokens,  RsvpBionicToken currentToken,  int wpm,  int totalWords,  bool isPlaying,  bool isCompleted,  double progress)?  ready,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Ready() when ready != null:
return ready(_that.tokens,_that.currentToken,_that.wpm,_that.totalWords,_that.isPlaying,_that.isCompleted,_that.progress);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ReadingState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReadingState.initial()';
}


}




/// @nodoc


class _Ready implements ReadingState {
  const _Ready({required final  List<RsvpBionicToken> tokens, required this.currentToken, required this.wpm, required this.totalWords, this.isPlaying = false, this.isCompleted = false, this.progress = 0.0}): _tokens = tokens;
  

 final  List<RsvpBionicToken> _tokens;
 List<RsvpBionicToken> get tokens {
  if (_tokens is EqualUnmodifiableListView) return _tokens;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tokens);
}

 final  RsvpBionicToken currentToken;
 final  int wpm;
 final  int totalWords;
@JsonKey() final  bool isPlaying;
@JsonKey() final  bool isCompleted;
@JsonKey() final  double progress;

/// Create a copy of ReadingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReadyCopyWith<_Ready> get copyWith => __$ReadyCopyWithImpl<_Ready>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Ready&&const DeepCollectionEquality().equals(other._tokens, _tokens)&&(identical(other.currentToken, currentToken) || other.currentToken == currentToken)&&(identical(other.wpm, wpm) || other.wpm == wpm)&&(identical(other.totalWords, totalWords) || other.totalWords == totalWords)&&(identical(other.isPlaying, isPlaying) || other.isPlaying == isPlaying)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.progress, progress) || other.progress == progress));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tokens),currentToken,wpm,totalWords,isPlaying,isCompleted,progress);

@override
String toString() {
  return 'ReadingState.ready(tokens: $tokens, currentToken: $currentToken, wpm: $wpm, totalWords: $totalWords, isPlaying: $isPlaying, isCompleted: $isCompleted, progress: $progress)';
}


}

/// @nodoc
abstract mixin class _$ReadyCopyWith<$Res> implements $ReadingStateCopyWith<$Res> {
  factory _$ReadyCopyWith(_Ready value, $Res Function(_Ready) _then) = __$ReadyCopyWithImpl;
@useResult
$Res call({
 List<RsvpBionicToken> tokens, RsvpBionicToken currentToken, int wpm, int totalWords, bool isPlaying, bool isCompleted, double progress
});


$RsvpBionicTokenCopyWith<$Res> get currentToken;

}
/// @nodoc
class __$ReadyCopyWithImpl<$Res>
    implements _$ReadyCopyWith<$Res> {
  __$ReadyCopyWithImpl(this._self, this._then);

  final _Ready _self;
  final $Res Function(_Ready) _then;

/// Create a copy of ReadingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tokens = null,Object? currentToken = null,Object? wpm = null,Object? totalWords = null,Object? isPlaying = null,Object? isCompleted = null,Object? progress = null,}) {
  return _then(_Ready(
tokens: null == tokens ? _self._tokens : tokens // ignore: cast_nullable_to_non_nullable
as List<RsvpBionicToken>,currentToken: null == currentToken ? _self.currentToken : currentToken // ignore: cast_nullable_to_non_nullable
as RsvpBionicToken,wpm: null == wpm ? _self.wpm : wpm // ignore: cast_nullable_to_non_nullable
as int,totalWords: null == totalWords ? _self.totalWords : totalWords // ignore: cast_nullable_to_non_nullable
as int,isPlaying: null == isPlaying ? _self.isPlaying : isPlaying // ignore: cast_nullable_to_non_nullable
as bool,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of ReadingState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RsvpBionicTokenCopyWith<$Res> get currentToken {
  
  return $RsvpBionicTokenCopyWith<$Res>(_self.currentToken, (value) {
    return _then(_self.copyWith(currentToken: value));
  });
}
}

/// @nodoc


class _Error implements ReadingState {
  const _Error({required this.message});
  

 final  String message;

/// Create a copy of ReadingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ReadingState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $ReadingStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of ReadingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
