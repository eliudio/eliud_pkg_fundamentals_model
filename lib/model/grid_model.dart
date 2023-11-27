/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 grid_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:collection/collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core_helpers/base/model_base.dart';

import 'package:eliud_core_main/model/abstract_repository_singleton.dart';
import 'package:eliud_core_main/model/model_export.dart';
import 'package:eliud_pkg_fundamentals_model/model/entity_export.dart';

import 'package:eliud_pkg_fundamentals_model/model/grid_entity.dart';

class GridModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_fundamentals_model';
  static const String id = 'grids';

  @override
  String documentID;
  @override
  String appId;
  String? description;
  List<BodyComponentModel>? bodyComponents;

  // Specific gridview
  GridViewModel? gridView;
  StorageConditionsModel? conditions;

  GridModel({
    required this.documentID,
    required this.appId,
    this.description,
    this.bodyComponents,
    this.gridView,
    this.conditions,
  });

  @override
  GridModel copyWith({
    String? documentID,
    String? appId,
    String? description,
    List<BodyComponentModel>? bodyComponents,
    GridViewModel? gridView,
    StorageConditionsModel? conditions,
  }) {
    return GridModel(
      documentID: documentID ?? this.documentID,
      appId: appId ?? this.appId,
      description: description ?? this.description,
      bodyComponents: bodyComponents ?? this.bodyComponents,
      gridView: gridView ?? this.gridView,
      conditions: conditions ?? this.conditions,
    );
  }

  @override
  int get hashCode =>
      documentID.hashCode ^
      appId.hashCode ^
      description.hashCode ^
      bodyComponents.hashCode ^
      gridView.hashCode ^
      conditions.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GridModel &&
          runtimeType == other.runtimeType &&
          documentID == other.documentID &&
          appId == other.appId &&
          description == other.description &&
          ListEquality().equals(bodyComponents, other.bodyComponents) &&
          gridView == other.gridView &&
          conditions == other.conditions;

  @override
  String toString() {
    String bodyComponentsCsv =
        (bodyComponents == null) ? '' : bodyComponents!.join(', ');

    return 'GridModel{documentID: $documentID, appId: $appId, description: $description, bodyComponents: BodyComponent[] { $bodyComponentsCsv }, gridView: $gridView, conditions: $conditions}';
  }

  @override
  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (gridView != null) {
      referencesCollector.add(ModelReference(
          GridViewModel.packageName, GridViewModel.id, gridView!));
    }
    if (bodyComponents != null) {
      for (var item in bodyComponents!) {
        referencesCollector.addAll(await item.collectReferences(appId: appId));
      }
    }
    if (gridView != null) {
      referencesCollector
          .addAll(await gridView!.collectReferences(appId: appId));
    }
    if (conditions != null) {
      referencesCollector
          .addAll(await conditions!.collectReferences(appId: appId));
    }
    return referencesCollector;
  }

  @override
  GridEntity toEntity({String? appId}) {
    return GridEntity(
      appId: appId,
      description: (description != null) ? description : null,
      bodyComponents: (bodyComponents != null)
          ? bodyComponents!.map((item) => item.toEntity(appId: appId)).toList()
          : null,
      gridViewId: (gridView != null) ? gridView!.documentID : null,
      conditions:
          (conditions != null) ? conditions!.toEntity(appId: appId) : null,
    );
  }

  static Future<GridModel?> fromEntity(
      String documentID, GridEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return GridModel(
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
      conditions: await StorageConditionsModel.fromEntity(entity.conditions),
    );
  }

  static Future<GridModel?> fromEntityPlus(
      String documentID, GridEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    GridViewModel? gridViewHolder;
    if (entity.gridViewId != null) {
      try {
        gridViewHolder =
            await gridViewRepository(appId: appId)!.get(entity.gridViewId);
      } on Exception catch (e) {
        print('Error whilst trying to initialise gridView');
        print('Error whilst retrieving gridView with id ${entity.gridViewId}');
        print('Exception: $e');
      }
    }

    var counter = 0;
    return GridModel(
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
      gridView: gridViewHolder,
      conditions: await StorageConditionsModel.fromEntityPlus(entity.conditions,
          appId: appId),
    );
  }
}
