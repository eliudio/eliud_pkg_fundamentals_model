/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 presentation_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:collection/collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/model_base.dart';

import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_fundamentals_model/model/entity_export.dart';

import 'package:eliud_pkg_fundamentals_model/model/presentation_entity.dart';

enum PresentationRelativeImagePosition {
  behind,
  inFront,
  below,
  above,
  aside,
  unknown
}

enum PresentationImageAlignment { left, center, right, unknown }

PresentationRelativeImagePosition toPresentationRelativeImagePosition(
    int? index) {
  switch (index) {
    case 0:
      return PresentationRelativeImagePosition.behind;
    case 1:
      return PresentationRelativeImagePosition.inFront;
    case 2:
      return PresentationRelativeImagePosition.below;
    case 3:
      return PresentationRelativeImagePosition.above;
    case 4:
      return PresentationRelativeImagePosition.aside;
  }
  return PresentationRelativeImagePosition.unknown;
}

PresentationImageAlignment toPresentationImageAlignment(int? index) {
  switch (index) {
    case 0:
      return PresentationImageAlignment.left;
    case 1:
      return PresentationImageAlignment.center;
    case 2:
      return PresentationImageAlignment.right;
  }
  return PresentationImageAlignment.unknown;
}

class PresentationModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_fundamentals_model';
  static const String id = 'presentations';

  @override
  String documentID;
  @override
  String appId;
  String? description;
  List<BodyComponentModel>? bodyComponents;
  PlatformMediumModel? image;
  PresentationRelativeImagePosition? imagePositionRelative;
  PresentationImageAlignment? imageAlignment;

  // Width of the image
  double? imageWidth;
  StorageConditionsModel? conditions;

  PresentationModel({
    required this.documentID,
    required this.appId,
    this.description,
    this.bodyComponents,
    this.image,
    this.imagePositionRelative,
    this.imageAlignment,
    this.imageWidth,
    this.conditions,
  });

  @override
  PresentationModel copyWith({
    String? documentID,
    String? appId,
    String? description,
    List<BodyComponentModel>? bodyComponents,
    PlatformMediumModel? image,
    PresentationRelativeImagePosition? imagePositionRelative,
    PresentationImageAlignment? imageAlignment,
    double? imageWidth,
    StorageConditionsModel? conditions,
  }) {
    return PresentationModel(
      documentID: documentID ?? this.documentID,
      appId: appId ?? this.appId,
      description: description ?? this.description,
      bodyComponents: bodyComponents ?? this.bodyComponents,
      image: image ?? this.image,
      imagePositionRelative:
          imagePositionRelative ?? this.imagePositionRelative,
      imageAlignment: imageAlignment ?? this.imageAlignment,
      imageWidth: imageWidth ?? this.imageWidth,
      conditions: conditions ?? this.conditions,
    );
  }

  @override
  int get hashCode =>
      documentID.hashCode ^
      appId.hashCode ^
      description.hashCode ^
      bodyComponents.hashCode ^
      image.hashCode ^
      imagePositionRelative.hashCode ^
      imageAlignment.hashCode ^
      imageWidth.hashCode ^
      conditions.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PresentationModel &&
          runtimeType == other.runtimeType &&
          documentID == other.documentID &&
          appId == other.appId &&
          description == other.description &&
          ListEquality().equals(bodyComponents, other.bodyComponents) &&
          image == other.image &&
          imagePositionRelative == other.imagePositionRelative &&
          imageAlignment == other.imageAlignment &&
          imageWidth == other.imageWidth &&
          conditions == other.conditions;

  @override
  String toString() {
    String bodyComponentsCsv =
        (bodyComponents == null) ? '' : bodyComponents!.join(', ');

    return 'PresentationModel{documentID: $documentID, appId: $appId, description: $description, bodyComponents: BodyComponent[] { $bodyComponentsCsv }, image: $image, imagePositionRelative: $imagePositionRelative, imageAlignment: $imageAlignment, imageWidth: $imageWidth, conditions: $conditions}';
  }

  @override
  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (image != null) {
      referencesCollector.add(ModelReference(
          PlatformMediumModel.packageName, PlatformMediumModel.id, image!));
    }
    if (bodyComponents != null) {
      for (var item in bodyComponents!) {
        referencesCollector.addAll(await item.collectReferences(appId: appId));
      }
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
  PresentationEntity toEntity({String? appId}) {
    return PresentationEntity(
      appId: appId,
      description: (description != null) ? description : null,
      bodyComponents: (bodyComponents != null)
          ? bodyComponents!.map((item) => item.toEntity(appId: appId)).toList()
          : null,
      imageId: (image != null) ? image!.documentID : null,
      imagePositionRelative:
          (imagePositionRelative != null) ? imagePositionRelative!.index : null,
      imageAlignment: (imageAlignment != null) ? imageAlignment!.index : null,
      imageWidth: (imageWidth != null) ? imageWidth : null,
      conditions:
          (conditions != null) ? conditions!.toEntity(appId: appId) : null,
    );
  }

  static Future<PresentationModel?> fromEntity(
      String documentID, PresentationEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return PresentationModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      description: entity.description,
      bodyComponents: entity.bodyComponents == null
          ? null
          : List<BodyComponentModel>.from(
              await Future.wait(entity.bodyComponents!.map((item) {
              counter++;
              return BodyComponentModel.fromEntity(counter.toString(), item);
            }).toList())),
      imagePositionRelative:
          toPresentationRelativeImagePosition(entity.imagePositionRelative),
      imageAlignment: toPresentationImageAlignment(entity.imageAlignment),
      imageWidth: entity.imageWidth,
      conditions: await StorageConditionsModel.fromEntity(entity.conditions),
    );
  }

  static Future<PresentationModel?> fromEntityPlus(
      String documentID, PresentationEntity? entity,
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

    var counter = 0;
    return PresentationModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      description: entity.description,
      bodyComponents: entity.bodyComponents == null
          ? null
          : List<BodyComponentModel>.from(
              await Future.wait(entity.bodyComponents!.map((item) {
              counter++;
              return BodyComponentModel.fromEntityPlus(counter.toString(), item,
                  appId: appId);
            }).toList())),
      image: imageHolder,
      imagePositionRelative:
          toPresentationRelativeImagePosition(entity.imagePositionRelative),
      imageAlignment: toPresentationImageAlignment(entity.imageAlignment),
      imageWidth: entity.imageWidth,
      conditions: await StorageConditionsModel.fromEntityPlus(entity.conditions,
          appId: appId),
    );
  }
}
