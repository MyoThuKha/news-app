// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NewsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NewsEvent()';
}


}

/// @nodoc
class $NewsEventCopyWith<$Res>  {
$NewsEventCopyWith(NewsEvent _, $Res Function(NewsEvent) __);
}


/// Adds pattern-matching-related methods to [NewsEvent].
extension NewsEventPatterns on NewsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _NewsLoaded value)?  newsLoaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _NewsLoaded() when newsLoaded != null:
return newsLoaded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _NewsLoaded value)  newsLoaded,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _NewsLoaded():
return newsLoaded(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _NewsLoaded value)?  newsLoaded,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _NewsLoaded() when newsLoaded != null:
return newsLoaded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  newsLoaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _NewsLoaded() when newsLoaded != null:
return newsLoaded();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  newsLoaded,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _NewsLoaded():
return newsLoaded();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  newsLoaded,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _NewsLoaded() when newsLoaded != null:
return newsLoaded();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements NewsEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NewsEvent.started()';
}


}




/// @nodoc


class _NewsLoaded implements NewsEvent {
  const _NewsLoaded();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewsLoaded);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NewsEvent.newsLoaded()';
}


}




/// @nodoc
mixin _$NewsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NewsState()';
}


}

/// @nodoc
class $NewsStateCopyWith<$Res>  {
$NewsStateCopyWith(NewsState _, $Res Function(NewsState) __);
}


/// Adds pattern-matching-related methods to [NewsState].
extension NewsStatePatterns on NewsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( Success value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Success() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( Success value)  success,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case Success():
return success(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( Success value)?  success,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Success() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( List<NewsEntity> news)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Success() when success != null:
return success(_that.news);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( List<NewsEntity> news)  success,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case Success():
return success(_that.news);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( List<NewsEntity> news)?  success,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Success() when success != null:
return success(_that.news);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements NewsState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NewsState.initial()';
}


}




/// @nodoc


class Success implements NewsState {
  const Success({required final  List<NewsEntity> news}): _news = news;
  

 final  List<NewsEntity> _news;
 List<NewsEntity> get news {
  if (_news is EqualUnmodifiableListView) return _news;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_news);
}


/// Create a copy of NewsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessCopyWith<Success> get copyWith => _$SuccessCopyWithImpl<Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Success&&const DeepCollectionEquality().equals(other._news, _news));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_news));

@override
String toString() {
  return 'NewsState.success(news: $news)';
}


}

/// @nodoc
abstract mixin class $SuccessCopyWith<$Res> implements $NewsStateCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) _then) = _$SuccessCopyWithImpl;
@useResult
$Res call({
 List<NewsEntity> news
});




}
/// @nodoc
class _$SuccessCopyWithImpl<$Res>
    implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(this._self, this._then);

  final Success _self;
  final $Res Function(Success) _then;

/// Create a copy of NewsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? news = null,}) {
  return _then(Success(
news: null == news ? _self._news : news // ignore: cast_nullable_to_non_nullable
as List<NewsEntity>,
  ));
}


}

// dart format on
