// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rsvp_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RsvpEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RsvpEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RsvpEvent()';
}


}

/// @nodoc
class $RsvpEventCopyWith<$Res>  {
$RsvpEventCopyWith(RsvpEvent _, $Res Function(RsvpEvent) __);
}


/// Adds pattern-matching-related methods to [RsvpEvent].
extension RsvpEventPatterns on RsvpEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _AddBook value)?  addBook,TResult Function( _RemoveBook value)?  removeBook,TResult Function( _ToggleSelectBook value)?  toggleSelectBook,TResult Function( _StartAnimation value)?  startAnimation,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _AddBook() when addBook != null:
return addBook(_that);case _RemoveBook() when removeBook != null:
return removeBook(_that);case _ToggleSelectBook() when toggleSelectBook != null:
return toggleSelectBook(_that);case _StartAnimation() when startAnimation != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _AddBook value)  addBook,required TResult Function( _RemoveBook value)  removeBook,required TResult Function( _ToggleSelectBook value)  toggleSelectBook,required TResult Function( _StartAnimation value)  startAnimation,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _AddBook():
return addBook(_that);case _RemoveBook():
return removeBook(_that);case _ToggleSelectBook():
return toggleSelectBook(_that);case _StartAnimation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _AddBook value)?  addBook,TResult? Function( _RemoveBook value)?  removeBook,TResult? Function( _ToggleSelectBook value)?  toggleSelectBook,TResult? Function( _StartAnimation value)?  startAnimation,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _AddBook() when addBook != null:
return addBook(_that);case _RemoveBook() when removeBook != null:
return removeBook(_that);case _ToggleSelectBook() when toggleSelectBook != null:
return toggleSelectBook(_that);case _StartAnimation() when startAnimation != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  addBook,TResult Function( BookMetaModel book)?  removeBook,TResult Function( BookMetaModel book)?  toggleSelectBook,TResult Function( int bookID)?  startAnimation,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _AddBook() when addBook != null:
return addBook();case _RemoveBook() when removeBook != null:
return removeBook(_that.book);case _ToggleSelectBook() when toggleSelectBook != null:
return toggleSelectBook(_that.book);case _StartAnimation() when startAnimation != null:
return startAnimation(_that.bookID);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  addBook,required TResult Function( BookMetaModel book)  removeBook,required TResult Function( BookMetaModel book)  toggleSelectBook,required TResult Function( int bookID)  startAnimation,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _AddBook():
return addBook();case _RemoveBook():
return removeBook(_that.book);case _ToggleSelectBook():
return toggleSelectBook(_that.book);case _StartAnimation():
return startAnimation(_that.bookID);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  addBook,TResult? Function( BookMetaModel book)?  removeBook,TResult? Function( BookMetaModel book)?  toggleSelectBook,TResult? Function( int bookID)?  startAnimation,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _AddBook() when addBook != null:
return addBook();case _RemoveBook() when removeBook != null:
return removeBook(_that.book);case _ToggleSelectBook() when toggleSelectBook != null:
return toggleSelectBook(_that.book);case _StartAnimation() when startAnimation != null:
return startAnimation(_that.bookID);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements RsvpEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RsvpEvent.started()';
}


}




/// @nodoc


class _AddBook implements RsvpEvent {
  const _AddBook();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddBook);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RsvpEvent.addBook()';
}


}




/// @nodoc


class _RemoveBook implements RsvpEvent {
  const _RemoveBook({required this.book});
  

 final  BookMetaModel book;

/// Create a copy of RsvpEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveBookCopyWith<_RemoveBook> get copyWith => __$RemoveBookCopyWithImpl<_RemoveBook>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoveBook&&(identical(other.book, book) || other.book == book));
}


@override
int get hashCode => Object.hash(runtimeType,book);

@override
String toString() {
  return 'RsvpEvent.removeBook(book: $book)';
}


}

