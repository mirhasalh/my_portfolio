// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Project _$$_ProjectFromJson(Map<String, dynamic> json) => _$_Project(
      id: json['id'] as int,
      type: json['type'] as int,
      title: json['title'] as String,
      init: json['init'] as String,
      status: json['status'] as String,
      desc: json['desc'] as String,
      image: json['image'] as String,
      vertical: json['vertical'] as bool,
      techStack: json['tech_stack'] as String,
    );

Map<String, dynamic> _$$_ProjectToJson(_$_Project instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'init': instance.init,
      'status': instance.status,
      'desc': instance.desc,
      'image': instance.image,
      'vertical': instance.vertical,
      'tech_stack': instance.techStack,
    };
