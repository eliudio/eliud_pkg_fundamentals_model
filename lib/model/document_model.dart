/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 document_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:collection/collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core_helpers/base/model_base.dart';

import 'package:eliud_core_main/model/model_export.dart';
import 'package:eliud_pkg_fundamentals_model/model/model_export.dart';
import 'package:eliud_pkg_fundamentals_model/model/entity_export.dart';

import 'package:eliud_pkg_fundamentals_model/model/document_entity.dart';

class DocumentModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_fundamentals_model';
  static const String id = 'documents';

  @override
  String documentID;
  @override
  String appId;
  String? description;

  // Document content
  String? content;

  // Left, right, top and bottom padding.
  double? padding;
  List<DocumentItemModel>? images;
  BackgroundModel? background;
  StorageConditionsModel? conditions;

  DocumentModel({
    required this.documentID,
    required this.appId,
    this.description,
    this.content,
    this.padding,
    this.images,
    this.background,
    this.conditions,
  });

  @override
  DocumentModel copyWith({
    String? documentID,
    String? appId,
    String? description,
    String? content,
    double? padding,
    List<DocumentItemModel>? images,
    BackgroundModel? background,
    StorageConditionsModel? conditions,
  }) {
    return DocumentModel(
      documentID: documentID ?? this.documentID,
      appId: appId ?? this.appId,
      description: description ?? this.description,
      content: content ?? this.content,
      padding: padding ?? this.padding,
      images: images ?? this.images,
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
      padding.hashCode ^
      images.hashCode ^
      background.hashCode ^
      conditions.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DocumentModel &&
          runtimeType == other.runtimeType &&
          documentID == other.documentID &&
          appId == other.appId &&
          description == other.description &&
          content == other.content &&
          padding == other.padding &&
          ListEquality().equals(images, other.images) &&
          background == other.background &&
          conditions == other.conditions;

  @override
  String toString() {
    String imagesCsv = (images == null) ? '' : images!.join(', ');

    return 'DocumentModel{documentID: $documentID, appId: $appId, description: $description, content: $content, padding: $padding, images: DocumentItem[] { $imagesCsv }, background: $background, conditions: $conditions}';
  }

  @override
  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (images != null) {
      for (var item in images!) {
        referencesCollector.addAll(await item.collectReferences(appId: appId));
      }
    }
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
  DocumentEntity toEntity({String? appId}) {
    return DocumentEntity(
      appId: appId,
      description: (description != null) ? description : null,
      content: (content != null) ? content : null,
      padding: (padding != null) ? padding : null,
      images: (images != null)
          ? images!.map((item) => item.toEntity(appId: appId)).toList()
          : null,
      background:
          (background != null) ? background!.toEntity(appId: appId) : null,
      conditions:
          (conditions != null) ? conditions!.toEntity(appId: appId) : null,
    );
  }

  static Future<DocumentModel?> fromEntity(
      String documentID, DocumentEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return DocumentModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      description: entity.description,
      content: entity.content,
      padding: entity.padding,
      images: entity.images == null
          ? null
          : List<DocumentItemModel>.from(
              await Future.wait(entity.images!.map((item) {
              counter++;
              return DocumentItemModel.fromEntity(counter.toString(), item);
            }).toList())),
      background: await BackgroundModel.fromEntity(entity.background),
      conditions: await StorageConditionsModel.fromEntity(entity.conditions),
    );
  }

  static Future<DocumentModel?> fromEntityPlus(
      String documentID, DocumentEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    var counter = 0;
    return DocumentModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      description: entity.description,
      content: entity.content,
      padding: entity.padding,
      images: entity.images == null
          ? null
          : List<DocumentItemModel>.from(
              await Future.wait(entity.images!.map((item) {
              counter++;
              return DocumentItemModel.fromEntityPlus(counter.toString(), item,
                  appId: appId);
            }).toList())),
      background:
          await BackgroundModel.fromEntityPlus(entity.background, appId: appId),
      conditions: await StorageConditionsModel.fromEntityPlus(entity.conditions,
          appId: appId),
    );
  }
}
