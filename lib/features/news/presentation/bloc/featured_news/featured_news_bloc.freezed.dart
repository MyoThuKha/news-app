// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'featured_news_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FeaturedNewsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeaturedNewsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FeaturedNewsEvent()';
}


}

/// @nodoc
class $FeaturedNewsEventCopyWith<$Res>  {
$FeaturedNewsEventCopyWith(FeaturedNewsEvent _, $Res Function(FeaturedNewsEvent) __);
}


/// Adds pattern-matching-related methods to [FeaturedNewsEvent].
extension FeaturedNewsEventPatterns on FeaturedNewsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _FeaturedNewsLoaded value)?  featuredNewsLoaded,TResult Function( _FeaturedNewsRefreshed value)?  featuredNewsRefreshed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _FeaturedNewsLoaded() when featuredNewsLoaded != null:
return featuredNewsLoaded(_that);case _FeaturedNewsRefreshed() when featuredNewsRefreshed != null:
return featuredNewsRefreshed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _FeaturedNewsLoaded value)  featuredNewsLoaded,required TResult Function( _FeaturedNewsRefreshed value)  featuredNewsRefreshed,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _FeaturedNewsLoaded():
return featuredNewsLoaded(_that);case _FeaturedNewsRefreshed():
return featuredNewsRefreshed(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _FeaturedNewsLoaded value)?  featuredNewsLoaded,TResult? Function( _FeaturedNewsRefreshed value)?  featuredNewsRefreshed,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _FeaturedNewsLoaded() when featuredNewsLoaded != null:
return featuredNewsLoaded(_that);case _FeaturedNewsRefreshed() when featuredNewsRefreshed != null:
return featuredNewsRefreshed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  featuredNewsLoaded,TResult Function()?  featuredNewsRefreshed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _FeaturedNewsLoaded() when featuredNewsLoaded != null:
return featuredNewsLoaded();case _FeaturedNewsRefreshed() when featuredNewsRefreshed != null:
return featuredNewsRefreshed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  featuredNewsLoaded,required TResult Function()  featuredNewsRefreshed,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _FeaturedNewsLoaded():
return featuredNewsLoaded();case _FeaturedNewsRefreshed():
return featuredNewsRefreshed();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  featuredNewsLoaded,TResult? Function()?  featuredNewsRefreshed,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _FeaturedNewsLoaded() when featuredNewsLoaded != null:
return featuredNewsLoaded();case _FeaturedNewsRefreshed() when featuredNewsRefreshed != null:
return featuredNewsRefreshed();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements FeaturedNewsEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FeaturedNewsEvent.started()';
}


}




/// @nodoc


class _FeaturedNewsLoaded implements FeaturedNewsEvent {
  const _FeaturedNewsLoaded();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeaturedNewsLoaded);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FeaturedNewsEvent.featuredNewsLoaded()';
}


}




/// @nodoc


class _FeaturedNewsRefreshed implements FeaturedNewsEvent {
  const _FeaturedNewsRefreshed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeaturedNewsRefreshed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FeaturedNewsEvent.featuredNewsRefreshed()';
}


}




/// @nodoc
mixin _$FeaturedNewsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeaturedNewsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FeaturedNewsState()';
}


}

/// @nodoc
class $FeaturedNewsStateCopyWith<$Res>  {
$FeaturedNewsStateCopyWith(FeaturedNewsState _, $Res Function(FeaturedNewsState) __);
}


/// Adds pattern-matching-related methods to [FeaturedNewsState].
extension FeaturedNewsStatePatterns on FeaturedNewsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Empty value)?  empty,TResult Function( _Success value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Empty() when empty != null:
return empty(_that);case _Success() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Empty value)  empty,required TResult Function( _Success value)  success,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Empty():
return empty(_that);case _Success():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Empty value)?  empty,TResult? Function( _Success value)?  success,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Empty() when empty != null:
return empty(_that);case _Success() when success != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  empty,TResult Function( NewsEntity news,  bool isCached)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Empty() when empty != null:
return empty();case _Success() when success != null:
return success(_that.news,_that.isCached);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  empty,required TResult Function( NewsEntity news,  bool isCached)  success,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Empty():
return empty();case _Success():
return success(_that.news,_that.isCached);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  empty,TResult? Function( NewsEntity news,  bool isCached)?  success,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Empty() when empty != null:
return empty();case _Success() when success != null:
return success(_that.news,_that.isCached);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements FeaturedNewsState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FeaturedNewsState.initial()';
}


}




/// @nodoc


class _Loading implements FeaturedNewsState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FeaturedNewsState.loading()';
}


}




/// @nodoc


class _Empty implements FeaturedNewsState {
  const _Empty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Empty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FeaturedNewsState.empty()';
}


}




/// @nodoc


class _Success implements FeaturedNewsState {
  const _Success({required this.news, this.isCached = false});
  

 final  NewsEntity news;
@JsonKey() final  bool isCached;

/// Create a copy of FeaturedNewsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.news, news) || other.news == news)&&(identical(other.isCached, isCached) || other.isCached == isCached));
}


@override
int get hashCode => Object.hash(runtimeType,news,isCached);

@override
String toString() {
  return 'FeaturedNewsState.success(news: $news, isCached: $isCached)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $FeaturedNewsStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 NewsEntity news, bool isCached
});


$NewsEntityCopyWith<$Res> get news;

}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of FeaturedNewsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? news = null,Object? isCached = null,}) {
  return _then(_Success(
news: null == news ? _self.news : news // ignore: cast_nullable_to_non_nullable
as NewsEntity,isCached: null == isCached ? _self.isCached : isCached // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of FeaturedNewsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NewsEntityCopyWith<$Res> get news {
  
  return $NewsEntityCopyWith<$Res>(_self.news, (value) {
    return _then(_self.copyWith(news: value));
  });
}
}

// dart format on
