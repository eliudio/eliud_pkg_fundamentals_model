/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dynamic_widget_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals_model/model/dynamic_widget_model.dart';

abstract class DynamicWidgetListState extends Equatable {
  const DynamicWidgetListState();

  @override
  List<Object?> get props => [];
}

class DynamicWidgetListLoading extends DynamicWidgetListState {}

class DynamicWidgetListLoaded extends DynamicWidgetListState {
  final List<DynamicWidgetModel?>? values;
  final bool? mightHaveMore;

  const DynamicWidgetListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [values, mightHaveMore];

  @override
  String toString() => 'DynamicWidgetListLoaded { values: $values }';

  @override
  bool operator ==(Object other) =>
      other is DynamicWidgetListLoaded &&
      runtimeType == other.runtimeType &&
      ListEquality().equals(values, other.values) &&
      mightHaveMore == other.mightHaveMore;

  @override
  int get hashCode => values.hashCode ^ mightHaveMore.hashCode;
}

class DynamicWidgetNotLoaded extends DynamicWidgetListState {}
