/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dynamic_widget_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_helpers/base/model_base.dart';

import 'package:eliud_core_main/model/model_export.dart';
import 'package:eliud_pkg_fundamentals_model/model/entity_export.dart';

import 'package:eliud_pkg_fundamentals_model/model/dynamic_widget_entity.dart';

class DynamicWidgetModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_fundamentals_model';
  static const String id = 'dynamicWidgets';

  @override
  String documentID;
  @override
  String appId;
  String? description;

  // Document content
  String? content;
  BackgroundModel? background;
  StorageConditionsModel? conditions;

  DynamicWidgetModel({
    required this.documentID,
    required this.appId,
    this.description,
    this.content,
    this.background,
    this.conditions,
  });

  @override
  DynamicWidgetModel copyWith({
    String? documentID,
    String? appId,
    String? description,
    String? content,
    BackgroundModel? background,
    StorageConditionsModel? conditions,
  }) {
    return DynamicWidgetModel(
      documentID: documentID ?? this.documentID,
      appId: appId ?? this.appId,
      description: description ?? this.description,
      content: content ?? this.content,
      background: background ?? this.background,
      conditions: conditions ?? this.conditions,
    );
  }

  @override
  int get hashCode =>
      documentID.hashCode ^
      appId.hashCode ^
      description.hashCode ^
      content.hashCode ^
      background.hashCode ^
      conditions.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DynamicWidgetModel &&
          runtimeType == other.runtimeType &&
          documentID == other.documentID &&
          appId == other.appId &&
          description == other.description &&
          content == other.content &&
          background == other.background &&
          conditions == other.conditions;

  @override
  String toString() {
    return 'DynamicWidgetModel{documentID: $documentID, appId: $appId, description: $description, content: $content, background: $background, conditions: $conditions}';
  }

  @override
  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (background != null) {
      referencesCollector
          .addAll(await background!.collectReferences(appId: appId));
    }
    if (conditions != null) {
      referencesCollector
          .addAll(await conditions!.collectReferences(appId: appId));
    }
    return referencesCollector;
  }

  @override
  DynamicWidgetEntity toEntity({String? appId}) {
    return DynamicWidgetEntity(
      appId: appId,
      description: (description != null) ? description : null,
      content: (content != null) ? content : null,
      background:
          (background != null) ? background!.toEntity(appId: appId) : null,
      conditions:
          (conditions != null) ? conditions!.toEntity(appId: appId) : null,
    );
  }

  static Future<DynamicWidgetModel?> fromEntity(
      String documentID, DynamicWidgetEntity? entity) async {
    if (entity == null) return null;
    return DynamicWidgetModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      description: entity.description,
      content: entity.content,
      background: await BackgroundModel.fromEntity(entity.background),
      conditions: await StorageConditionsModel.fromEntity(entity.conditions),
    );
  }

  static Future<DynamicWidgetModel?> fromEntityPlus(
      String documentID, DynamicWidgetEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    return DynamicWidgetModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      description: entity.description,
      content: entity.content,
      background:
          await BackgroundModel.fromEntityPlus(entity.background, appId: appId),
      conditions: await StorageConditionsModel.fromEntityPlus(entity.conditions,
          appId: appId),
    );
  }
}