/// @nodoc
abstract mixin class _$RemoveBookCopyWith<$Res> implements $RsvpEventCopyWith<$Res> {
  factory _$RemoveBookCopyWith(_RemoveBook value, $Res Function(_RemoveBook) _then) = __$RemoveBookCopyWithImpl;
@useResult
$Res call({
 BookMetaModel book
});


$BookMetaModelCopyWith<$Res> get book;

}
/// @nodoc
class __$RemoveBookCopyWithImpl<$Res>
    implements _$RemoveBookCopyWith<$Res> {
  __$RemoveBookCopyWithImpl(this._self, this._then);

  final _RemoveBook _self;
  final $Res Function(_RemoveBook) _then;

/// Create a copy of RsvpEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? book = null,}) {
  return _then(_RemoveBook(
book: null == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as BookMetaModel,
  ));
}

/// Create a copy of RsvpEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookMetaModelCopyWith<$Res> get book {
  
  return $BookMetaModelCopyWith<$Res>(_self.book, (value) {
    return _then(_self.copyWith(book: value));
  });
}
}

/// @nodoc


class _ToggleSelectBook implements RsvpEvent {
  const _ToggleSelectBook({required this.book});
  

 final  BookMetaModel book;

/// Create a copy of RsvpEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToggleSelectBookCopyWith<_ToggleSelectBook> get copyWith => __$ToggleSelectBookCopyWithImpl<_ToggleSelectBook>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToggleSelectBook&&(identical(other.book, book) || other.book == book));
}


@override
int get hashCode => Object.hash(runtimeType,book);

@override
String toString() {
  return 'RsvpEvent.toggleSelectBook(book: $book)';
}


}

/// @nodoc
abstract mixin class _$ToggleSelectBookCopyWith<$Res> implements $RsvpEventCopyWith<$Res> {
  factory _$ToggleSelectBookCopyWith(_ToggleSelectBook value, $Res Function(_ToggleSelectBook) _then) = __$ToggleSelectBookCopyWithImpl;
@useResult
$Res call({
 BookMetaModel book
});


$BookMetaModelCopyWith<$Res> get book;

}
/// @nodoc
class __$ToggleSelectBookCopyWithImpl<$Res>
    implements _$ToggleSelectBookCopyWith<$Res> {
  __$ToggleSelectBookCopyWithImpl(this._self, this._then);

  final _ToggleSelectBook _self;
  final $Res Function(_ToggleSelectBook) _then;

/// Create a copy of RsvpEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? book = null,}) {
  return _then(_ToggleSelectBook(
book: null == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as BookMetaModel,
  ));
}

/// Create a copy of RsvpEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookMetaModelCopyWith<$Res> get book {
  
  return $BookMetaModelCopyWith<$Res>(_self.book, (value) {
    return _then(_self.copyWith(book: value));
  });
}
}

/// @nodoc


class _StartAnimation implements RsvpEvent {
  const _StartAnimation({required this.bookID});
  

 final  int bookID;

/// Create a copy of RsvpEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartAnimationCopyWith<_StartAnimation> get copyWith => __$StartAnimationCopyWithImpl<_StartAnimation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartAnimation&&(identical(other.bookID, bookID) || other.bookID == bookID));
}


@override
int get hashCode => Object.hash(runtimeType,bookID);

@override
String toString() {
  return 'RsvpEvent.startAnimation(bookID: $bookID)';
}


}

