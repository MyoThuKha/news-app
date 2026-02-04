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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _NewsLoaded value)?  newsLoaded,TResult Function( _NewsRefreshed value)?  newsRefreshed,TResult Function( _NewsLoadMore value)?  loadMore,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _NewsLoaded() when newsLoaded != null:
return newsLoaded(_that);case _NewsRefreshed() when newsRefreshed != null:
return newsRefreshed(_that);case _NewsLoadMore() when loadMore != null:
return loadMore(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _NewsLoaded value)  newsLoaded,required TResult Function( _NewsRefreshed value)  newsRefreshed,required TResult Function( _NewsLoadMore value)  loadMore,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _NewsLoaded():
return newsLoaded(_that);case _NewsRefreshed():
return newsRefreshed(_that);case _NewsLoadMore():
return loadMore(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _NewsLoaded value)?  newsLoaded,TResult? Function( _NewsRefreshed value)?  newsRefreshed,TResult? Function( _NewsLoadMore value)?  loadMore,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _NewsLoaded() when newsLoaded != null:
return newsLoaded(_that);case _NewsRefreshed() when newsRefreshed != null:
return newsRefreshed(_that);case _NewsLoadMore() when loadMore != null:
return loadMore(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  newsLoaded,TResult Function( Completer<void>? refreshCompleter)?  newsRefreshed,TResult Function()?  loadMore,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _NewsLoaded() when newsLoaded != null:
return newsLoaded();case _NewsRefreshed() when newsRefreshed != null:
return newsRefreshed(_that.refreshCompleter);case _NewsLoadMore() when loadMore != null:
return loadMore();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  newsLoaded,required TResult Function( Completer<void>? refreshCompleter)  newsRefreshed,required TResult Function()  loadMore,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _NewsLoaded():
return newsLoaded();case _NewsRefreshed():
return newsRefreshed(_that.refreshCompleter);case _NewsLoadMore():
return loadMore();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  newsLoaded,TResult? Function( Completer<void>? refreshCompleter)?  newsRefreshed,TResult? Function()?  loadMore,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _NewsLoaded() when newsLoaded != null:
return newsLoaded();case _NewsRefreshed() when newsRefreshed != null:
return newsRefreshed(_that.refreshCompleter);case _NewsLoadMore() when loadMore != null:
return loadMore();case _:
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


class _NewsRefreshed implements NewsEvent {
  const _NewsRefreshed({this.refreshCompleter});
  

 final  Completer<void>? refreshCompleter;

/// Create a copy of NewsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewsRefreshedCopyWith<_NewsRefreshed> get copyWith => __$NewsRefreshedCopyWithImpl<_NewsRefreshed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewsRefreshed&&const DeepCollectionEquality().equals(other.refreshCompleter, refreshCompleter));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(refreshCompleter));

@override
String toString() {
  return 'NewsEvent.newsRefreshed(refreshCompleter: $refreshCompleter)';
}


}

/// @nodoc
abstract mixin class _$NewsRefreshedCopyWith<$Res> implements $NewsEventCopyWith<$Res> {
  factory _$NewsRefreshedCopyWith(_NewsRefreshed value, $Res Function(_NewsRefreshed) _then) = __$NewsRefreshedCopyWithImpl;
@useResult
$Res call({
 Completer<void>? refreshCompleter
});




}
/// @nodoc
class __$NewsRefreshedCopyWithImpl<$Res>
    implements _$NewsRefreshedCopyWith<$Res> {
  __$NewsRefreshedCopyWithImpl(this._self, this._then);

  final _NewsRefreshed _self;
  final $Res Function(_NewsRefreshed) _then;

/// Create a copy of NewsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? refreshCompleter = freezed,}) {
  return _then(_NewsRefreshed(
refreshCompleter: freezed == refreshCompleter ? _self.refreshCompleter : refreshCompleter // ignore: cast_nullable_to_non_nullable
as Completer<void>?,
  ));
}


}

/// @nodoc


class _NewsLoadMore implements NewsEvent {
  const _NewsLoadMore();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewsLoadMore);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NewsEvent.loadMore()';
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Success value)?  success,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Success value)  success,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Success():
return success(_that);case _Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Success value)?  success,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<NewsEntity> news,  bool hasReachedMax,  bool isMoreLoading,  bool isCached)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.news,_that.hasReachedMax,_that.isMoreLoading,_that.isCached);case _Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<NewsEntity> news,  bool hasReachedMax,  bool isMoreLoading,  bool isCached)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Success():
return success(_that.news,_that.hasReachedMax,_that.isMoreLoading,_that.isCached);case _Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<NewsEntity> news,  bool hasReachedMax,  bool isMoreLoading,  bool isCached)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.news,_that.hasReachedMax,_that.isMoreLoading,_that.isCached);case _Error() when error != null:
return error(_that.message);case _:
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


class _Loading implements NewsState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NewsState.loading()';
}


}




/// @nodoc


class _Success implements NewsState {
  const _Success({required final  List<NewsEntity> news, this.hasReachedMax = false, this.isMoreLoading = false, this.isCached = false}): _news = news;
  

 final  List<NewsEntity> _news;
 List<NewsEntity> get news {
  if (_news is EqualUnmodifiableListView) return _news;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_news);
}

@JsonKey() final  bool hasReachedMax;
@JsonKey() final  bool isMoreLoading;
@JsonKey() final  bool isCached;

/// Create a copy of NewsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&const DeepCollectionEquality().equals(other._news, _news)&&(identical(other.hasReachedMax, hasReachedMax) || other.hasReachedMax == hasReachedMax)&&(identical(other.isMoreLoading, isMoreLoading) || other.isMoreLoading == isMoreLoading)&&(identical(other.isCached, isCached) || other.isCached == isCached));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_news),hasReachedMax,isMoreLoading,isCached);

@override
String toString() {
  return 'NewsState.success(news: $news, hasReachedMax: $hasReachedMax, isMoreLoading: $isMoreLoading, isCached: $isCached)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $NewsStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 List<NewsEntity> news, bool hasReachedMax, bool isMoreLoading, bool isCached
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of NewsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? news = null,Object? hasReachedMax = null,Object? isMoreLoading = null,Object? isCached = null,}) {
  return _then(_Success(
news: null == news ? _self._news : news // ignore: cast_nullable_to_non_nullable
as List<NewsEntity>,hasReachedMax: null == hasReachedMax ? _self.hasReachedMax : hasReachedMax // ignore: cast_nullable_to_non_nullable
as bool,isMoreLoading: null == isMoreLoading ? _self.isMoreLoading : isMoreLoading // ignore: cast_nullable_to_non_nullable
as bool,isCached: null == isCached ? _self.isCached : isCached // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _Error implements NewsState {
  const _Error({required this.message});
  

 final  String message;

/// Create a copy of NewsState
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
  return 'NewsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $NewsStateCopyWith<$Res> {
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

/// Create a copy of NewsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
