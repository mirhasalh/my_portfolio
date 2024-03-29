// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Project _$ProjectFromJson(Map<String, dynamic> json) {
  return _Project.fromJson(json);
}

/// @nodoc
mixin _$Project {
  int get id => throw _privateConstructorUsedError;
  int get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get init => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get desc => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  bool get vertical => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;
  @JsonKey(name: 'tech_stack')
  String get techStack => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectCopyWith<Project> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectCopyWith<$Res> {
  factory $ProjectCopyWith(Project value, $Res Function(Project) then) =
      _$ProjectCopyWithImpl<$Res, Project>;
  @useResult
  $Res call(
      {int id,
      int type,
      String title,
      String init,
      String status,
      String desc,
      String image,
      bool vertical,
      String source,
      @JsonKey(name: 'tech_stack') String techStack});
}

/// @nodoc
class _$ProjectCopyWithImpl<$Res, $Val extends Project>
    implements $ProjectCopyWith<$Res> {
  _$ProjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? init = null,
    Object? status = null,
    Object? desc = null,
    Object? image = null,
    Object? vertical = null,
    Object? source = null,
    Object? techStack = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      init: null == init
          ? _value.init
          : init // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      vertical: null == vertical
          ? _value.vertical
          : vertical // ignore: cast_nullable_to_non_nullable
              as bool,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      techStack: null == techStack
          ? _value.techStack
          : techStack // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectImplCopyWith<$Res> implements $ProjectCopyWith<$Res> {
  factory _$$ProjectImplCopyWith(
          _$ProjectImpl value, $Res Function(_$ProjectImpl) then) =
      __$$ProjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int type,
      String title,
      String init,
      String status,
      String desc,
      String image,
      bool vertical,
      String source,
      @JsonKey(name: 'tech_stack') String techStack});
}

/// @nodoc
class __$$ProjectImplCopyWithImpl<$Res>
    extends _$ProjectCopyWithImpl<$Res, _$ProjectImpl>
    implements _$$ProjectImplCopyWith<$Res> {
  __$$ProjectImplCopyWithImpl(
      _$ProjectImpl _value, $Res Function(_$ProjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? init = null,
    Object? status = null,
    Object? desc = null,
    Object? image = null,
    Object? vertical = null,
    Object? source = null,
    Object? techStack = null,
  }) {
    return _then(_$ProjectImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      init: null == init
          ? _value.init
          : init // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      vertical: null == vertical
          ? _value.vertical
          : vertical // ignore: cast_nullable_to_non_nullable
              as bool,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      techStack: null == techStack
          ? _value.techStack
          : techStack // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectImpl implements _Project {
  const _$ProjectImpl(
      {required this.id,
      required this.type,
      required this.title,
      required this.init,
      required this.status,
      required this.desc,
      required this.image,
      required this.vertical,
      required this.source,
      @JsonKey(name: 'tech_stack') required this.techStack});

  factory _$ProjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectImplFromJson(json);

  @override
  final int id;
  @override
  final int type;
  @override
  final String title;
  @override
  final String init;
  @override
  final String status;
  @override
  final String desc;
  @override
  final String image;
  @override
  final bool vertical;
  @override
  final String source;
  @override
  @JsonKey(name: 'tech_stack')
  final String techStack;

  @override
  String toString() {
    return 'Project(id: $id, type: $type, title: $title, init: $init, status: $status, desc: $desc, image: $image, vertical: $vertical, source: $source, techStack: $techStack)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.init, init) || other.init == init) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.vertical, vertical) ||
                other.vertical == vertical) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.techStack, techStack) ||
                other.techStack == techStack));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, title, init, status,
      desc, image, vertical, source, techStack);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectImplCopyWith<_$ProjectImpl> get copyWith =>
      __$$ProjectImplCopyWithImpl<_$ProjectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectImplToJson(
      this,
    );
  }
}

abstract class _Project implements Project {
  const factory _Project(
          {required final int id,
          required final int type,
          required final String title,
          required final String init,
          required final String status,
          required final String desc,
          required final String image,
          required final bool vertical,
          required final String source,
          @JsonKey(name: 'tech_stack') required final String techStack}) =
      _$ProjectImpl;

  factory _Project.fromJson(Map<String, dynamic> json) = _$ProjectImpl.fromJson;

  @override
  int get id;
  @override
  int get type;
  @override
  String get title;
  @override
  String get init;
  @override
  String get status;
  @override
  String get desc;
  @override
  String get image;
  @override
  bool get vertical;
  @override
  String get source;
  @override
  @JsonKey(name: 'tech_stack')
  String get techStack;
  @override
  @JsonKey(ignore: true)
  _$$ProjectImplCopyWith<_$ProjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
