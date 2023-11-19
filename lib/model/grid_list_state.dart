/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 grid_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals_model/model/grid_model.dart';

abstract class GridListState extends Equatable {
  const GridListState();

  @override
  List<Object?> get props => [];
}

class GridListLoading extends GridListState {}

class GridListLoaded extends GridListState {
  final List<GridModel?>? values;
  final bool? mightHaveMore;

  const GridListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [values, mightHaveMore];

  @override
  String toString() => 'GridListLoaded { values: $values }';

  @override
  bool operator ==(Object other) =>
      other is GridListLoaded &&
      runtimeType == other.runtimeType &&
      ListEquality().equals(values, other.values) &&
      mightHaveMore == other.mightHaveMore;

  @override
  int get hashCode => values.hashCode ^ mightHaveMore.hashCode;
}

class GridNotLoaded extends GridListState {}
