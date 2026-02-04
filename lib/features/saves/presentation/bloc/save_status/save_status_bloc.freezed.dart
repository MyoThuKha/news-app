// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'save_status_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SavedStatusEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedStatusEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SavedStatusEvent()';
}


}

/// @nodoc
class $SavedStatusEventCopyWith<$Res>  {
$SavedStatusEventCopyWith(SavedStatusEvent _, $Res Function(SavedStatusEvent) __);
}


/// Adds pattern-matching-related methods to [SavedStatusEvent].
extension SavedStatusEventPatterns on SavedStatusEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _SaveStatusLoaded value)?  saveStatusLoaded,TResult Function( _SaveRemoved value)?  saveRemoved,TResult Function( _SaveAdded value)?  saveAdded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _SaveStatusLoaded() when saveStatusLoaded != null:
return saveStatusLoaded(_that);case _SaveRemoved() when saveRemoved != null:
return saveRemoved(_that);case _SaveAdded() when saveAdded != null:
return saveAdded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _SaveStatusLoaded value)  saveStatusLoaded,required TResult Function( _SaveRemoved value)  saveRemoved,required TResult Function( _SaveAdded value)  saveAdded,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _SaveStatusLoaded():
return saveStatusLoaded(_that);case _SaveRemoved():
return saveRemoved(_that);case _SaveAdded():
return saveAdded(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _SaveStatusLoaded value)?  saveStatusLoaded,TResult? Function( _SaveRemoved value)?  saveRemoved,TResult? Function( _SaveAdded value)?  saveAdded,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _SaveStatusLoaded() when saveStatusLoaded != null:
return saveStatusLoaded(_that);case _SaveRemoved() when saveRemoved != null:
return saveRemoved(_that);case _SaveAdded() when saveAdded != null:
return saveAdded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( String url)?  saveStatusLoaded,TResult Function( NewsEntity news)?  saveRemoved,TResult Function( NewsEntity news)?  saveAdded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _SaveStatusLoaded() when saveStatusLoaded != null:
return saveStatusLoaded(_that.url);case _SaveRemoved() when saveRemoved != null:
return saveRemoved(_that.news);case _SaveAdded() when saveAdded != null:
return saveAdded(_that.news);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( String url)  saveStatusLoaded,required TResult Function( NewsEntity news)  saveRemoved,required TResult Function( NewsEntity news)  saveAdded,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _SaveStatusLoaded():
return saveStatusLoaded(_that.url);case _SaveRemoved():
return saveRemoved(_that.news);case _SaveAdded():
return saveAdded(_that.news);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( String url)?  saveStatusLoaded,TResult? Function( NewsEntity news)?  saveRemoved,TResult? Function( NewsEntity news)?  saveAdded,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _SaveStatusLoaded() when saveStatusLoaded != null:
return saveStatusLoaded(_that.url);case _SaveRemoved() when saveRemoved != null:
return saveRemoved(_that.news);case _SaveAdded() when saveAdded != null:
return saveAdded(_that.news);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements SavedStatusEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SavedStatusEvent.started()';
}


}




/// @nodoc


class _SaveStatusLoaded implements SavedStatusEvent {
  const _SaveStatusLoaded({required this.url});
  

 final  String url;

/// Create a copy of SavedStatusEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaveStatusLoadedCopyWith<_SaveStatusLoaded> get copyWith => __$SaveStatusLoadedCopyWithImpl<_SaveStatusLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveStatusLoaded&&(identical(other.url, url) || other.url == url));
}


@override
int get hashCode => Object.hash(runtimeType,url);

@override
String toString() {
  return 'SavedStatusEvent.saveStatusLoaded(url: $url)';
}


}

/// @nodoc
abstract mixin class _$SaveStatusLoadedCopyWith<$Res> implements $SavedStatusEventCopyWith<$Res> {
  factory _$SaveStatusLoadedCopyWith(_SaveStatusLoaded value, $Res Function(_SaveStatusLoaded) _then) = __$SaveStatusLoadedCopyWithImpl;
@useResult
$Res call({
 String url
});




}
/// @nodoc
class __$SaveStatusLoadedCopyWithImpl<$Res>
    implements _$SaveStatusLoadedCopyWith<$Res> {
  __$SaveStatusLoadedCopyWithImpl(this._self, this._then);

  final _SaveStatusLoaded _self;
  final $Res Function(_SaveStatusLoaded) _then;

/// Create a copy of SavedStatusEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? url = null,}) {
  return _then(_SaveStatusLoaded(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SaveRemoved implements SavedStatusEvent {
  const _SaveRemoved(this.news);
  

 final  NewsEntity news;

/// Create a copy of SavedStatusEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaveRemovedCopyWith<_SaveRemoved> get copyWith => __$SaveRemovedCopyWithImpl<_SaveRemoved>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveRemoved&&(identical(other.news, news) || other.news == news));
}


@override
int get hashCode => Object.hash(runtimeType,news);

@override
String toString() {
  return 'SavedStatusEvent.saveRemoved(news: $news)';
}


}

/// @nodoc
abstract mixin class _$SaveRemovedCopyWith<$Res> implements $SavedStatusEventCopyWith<$Res> {
  factory _$SaveRemovedCopyWith(_SaveRemoved value, $Res Function(_SaveRemoved) _then) = __$SaveRemovedCopyWithImpl;
@useResult
$Res call({
 NewsEntity news
});


$NewsEntityCopyWith<$Res> get news;

}
/// @nodoc
class __$SaveRemovedCopyWithImpl<$Res>
    implements _$SaveRemovedCopyWith<$Res> {
  __$SaveRemovedCopyWithImpl(this._self, this._then);

  final _SaveRemoved _self;
  final $Res Function(_SaveRemoved) _then;

/// Create a copy of SavedStatusEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? news = null,}) {
  return _then(_SaveRemoved(
null == news ? _self.news : news // ignore: cast_nullable_to_non_nullable
as NewsEntity,
  ));
}

/// Create a copy of SavedStatusEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NewsEntityCopyWith<$Res> get news {
  
  return $NewsEntityCopyWith<$Res>(_self.news, (value) {
    return _then(_self.copyWith(news: value));
  });
}
}

