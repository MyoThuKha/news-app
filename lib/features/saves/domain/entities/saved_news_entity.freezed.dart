// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_news_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SavedNewsEntity {

 NewsEntity get news; DateTime get savedAt;
/// Create a copy of SavedNewsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedNewsEntityCopyWith<SavedNewsEntity> get copyWith => _$SavedNewsEntityCopyWithImpl<SavedNewsEntity>(this as SavedNewsEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedNewsEntity&&(identical(other.news, news) || other.news == news)&&(identical(other.savedAt, savedAt) || other.savedAt == savedAt));
}


@override
int get hashCode => Object.hash(runtimeType,news,savedAt);

@override
String toString() {
  return 'SavedNewsEntity(news: $news, savedAt: $savedAt)';
}


}

/// @nodoc
abstract mixin class $SavedNewsEntityCopyWith<$Res>  {
  factory $SavedNewsEntityCopyWith(SavedNewsEntity value, $Res Function(SavedNewsEntity) _then) = _$SavedNewsEntityCopyWithImpl;
@useResult
$Res call({
 NewsEntity news, DateTime savedAt
});


$NewsEntityCopyWith<$Res> get news;

}
/// @nodoc
class _$SavedNewsEntityCopyWithImpl<$Res>
    implements $SavedNewsEntityCopyWith<$Res> {
  _$SavedNewsEntityCopyWithImpl(this._self, this._then);

  final SavedNewsEntity _self;
  final $Res Function(SavedNewsEntity) _then;

/// Create a copy of SavedNewsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? news = null,Object? savedAt = null,}) {
  return _then(_self.copyWith(
news: null == news ? _self.news : news // ignore: cast_nullable_to_non_nullable
as NewsEntity,savedAt: null == savedAt ? _self.savedAt : savedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of SavedNewsEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NewsEntityCopyWith<$Res> get news {
  
  return $NewsEntityCopyWith<$Res>(_self.news, (value) {
    return _then(_self.copyWith(news: value));
  });
}
}


/// Adds pattern-matching-related methods to [SavedNewsEntity].
extension SavedNewsEntityPatterns on SavedNewsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavedNewsEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavedNewsEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavedNewsEntity value)  $default,){
final _that = this;
switch (_that) {
case _SavedNewsEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavedNewsEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SavedNewsEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( NewsEntity news,  DateTime savedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavedNewsEntity() when $default != null:
return $default(_that.news,_that.savedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( NewsEntity news,  DateTime savedAt)  $default,) {final _that = this;
switch (_that) {
case _SavedNewsEntity():
return $default(_that.news,_that.savedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( NewsEntity news,  DateTime savedAt)?  $default,) {final _that = this;
switch (_that) {
case _SavedNewsEntity() when $default != null:
return $default(_that.news,_that.savedAt);case _:
  return null;

}
}

}

/// @nodoc


class _SavedNewsEntity implements SavedNewsEntity {
  const _SavedNewsEntity({required this.news, required this.savedAt});
  

@override final  NewsEntity news;
@override final  DateTime savedAt;

/// Create a copy of SavedNewsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavedNewsEntityCopyWith<_SavedNewsEntity> get copyWith => __$SavedNewsEntityCopyWithImpl<_SavedNewsEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavedNewsEntity&&(identical(other.news, news) || other.news == news)&&(identical(other.savedAt, savedAt) || other.savedAt == savedAt));
}


@override
int get hashCode => Object.hash(runtimeType,news,savedAt);

@override
String toString() {
  return 'SavedNewsEntity(news: $news, savedAt: $savedAt)';
}


}

/// @nodoc
abstract mixin class _$SavedNewsEntityCopyWith<$Res> implements $SavedNewsEntityCopyWith<$Res> {
  factory _$SavedNewsEntityCopyWith(_SavedNewsEntity value, $Res Function(_SavedNewsEntity) _then) = __$SavedNewsEntityCopyWithImpl;
@override @useResult
$Res call({
 NewsEntity news, DateTime savedAt
});


@override $NewsEntityCopyWith<$Res> get news;

}
/// @nodoc
class __$SavedNewsEntityCopyWithImpl<$Res>
    implements _$SavedNewsEntityCopyWith<$Res> {
  __$SavedNewsEntityCopyWithImpl(this._self, this._then);

  final _SavedNewsEntity _self;
  final $Res Function(_SavedNewsEntity) _then;

/// Create a copy of SavedNewsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? news = null,Object? savedAt = null,}) {
  return _then(_SavedNewsEntity(
news: null == news ? _self.news : news // ignore: cast_nullable_to_non_nullable
as NewsEntity,savedAt: null == savedAt ? _self.savedAt : savedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of SavedNewsEntity
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
