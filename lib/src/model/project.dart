import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
class Project with _$Project {
  const factory Project({
    required int id,
    required int type,
    required String title,
    required String init,
    required String status,
    required String desc,
    required String image,
    required bool vertical,
    required String source,
    @JsonKey(name: 'tech_stack') required String techStack,
  }) = _Project;

  factory Project.fromJson(Map<String, Object?> json) =>
      _$ProjectFromJson(json);
}