/// @nodoc
abstract mixin class _$StartAnimationCopyWith<$Res> implements $RsvpEventCopyWith<$Res> {
  factory _$StartAnimationCopyWith(_StartAnimation value, $Res Function(_StartAnimation) _then) = __$StartAnimationCopyWithImpl;
@useResult
$Res call({
 int bookID
});




}
/// @nodoc
class __$StartAnimationCopyWithImpl<$Res>
    implements _$StartAnimationCopyWith<$Res> {
  __$StartAnimationCopyWithImpl(this._self, this._then);

  final _StartAnimation _self;
  final $Res Function(_StartAnimation) _then;

/// Create a copy of RsvpEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bookID = null,}) {
  return _then(_StartAnimation(
bookID: null == bookID ? _self.bookID : bookID // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$RsvpState {

 BookMetaModel? get selectedBook; bool get isAddingBook; RSVPError? get lastError; List<BookMetaModel> get books;
/// Create a copy of RsvpState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RsvpStateCopyWith<RsvpState> get copyWith => _$RsvpStateCopyWithImpl<RsvpState>(this as RsvpState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RsvpState&&(identical(other.selectedBook, selectedBook) || other.selectedBook == selectedBook)&&(identical(other.isAddingBook, isAddingBook) || other.isAddingBook == isAddingBook)&&(identical(other.lastError, lastError) || other.lastError == lastError)&&const DeepCollectionEquality().equals(other.books, books));
}


@override
int get hashCode => Object.hash(runtimeType,selectedBook,isAddingBook,lastError,const DeepCollectionEquality().hash(books));

@override
String toString() {
  return 'RsvpState(selectedBook: $selectedBook, isAddingBook: $isAddingBook, lastError: $lastError, books: $books)';
}


}

/// @nodoc
abstract mixin class $RsvpStateCopyWith<$Res>  {
  factory $RsvpStateCopyWith(RsvpState value, $Res Function(RsvpState) _then) = _$RsvpStateCopyWithImpl;
@useResult
$Res call({
 BookMetaModel? selectedBook, bool isAddingBook, RSVPError? lastError, List<BookMetaModel> books
});


$BookMetaModelCopyWith<$Res>? get selectedBook;$RSVPErrorCopyWith<$Res>? get lastError;

}
/// @nodoc
class _$RsvpStateCopyWithImpl<$Res>
    implements $RsvpStateCopyWith<$Res> {
  _$RsvpStateCopyWithImpl(this._self, this._then);

  final RsvpState _self;
  final $Res Function(RsvpState) _then;

/// Create a copy of RsvpState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedBook = freezed,Object? isAddingBook = null,Object? lastError = freezed,Object? books = null,}) {
  return _then(_self.copyWith(
selectedBook: freezed == selectedBook ? _self.selectedBook : selectedBook // ignore: cast_nullable_to_non_nullable
as BookMetaModel?,isAddingBook: null == isAddingBook ? _self.isAddingBook : isAddingBook // ignore: cast_nullable_to_non_nullable
as bool,lastError: freezed == lastError ? _self.lastError : lastError // ignore: cast_nullable_to_non_nullable
as RSVPError?,books: null == books ? _self.books : books // ignore: cast_nullable_to_non_nullable
as List<BookMetaModel>,
  ));
}
/// Create a copy of RsvpState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookMetaModelCopyWith<$Res>? get selectedBook {
    if (_self.selectedBook == null) {
    return null;
  }

  return $BookMetaModelCopyWith<$Res>(_self.selectedBook!, (value) {
    return _then(_self.copyWith(selectedBook: value));
  });
}/// Create a copy of RsvpState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RSVPErrorCopyWith<$Res>? get lastError {
    if (_self.lastError == null) {
    return null;
  }

  return $RSVPErrorCopyWith<$Res>(_self.lastError!, (value) {
    return _then(_self.copyWith(lastError: value));
  });
}
}


/// Adds pattern-matching-related methods to [RsvpState].
extension RsvpStatePatterns on RsvpState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RsvpState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RsvpState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RsvpState value)  $default,){
final _that = this;
switch (_that) {
case _RsvpState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RsvpState value)?  $default,){
final _that = this;
switch (_that) {
case _RsvpState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BookMetaModel? selectedBook,  bool isAddingBook,  RSVPError? lastError,  List<BookMetaModel> books)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RsvpState() when $default != null:
return $default(_that.selectedBook,_that.isAddingBook,_that.lastError,_that.books);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BookMetaModel? selectedBook,  bool isAddingBook,  RSVPError? lastError,  List<BookMetaModel> books)  $default,) {final _that = this;
switch (_that) {
case _RsvpState():
return $default(_that.selectedBook,_that.isAddingBook,_that.lastError,_that.books);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BookMetaModel? selectedBook,  bool isAddingBook,  RSVPError? lastError,  List<BookMetaModel> books)?  $default,) {final _that = this;
switch (_that) {
case _RsvpState() when $default != null:
return $default(_that.selectedBook,_that.isAddingBook,_that.lastError,_that.books);case _:
  return null;

}
}

}

