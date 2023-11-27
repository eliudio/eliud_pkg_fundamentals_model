/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 simple_image_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_helpers/base/model_base.dart';

import 'package:eliud_core_main/model/abstract_repository_singleton.dart';
import 'package:eliud_core_main/model/model_export.dart';
import 'package:eliud_pkg_fundamentals_model/model/entity_export.dart';

import 'package:eliud_pkg_fundamentals_model/model/simple_image_entity.dart';

class SimpleImageModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_fundamentals_model';
  static const String id = 'simpleImages';

  @override
  String documentID;
  @override
  String appId;
  String? description;
  PlatformMediumModel? image;
  StorageConditionsModel? conditions;

  SimpleImageModel({
    required this.documentID,
    required this.appId,
    this.description,
    this.image,
    this.conditions,
  });

  @override
  SimpleImageModel copyWith({
    String? documentID,
    String? appId,
    String? description,
    PlatformMediumModel? image,
    StorageConditionsModel? conditions,
  }) {
    return SimpleImageModel(
      documentID: documentID ?? this.documentID,
      appId: appId ?? this.appId,
      description: description ?? this.description,
      image: image ?? this.image,
      conditions: conditions ?? this.conditions,
    );
  }

  @override
  int get hashCode =>
      documentID.hashCode ^
      appId.hashCode ^
      description.hashCode ^
      image.hashCode ^
      conditions.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SimpleImageModel &&
          runtimeType == other.runtimeType &&
          documentID == other.documentID &&
          appId == other.appId &&
          description == other.description &&
          image == other.image &&
          conditions == other.conditions;

  @override
  String toString() {
    return 'SimpleImageModel{documentID: $documentID, appId: $appId, description: $description, image: $image, conditions: $conditions}';
  }

  @override
  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (image != null) {
      referencesCollector.add(ModelReference(
          PlatformMediumModel.packageName, PlatformMediumModel.id, image!));
    }
    if (image != null) {
      referencesCollector.addAll(await image!.collectReferences(appId: appId));
    }
    if (conditions != null) {
      referencesCollector
          .addAll(await conditions!.collectReferences(appId: appId));
    }
    return referencesCollector;
  }

  @override
  SimpleImageEntity toEntity({String? appId}) {
    return SimpleImageEntity(
      appId: appId,
      description: (description != null) ? description : null,
      imageId: (image != null) ? image!.documentID : null,
      conditions:
          (conditions != null) ? conditions!.toEntity(appId: appId) : null,
    );
  }

  static Future<SimpleImageModel?> fromEntity(
      String documentID, SimpleImageEntity? entity) async {
    if (entity == null) return null;
    return SimpleImageModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      description: entity.description,
      conditions: await StorageConditionsModel.fromEntity(entity.conditions),
    );
  }

  static Future<SimpleImageModel?> fromEntityPlus(
      String documentID, SimpleImageEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    PlatformMediumModel? imageHolder;
    if (entity.imageId != null) {
      try {
        imageHolder =
            await platformMediumRepository(appId: appId)!.get(entity.imageId);
      } on Exception catch (e) {
        print('Error whilst trying to initialise image');
        print(
            'Error whilst retrieving platformMedium with id ${entity.imageId}');
        print('Exception: $e');
      }
    }

    return SimpleImageModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      description: entity.description,
      image: imageHolder,
      conditions: await StorageConditionsModel.fromEntityPlus(entity.conditions,
          appId: appId),
    );
  }
}