/// @nodoc


class _SaveAdded implements SavedStatusEvent {
  const _SaveAdded(this.news);
  

 final  NewsEntity news;

/// Create a copy of SavedStatusEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaveAddedCopyWith<_SaveAdded> get copyWith => __$SaveAddedCopyWithImpl<_SaveAdded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveAdded&&(identical(other.news, news) || other.news == news));
}


@override
int get hashCode => Object.hash(runtimeType,news);

@override
String toString() {
  return 'SavedStatusEvent.saveAdded(news: $news)';
}


}

/// @nodoc
abstract mixin class _$SaveAddedCopyWith<$Res> implements $SavedStatusEventCopyWith<$Res> {
  factory _$SaveAddedCopyWith(_SaveAdded value, $Res Function(_SaveAdded) _then) = __$SaveAddedCopyWithImpl;
@useResult
$Res call({
 NewsEntity news
});


$NewsEntityCopyWith<$Res> get news;

}
/// @nodoc
class __$SaveAddedCopyWithImpl<$Res>
    implements _$SaveAddedCopyWith<$Res> {
  __$SaveAddedCopyWithImpl(this._self, this._then);

  final _SaveAdded _self;
  final $Res Function(_SaveAdded) _then;

/// Create a copy of SavedStatusEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? news = null,}) {
  return _then(_SaveAdded(
null == news ? _self.news : news // ignore: cast_nullable_to_non_nullable
as NewsEntity,
  ));
}

/// Create a copy of SavedStatusEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NewsEntityCopyWith<$Res> get news {
  
  return $NewsEntityCopyWith<$Res>(_self.news, (value) {
    return _then(_self.copyWith(news: value));
  });
}
}

/// @nodoc
mixin _$SavedStatusState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedStatusState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SavedStatusState()';
}


}

/// @nodoc
class $SavedStatusStateCopyWith<$Res>  {
$SavedStatusStateCopyWith(SavedStatusState _, $Res Function(SavedStatusState) __);
}


/// Adds pattern-matching-related methods to [SavedStatusState].
extension SavedStatusStatePatterns on SavedStatusState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Success value)?  success,TResult Function( _Updated value)?  updated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Success() when success != null:
return success(_that);case _Updated() when updated != null:
return updated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Success value)  success,required TResult Function( _Updated value)  updated,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Success():
return success(_that);case _Updated():
return updated(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Success value)?  success,TResult? Function( _Updated value)?  updated,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Success() when success != null:
return success(_that);case _Updated() when updated != null:
return updated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( bool isSaved)?  success,TResult Function( bool isSaved)?  updated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Success() when success != null:
return success(_that.isSaved);case _Updated() when updated != null:
return updated(_that.isSaved);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( bool isSaved)  success,required TResult Function( bool isSaved)  updated,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Success():
return success(_that.isSaved);case _Updated():
return updated(_that.isSaved);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( bool isSaved)?  success,TResult? Function( bool isSaved)?  updated,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Success() when success != null:
return success(_that.isSaved);case _Updated() when updated != null:
return updated(_that.isSaved);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements SavedStatusState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SavedStatusState.initial()';
}


}




/// @nodoc


class _Success implements SavedStatusState {
  const _Success({required this.isSaved});
  

 final  bool isSaved;

/// Create a copy of SavedStatusState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.isSaved, isSaved) || other.isSaved == isSaved));
}


@override
int get hashCode => Object.hash(runtimeType,isSaved);

@override
String toString() {
  return 'SavedStatusState.success(isSaved: $isSaved)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $SavedStatusStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 bool isSaved
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of SavedStatusState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isSaved = null,}) {
  return _then(_Success(
isSaved: null == isSaved ? _self.isSaved : isSaved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _Updated implements SavedStatusState {
  const _Updated({required this.isSaved});
  

 final  bool isSaved;

/// Create a copy of SavedStatusState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatedCopyWith<_Updated> get copyWith => __$UpdatedCopyWithImpl<_Updated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Updated&&(identical(other.isSaved, isSaved) || other.isSaved == isSaved));
}


@override
int get hashCode => Object.hash(runtimeType,isSaved);

@override
String toString() {
  return 'SavedStatusState.updated(isSaved: $isSaved)';
}


}

/// @nodoc
abstract mixin class _$UpdatedCopyWith<$Res> implements $SavedStatusStateCopyWith<$Res> {
  factory _$UpdatedCopyWith(_Updated value, $Res Function(_Updated) _then) = __$UpdatedCopyWithImpl;
@useResult
$Res call({
 bool isSaved
});




}
/// @nodoc
class __$UpdatedCopyWithImpl<$Res>
    implements _$UpdatedCopyWith<$Res> {
  __$UpdatedCopyWithImpl(this._self, this._then);

  final _Updated _self;
  final $Res Function(_Updated) _then;

/// Create a copy of SavedStatusState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isSaved = null,}) {
  return _then(_Updated(
isSaved: null == isSaved ? _self.isSaved : isSaved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
