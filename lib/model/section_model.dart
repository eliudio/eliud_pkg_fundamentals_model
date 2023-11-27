/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 section_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:collection/collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core_helpers/base/model_base.dart';

import 'package:eliud_core_main/model/abstract_repository_singleton.dart';
import 'package:eliud_core_main/model/model_export.dart';
import 'package:eliud_pkg_fundamentals_model/model/model_export.dart';
import 'package:eliud_pkg_fundamentals_model/model/entity_export.dart';

import 'package:eliud_pkg_fundamentals_model/model/section_entity.dart';

enum RelativeImagePosition { behind, inFront, below, above, aside, unknown }

enum SectionImageAlignment { left, center, right, unknown }

RelativeImagePosition toRelativeImagePosition(int? index) {
  switch (index) {
    case 0:
      return RelativeImagePosition.behind;
    case 1:
      return RelativeImagePosition.inFront;
    case 2:
      return RelativeImagePosition.below;
    case 3:
      return RelativeImagePosition.above;
    case 4:
      return RelativeImagePosition.aside;
  }
  return RelativeImagePosition.unknown;
}

SectionImageAlignment toSectionImageAlignment(int? index) {
  switch (index) {
    case 0:
      return SectionImageAlignment.left;
    case 1:
      return SectionImageAlignment.center;
    case 2:
      return SectionImageAlignment.right;
  }
  return SectionImageAlignment.unknown;
}

class SectionModel implements ModelBase {
  static const String packageName = 'eliud_pkg_fundamentals_model';
  static const String id = 'sections';

  @override
  String documentID;
  String? title;
  String? description;
  PlatformMediumModel? image;
  RelativeImagePosition? imagePositionRelative;
  SectionImageAlignment? imageAlignment;

  // Width of the image
  double? imageWidth;
  List<LinkModel>? links;

  SectionModel({
    required this.documentID,
    this.title,
    this.description,
    this.image,
    this.imagePositionRelative,
    this.imageAlignment,
    this.imageWidth,
    this.links,
  });

  @override
  SectionModel copyWith({
    String? documentID,
    String? title,
    String? description,
    PlatformMediumModel? image,
    RelativeImagePosition? imagePositionRelative,
    SectionImageAlignment? imageAlignment,
    double? imageWidth,
    List<LinkModel>? links,
  }) {
    return SectionModel(
      documentID: documentID ?? this.documentID,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      imagePositionRelative:
          imagePositionRelative ?? this.imagePositionRelative,
      imageAlignment: imageAlignment ?? this.imageAlignment,
      imageWidth: imageWidth ?? this.imageWidth,
      links: links ?? this.links,
    );
  }

  @override
  int get hashCode =>
      documentID.hashCode ^
      title.hashCode ^
      description.hashCode ^
      image.hashCode ^
      imagePositionRelative.hashCode ^
      imageAlignment.hashCode ^
      imageWidth.hashCode ^
      links.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SectionModel &&
          runtimeType == other.runtimeType &&
          documentID == other.documentID &&
          title == other.title &&
          description == other.description &&
          image == other.image &&
          imagePositionRelative == other.imagePositionRelative &&
          imageAlignment == other.imageAlignment &&
          imageWidth == other.imageWidth &&
          ListEquality().equals(links, other.links);

  @override
  String toString() {
    String linksCsv = (links == null) ? '' : links!.join(', ');

    return 'SectionModel{documentID: $documentID, title: $title, description: $description, image: $image, imagePositionRelative: $imagePositionRelative, imageAlignment: $imageAlignment, imageWidth: $imageWidth, links: Link[] { $linksCsv }}';
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
    if (links != null) {
      for (var item in links!) {
        referencesCollector.addAll(await item.collectReferences(appId: appId));
      }
    }
    return referencesCollector;
  }

  @override
  SectionEntity toEntity({String? appId}) {
    return SectionEntity(
      title: (title != null) ? title : null,
      description: (description != null) ? description : null,
      imageId: (image != null) ? image!.documentID : null,
      imagePositionRelative:
          (imagePositionRelative != null) ? imagePositionRelative!.index : null,
      imageAlignment: (imageAlignment != null) ? imageAlignment!.index : null,
      imageWidth: (imageWidth != null) ? imageWidth : null,
      links: (links != null)
          ? links!.map((item) => item.toEntity(appId: appId)).toList()
          : null,
    );
  }

  static Future<SectionModel?> fromEntity(
      String documentID, SectionEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return SectionModel(
      documentID: documentID,
      title: entity.title,
      description: entity.description,
      imagePositionRelative:
          toRelativeImagePosition(entity.imagePositionRelative),
      imageAlignment: toSectionImageAlignment(entity.imageAlignment),
      imageWidth: entity.imageWidth,
      links: entity.links == null
          ? null
          : List<LinkModel>.from(await Future.wait(entity.links!.map((item) {
              counter++;
              return LinkModel.fromEntity(counter.toString(), item);
            }).toList())),
    );
  }

  static Future<SectionModel?> fromEntityPlus(
      String documentID, SectionEntity? entity,
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
    return SectionModel(
      documentID: documentID,
      title: entity.title,
      description: entity.description,
      image: imageHolder,
      imagePositionRelative:
          toRelativeImagePosition(entity.imagePositionRelative),
      imageAlignment: toSectionImageAlignment(entity.imageAlignment),
      imageWidth: entity.imageWidth,
      links: entity.links == null
          ? null
          : List<LinkModel>.from(await Future.wait(entity.links!.map((item) {
              counter++;
              return LinkModel.fromEntityPlus(counter.toString(), item,
                  appId: appId);
            }).toList())),
    );
  }
}
