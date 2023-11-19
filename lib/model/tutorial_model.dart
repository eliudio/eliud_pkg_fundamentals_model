/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 tutorial_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:collection/collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/model_base.dart';

import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_fundamentals_model/model/model_export.dart';
import 'package:eliud_pkg_fundamentals_model/model/entity_export.dart';

import 'package:eliud_pkg_fundamentals_model/model/tutorial_entity.dart';

class TutorialModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_fundamentals_model';
  static const String id = 'tutorials';

  @override
  String documentID;
  @override
  String appId;
  String? name;
  String? title;
  String? description;
  List<TutorialEntryModel>? tutorialEntries;
  StorageConditionsModel? conditions;

  TutorialModel({
    required this.documentID,
    required this.appId,
    this.name,
    this.title,
    this.description,
    this.tutorialEntries,
    this.conditions,
  });

  @override
  TutorialModel copyWith({
    String? documentID,
    String? appId,
    String? name,
    String? title,
    String? description,
    List<TutorialEntryModel>? tutorialEntries,
    StorageConditionsModel? conditions,
  }) {
    return TutorialModel(
      documentID: documentID ?? this.documentID,
      appId: appId ?? this.appId,
      name: name ?? this.name,
      title: title ?? this.title,
      description: description ?? this.description,
      tutorialEntries: tutorialEntries ?? this.tutorialEntries,
      conditions: conditions ?? this.conditions,
    );
  }

  @override
  int get hashCode =>
      documentID.hashCode ^
      appId.hashCode ^
      name.hashCode ^
      title.hashCode ^
      description.hashCode ^
      tutorialEntries.hashCode ^
      conditions.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TutorialModel &&
          runtimeType == other.runtimeType &&
          documentID == other.documentID &&
          appId == other.appId &&
          name == other.name &&
          title == other.title &&
          description == other.description &&
          ListEquality().equals(tutorialEntries, other.tutorialEntries) &&
          conditions == other.conditions;

  @override
  String toString() {
    String tutorialEntriesCsv =
        (tutorialEntries == null) ? '' : tutorialEntries!.join(', ');

    return 'TutorialModel{documentID: $documentID, appId: $appId, name: $name, title: $title, description: $description, tutorialEntries: TutorialEntry[] { $tutorialEntriesCsv }, conditions: $conditions}';
  }

  @override
  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (tutorialEntries != null) {
      for (var item in tutorialEntries!) {
        referencesCollector.addAll(await item.collectReferences(appId: appId));
      }
    }
    if (conditions != null) {
      referencesCollector
          .addAll(await conditions!.collectReferences(appId: appId));
    }
    return referencesCollector;
  }

  @override
  TutorialEntity toEntity({String? appId}) {
    return TutorialEntity(
      appId: appId,
      name: (name != null) ? name : null,
      title: (title != null) ? title : null,
      description: (description != null) ? description : null,
      tutorialEntries: (tutorialEntries != null)
          ? tutorialEntries!.map((item) => item.toEntity(appId: appId)).toList()
          : null,
      conditions:
          (conditions != null) ? conditions!.toEntity(appId: appId) : null,
    );
  }

  static Future<TutorialModel?> fromEntity(
      String documentID, TutorialEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return TutorialModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      name: entity.name,
      title: entity.title,
      description: entity.description,
      tutorialEntries: entity.tutorialEntries == null
          ? null
          : List<TutorialEntryModel>.from(
              await Future.wait(entity.tutorialEntries!.map((item) {
              counter++;
              return TutorialEntryModel.fromEntity(counter.toString(), item);
            }).toList())),
      conditions: await StorageConditionsModel.fromEntity(entity.conditions),
    );
  }

  static Future<TutorialModel?> fromEntityPlus(
      String documentID, TutorialEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    var counter = 0;
    return TutorialModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      name: entity.name,
      title: entity.title,
      description: entity.description,
      tutorialEntries: entity.tutorialEntries == null
          ? null
          : List<TutorialEntryModel>.from(
              await Future.wait(entity.tutorialEntries!.map((item) {
              counter++;
              return TutorialEntryModel.fromEntityPlus(counter.toString(), item,
                  appId: appId);
            }).toList())),
      conditions: await StorageConditionsModel.fromEntityPlus(entity.conditions,
          appId: appId),
    );
  }
}
