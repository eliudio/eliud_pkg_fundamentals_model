/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 document_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core_helpers/base/entity_base.dart';
import 'package:eliud_core_main/model/entity_export.dart';
import 'package:eliud_pkg_fundamentals_model/model/entity_export.dart';

class DocumentEntity implements EntityBase {
  final String? appId;
  final String? description;
  final String? content;
  final double? padding;
  final List<DocumentItemEntity>? images;
  final BackgroundEntity? background;
  final StorageConditionsEntity? conditions;

  DocumentEntity({
    required this.appId,
    this.description,
    this.content,
    this.padding,
    this.images,
    this.background,
    this.conditions,
  });

  DocumentEntity copyWith({
    String? documentID,
    String? appId,
    String? description,
    String? content,
    double? padding,
    List<DocumentItemEntity>? images,
    BackgroundEntity? background,
    StorageConditionsEntity? conditions,
  }) {
    return DocumentEntity(
      appId: appId ?? this.appId,
      description: description ?? this.description,
      content: content ?? this.content,
      padding: padding ?? this.padding,
      images: images ?? this.images,
      background: background ?? this.background,
      conditions: conditions ?? this.conditions,
    );
  }

  List<Object?> get props => [
        appId,
        description,
        content,
        padding,
        images,
        background,
        conditions,
      ];

  @override
  String toString() {
    String imagesCsv = (images == null) ? '' : images!.join(', ');

    return 'DocumentEntity{appId: $appId, description: $description, content: $content, padding: $padding, images: DocumentItem[] { $imagesCsv }, background: $background, conditions: $conditions}';
  }

  static DocumentEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var imagesFromMap = map['images'];
    List<DocumentItemEntity> imagesList;
    if (imagesFromMap != null) {
      imagesList = (map['images'] as List<dynamic>)
          .map((dynamic item) => DocumentItemEntity.fromMap(item as Map,
              newDocumentIds: newDocumentIds)!)
          .toList();
    } else {
      imagesList = [];
    }
    var backgroundFromMap = map['background'];
    if (backgroundFromMap != null) {
      backgroundFromMap = BackgroundEntity.fromMap(backgroundFromMap,
          newDocumentIds: newDocumentIds);
    }
    var conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null) {
      conditionsFromMap = StorageConditionsEntity.fromMap(conditionsFromMap,
          newDocumentIds: newDocumentIds);
    }

    return DocumentEntity(
      appId: map['appId'],
      description: map['description'],
      content: map['content'],
      padding: double.tryParse(map['padding'].toString()),
      images: imagesList,
      background: backgroundFromMap,
      conditions: conditionsFromMap,
    );
  }

  @override
  Map<String, Object?> toDocument() {
    final List<Map<String?, dynamic>>? imagesListMap = images != null
        ? images!.map((item) => item.toDocument()).toList()
        : null;
    final Map<String, dynamic>? backgroundMap =
        background != null ? background!.toDocument() : null;
    final Map<String, dynamic>? conditionsMap =
        conditions != null ? conditions!.toDocument() : null;

    Map<String, Object?> theDocument = HashMap();
    if (appId != null) {
      theDocument["appId"] = appId;
    } else {
      theDocument["appId"] = null;
    }
    if (description != null) {
      theDocument["description"] = description;
    } else {
      theDocument["description"] = null;
    }
    if (content != null) {
      theDocument["content"] = content;
    } else {
      theDocument["content"] = null;
    }
    if (padding != null) {
      theDocument["padding"] = padding;
    } else {
      theDocument["padding"] = null;
    }
    if (images != null) {
      theDocument["images"] = imagesListMap;
    } else {
      theDocument["images"] = null;
    }
    if (background != null) {
      theDocument["background"] = backgroundMap;
    } else {
      theDocument["background"] = null;
    }
    if (conditions != null) {
      theDocument["conditions"] = conditionsMap;
    } else {
      theDocument["conditions"] = null;
    }
    return theDocument;
  }

  @override
  DocumentEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static DocumentEntity? fromJsonString(String json,
      {Map<String, String>? newDocumentIds}) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap, newDocumentIds: newDocumentIds);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

  @override
  Future<Map<String, Object?>> enrichedDocument(
      Map<String, Object?> theDocument) async {
    return theDocument;
  }
}
