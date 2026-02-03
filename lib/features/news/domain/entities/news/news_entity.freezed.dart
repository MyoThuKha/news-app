// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NewsEntity {

 SourceEntity get source; String get author; String get title; String get description; String get url; String get urlToImage; String get publishedAt; String get content;
/// Create a copy of NewsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewsEntityCopyWith<NewsEntity> get copyWith => _$NewsEntityCopyWithImpl<NewsEntity>(this as NewsEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewsEntity&&(identical(other.source, source) || other.source == source)&&(identical(other.author, author) || other.author == author)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.url, url) || other.url == url)&&(identical(other.urlToImage, urlToImage) || other.urlToImage == urlToImage)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.content, content) || other.content == content));
}


@override
int get hashCode => Object.hash(runtimeType,source,author,title,description,url,urlToImage,publishedAt,content);

@override
String toString() {
  return 'NewsEntity(source: $source, author: $author, title: $title, description: $description, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt, content: $content)';
}


}

/// @nodoc
abstract mixin class $NewsEntityCopyWith<$Res>  {
  factory $NewsEntityCopyWith(NewsEntity value, $Res Function(NewsEntity) _then) = _$NewsEntityCopyWithImpl;
@useResult
$Res call({
 SourceEntity source, String author, String title, String description, String url, String urlToImage, String publishedAt, String content
});


$SourceEntityCopyWith<$Res> get source;

}
/// @nodoc
class _$NewsEntityCopyWithImpl<$Res>
    implements $NewsEntityCopyWith<$Res> {
  _$NewsEntityCopyWithImpl(this._self, this._then);

  final NewsEntity _self;
  final $Res Function(NewsEntity) _then;

/// Create a copy of NewsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? source = null,Object? author = null,Object? title = null,Object? description = null,Object? url = null,Object? urlToImage = null,Object? publishedAt = null,Object? content = null,}) {
  return _then(_self.copyWith(
source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as SourceEntity,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,urlToImage: null == urlToImage ? _self.urlToImage : urlToImage // ignore: cast_nullable_to_non_nullable
as String,publishedAt: null == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of NewsEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SourceEntityCopyWith<$Res> get source {
  
  return $SourceEntityCopyWith<$Res>(_self.source, (value) {
    return _then(_self.copyWith(source: value));
  });
}
}


/// Adds pattern-matching-related methods to [NewsEntity].
extension NewsEntityPatterns on NewsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewsEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewsEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewsEntity value)  $default,){
final _that = this;
switch (_that) {
case _NewsEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewsEntity value)?  $default,){
final _that = this;
switch (_that) {
case _NewsEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SourceEntity source,  String author,  String title,  String description,  String url,  String urlToImage,  String publishedAt,  String content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewsEntity() when $default != null:
return $default(_that.source,_that.author,_that.title,_that.description,_that.url,_that.urlToImage,_that.publishedAt,_that.content);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SourceEntity source,  String author,  String title,  String description,  String url,  String urlToImage,  String publishedAt,  String content)  $default,) {final _that = this;
switch (_that) {
case _NewsEntity():
return $default(_that.source,_that.author,_that.title,_that.description,_that.url,_that.urlToImage,_that.publishedAt,_that.content);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SourceEntity source,  String author,  String title,  String description,  String url,  String urlToImage,  String publishedAt,  String content)?  $default,) {final _that = this;
switch (_that) {
case _NewsEntity() when $default != null:
return $default(_that.source,_that.author,_that.title,_that.description,_that.url,_that.urlToImage,_that.publishedAt,_that.content);case _:
  return null;

}
}

}

/// @nodoc


class _NewsEntity implements NewsEntity {
  const _NewsEntity({required this.source, required this.author, required this.title, required this.description, required this.url, required this.urlToImage, required this.publishedAt, required this.content});
  

@override final  SourceEntity source;
@override final  String author;
@override final  String title;
@override final  String description;
@override final  String url;
@override final  String urlToImage;
@override final  String publishedAt;
@override final  String content;

/// Create a copy of NewsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewsEntityCopyWith<_NewsEntity> get copyWith => __$NewsEntityCopyWithImpl<_NewsEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewsEntity&&(identical(other.source, source) || other.source == source)&&(identical(other.author, author) || other.author == author)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.url, url) || other.url == url)&&(identical(other.urlToImage, urlToImage) || other.urlToImage == urlToImage)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.content, content) || other.content == content));
}


@override
int get hashCode => Object.hash(runtimeType,source,author,title,description,url,urlToImage,publishedAt,content);

@override
String toString() {
  return 'NewsEntity(source: $source, author: $author, title: $title, description: $description, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt, content: $content)';
}


}

/// @nodoc
abstract mixin class _$NewsEntityCopyWith<$Res> implements $NewsEntityCopyWith<$Res> {
  factory _$NewsEntityCopyWith(_NewsEntity value, $Res Function(_NewsEntity) _then) = __$NewsEntityCopyWithImpl;
@override @useResult
$Res call({
 SourceEntity source, String author, String title, String description, String url, String urlToImage, String publishedAt, String content
});


@override $SourceEntityCopyWith<$Res> get source;

}
/// @nodoc
class __$NewsEntityCopyWithImpl<$Res>
    implements _$NewsEntityCopyWith<$Res> {
  __$NewsEntityCopyWithImpl(this._self, this._then);

  final _NewsEntity _self;
  final $Res Function(_NewsEntity) _then;

/// Create a copy of NewsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? source = null,Object? author = null,Object? title = null,Object? description = null,Object? url = null,Object? urlToImage = null,Object? publishedAt = null,Object? content = null,}) {
  return _then(_NewsEntity(
source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as SourceEntity,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,urlToImage: null == urlToImage ? _self.urlToImage : urlToImage // ignore: cast_nullable_to_non_nullable
as String,publishedAt: null == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of NewsEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SourceEntityCopyWith<$Res> get source {
  
  return $SourceEntityCopyWith<$Res>(_self.source, (value) {
    return _then(_self.copyWith(source: value));
  });
}
}

// dart format on
