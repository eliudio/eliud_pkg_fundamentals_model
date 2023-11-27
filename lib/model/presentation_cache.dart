/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 presentation_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_core_helpers/query/query_tools.dart';
import 'package:eliud_core_helpers/helpers/common_tools.dart';
import 'package:eliud_pkg_fundamentals_model/model/presentation_model.dart';
import 'package:eliud_pkg_fundamentals_model/model/presentation_repository.dart';

import 'package:eliud_core_main/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals_model/model/repository_export.dart';
import 'package:eliud_core_main/model/cache_export.dart';
import 'package:eliud_core_main/model/model_export.dart';
import 'package:eliud_pkg_fundamentals_model/model/model_export.dart';
import 'package:eliud_pkg_fundamentals_model/model/entity_export.dart';

class PresentationCache implements PresentationRepository {
  final PresentationRepository reference;
  final Map<String?, PresentationModel?> fullCache = {};

  PresentationCache(this.reference);

  /// Add a PresentationModel to the repository, cached
  @override
  Future<PresentationModel> add(PresentationModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  /// Add a PresentationEntity to the repository, cached
  @override
  Future<PresentationEntity> addEntity(
      String documentID, PresentationEntity value) {
    return reference.addEntity(documentID, value);
  }

  /// Update a PresentationEntity in the repository, cached
  @override
  Future<PresentationEntity> updateEntity(
      String documentID, PresentationEntity value) {
    return reference.updateEntity(documentID, value);
  }

  /// Delete a PresentationModel from the repository, cached
  @override
  Future<void> delete(PresentationModel value) {
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  /// Retrieve a PresentationModel with it's id, cached
  @override
  Future<PresentationModel?> get(String? id,
      {Function(Exception)? onError}) async {
    var value = fullCache[id];
    if (value != null) return refreshRelations(value);
    value = await reference.get(id, onError: onError);
    fullCache[id] = value;
    return value;
  }

  /// Update a PresentationModel
  @override
  Future<PresentationModel> update(PresentationModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  /// Retrieve list of List<PresentationModel?>
  @override
  Stream<List<PresentationModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return reference.values(
        orderBy: orderBy,
        descending: descending,
        startAfter: startAfter,
        limit: limit,
        setLastDoc: setLastDoc,
        privilegeLevel: privilegeLevel,
        eliudQuery: eliudQuery);
  }

  @override
  Stream<List<PresentationModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return reference.valuesWithDetails(
        orderBy: orderBy,
        descending: descending,
        startAfter: startAfter,
        limit: limit,
        setLastDoc: setLastDoc,
        privilegeLevel: privilegeLevel,
        eliudQuery: eliudQuery);
  }

  @override
  Future<List<PresentationModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) async {
    return await reference.valuesList(
        orderBy: orderBy,
        descending: descending,
        startAfter: startAfter,
        limit: limit,
        setLastDoc: setLastDoc,
        privilegeLevel: privilegeLevel,
        eliudQuery: eliudQuery);
  }

  @override
  Future<List<PresentationModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) async {
    return await reference.valuesListWithDetails(
        orderBy: orderBy,
        descending: descending,
        startAfter: startAfter,
        limit: limit,
        setLastDoc: setLastDoc,
        privilegeLevel: privilegeLevel,
        eliudQuery: eliudQuery);
  }

  @override
  void flush() {
    fullCache.clear();
  }

  @override
  String? timeStampToString(dynamic timeStamp) {
    return reference.timeStampToString(timeStamp);
  }

  @override
  dynamic getSubCollection(String documentId, String name) {
    return reference.getSubCollection(documentId, name);
  }

  @override
  Future<PresentationModel> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    return reference
        .changeValue(documentId, fieldName, changeByThisValue)
        .then((newValue) {
      fullCache[documentId] = newValue;
      return newValue!;
    });
  }

  @override
  Future<PresentationEntity?> getEntity(String? id,
      {Function(Exception p1)? onError}) {
    return reference.getEntity(id, onError: onError);
  }

  @override
  PresentationEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    return reference.fromMap(o, newDocumentIds: newDocumentIds);
  }

  @override
  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<PresentationModel?>> listen(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return reference.listen(trigger,
        orderBy: orderBy,
        descending: descending,
        startAfter: startAfter,
        limit: limit,
        privilegeLevel: privilegeLevel,
        eliudQuery: eliudQuery);
  }

  @override
  StreamSubscription<List<PresentationModel?>> listenWithDetails(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return reference.listenWithDetails(trigger,
        orderBy: orderBy,
        descending: descending,
        startAfter: startAfter,
        limit: limit,
        privilegeLevel: privilegeLevel,
        eliudQuery: eliudQuery);
  }

  @override
  StreamSubscription<PresentationModel?> listenTo(
      String documentId, PresentationChanged changed,
      {PresentationErrorHandler? errorHandler}) {
    return reference.listenTo(documentId, ((value) {
      if (value != null) {
        fullCache[value.documentID] = value;
      }
      changed(value);
    }), errorHandler: errorHandler);
  }

  static Future<PresentationModel> refreshRelations(
      PresentationModel model) async {
    PlatformMediumModel? imageHolder;
    if (model.image != null) {
      try {
        await platformMediumRepository(appId: model.appId)!
            .get(model.image!.documentID)
            .then((val) {
          imageHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    List<BodyComponentModel>? bodyComponentsHolder;
    if (model.bodyComponents != null) {
      bodyComponentsHolder = List<BodyComponentModel>.from(
              await Future.wait(model.bodyComponents!.map((element) async {
        return await BodyComponentCache.refreshRelations(element);
      })))
          .toList();
    }

    return model.copyWith(
      image: imageHolder,
      bodyComponents: bodyComponentsHolder,
    );
  }
}
