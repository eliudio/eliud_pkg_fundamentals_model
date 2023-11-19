/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 document_item_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core_model/tools/etc/random.dart';
import 'package:eliud_core/core/base/entity_base.dart';

class DocumentItemEntity implements EntityBase {
  final String? reference;
  final String? imageId;

  DocumentItemEntity({
    this.reference,
    this.imageId,
  });

  DocumentItemEntity copyWith({
    String? documentID,
    String? reference,
    String? imageId,
  }) {
    return DocumentItemEntity(
      reference: reference ?? this.reference,
      imageId: imageId ?? this.imageId,
    );
  }

  List<Object?> get props => [
        reference,
        imageId,
      ];

  @override
  String toString() {
    return 'DocumentItemEntity{reference: $reference, imageId: $imageId}';
  }

  static DocumentItemEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var imageIdNewDocmentId = map['imageId'];
    if ((newDocumentIds != null) && (imageIdNewDocmentId != null)) {
      var imageIdOldDocmentId = imageIdNewDocmentId;
      imageIdNewDocmentId = newRandomKey();
      newDocumentIds[imageIdOldDocmentId] = imageIdNewDocmentId;
    }
    return DocumentItemEntity(
      reference: map['reference'],
      imageId: imageIdNewDocmentId,
    );
  }

  @override
  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (reference != null) {
      theDocument["reference"] = reference;
    } else {
      theDocument["reference"] = null;
    }
    if (imageId != null) {
      theDocument["imageId"] = imageId;
    } else {
      theDocument["imageId"] = null;
    }
    return theDocument;
  }

  @override
  DocumentItemEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith();
    return newEntity;
  }

  static DocumentItemEntity? fromJsonString(String json,
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