/// @nodoc


class _RsvpState implements RsvpState {
  const _RsvpState({this.selectedBook, this.isAddingBook = false, this.lastError, final  List<BookMetaModel> books = const []}): _books = books;
  

@override final  BookMetaModel? selectedBook;
@override@JsonKey() final  bool isAddingBook;
@override final  RSVPError? lastError;
 final  List<BookMetaModel> _books;
@override@JsonKey() List<BookMetaModel> get books {
  if (_books is EqualUnmodifiableListView) return _books;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_books);
}


/// Create a copy of RsvpState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RsvpStateCopyWith<_RsvpState> get copyWith => __$RsvpStateCopyWithImpl<_RsvpState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RsvpState&&(identical(other.selectedBook, selectedBook) || other.selectedBook == selectedBook)&&(identical(other.isAddingBook, isAddingBook) || other.isAddingBook == isAddingBook)&&(identical(other.lastError, lastError) || other.lastError == lastError)&&const DeepCollectionEquality().equals(other._books, _books));
}


@override
int get hashCode => Object.hash(runtimeType,selectedBook,isAddingBook,lastError,const DeepCollectionEquality().hash(_books));

@override
String toString() {
  return 'RsvpState(selectedBook: $selectedBook, isAddingBook: $isAddingBook, lastError: $lastError, books: $books)';
}


}

/// @nodoc
abstract mixin class _$RsvpStateCopyWith<$Res> implements $RsvpStateCopyWith<$Res> {
  factory _$RsvpStateCopyWith(_RsvpState value, $Res Function(_RsvpState) _then) = __$RsvpStateCopyWithImpl;
@override @useResult
$Res call({
 BookMetaModel? selectedBook, bool isAddingBook, RSVPError? lastError, List<BookMetaModel> books
});


@override $BookMetaModelCopyWith<$Res>? get selectedBook;@override $RSVPErrorCopyWith<$Res>? get lastError;

}
/// @nodoc
class __$RsvpStateCopyWithImpl<$Res>
    implements _$RsvpStateCopyWith<$Res> {
  __$RsvpStateCopyWithImpl(this._self, this._then);

  final _RsvpState _self;
  final $Res Function(_RsvpState) _then;

/// Create a copy of RsvpState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedBook = freezed,Object? isAddingBook = null,Object? lastError = freezed,Object? books = null,}) {
  return _then(_RsvpState(
selectedBook: freezed == selectedBook ? _self.selectedBook : selectedBook // ignore: cast_nullable_to_non_nullable
as BookMetaModel?,isAddingBook: null == isAddingBook ? _self.isAddingBook : isAddingBook // ignore: cast_nullable_to_non_nullable
as bool,lastError: freezed == lastError ? _self.lastError : lastError // ignore: cast_nullable_to_non_nullable
as RSVPError?,books: null == books ? _self._books : books // ignore: cast_nullable_to_non_nullable
as List<BookMetaModel>,
  ));
}

/// Create a copy of RsvpState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookMetaModelCopyWith<$Res>? get selectedBook {
    if (_self.selectedBook == null) {
    return null;
  }

  return $BookMetaModelCopyWith<$Res>(_self.selectedBook!, (value) {
    return _then(_self.copyWith(selectedBook: value));
  });
}/// Create a copy of RsvpState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RSVPErrorCopyWith<$Res>? get lastError {
    if (_self.lastError == null) {
    return null;
  }

  return $RSVPErrorCopyWith<$Res>(_self.lastError!, (value) {
    return _then(_self.copyWith(lastError: value));
  });
}
}

// dart format on
