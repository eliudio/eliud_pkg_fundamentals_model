/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 presentation_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals_model/model/presentation_model.dart';

abstract class PresentationListState extends Equatable {
  const PresentationListState();

  @override
  List<Object?> get props => [];
}

class PresentationListLoading extends PresentationListState {}

class PresentationListLoaded extends PresentationListState {
  final List<PresentationModel?>? values;
  final bool? mightHaveMore;

  const PresentationListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [values, mightHaveMore];

  @override
  String toString() => 'PresentationListLoaded { values: $values }';

  @override
  bool operator ==(Object other) =>
      other is PresentationListLoaded &&
      runtimeType == other.runtimeType &&
      ListEquality().equals(values, other.values) &&
      mightHaveMore == other.mightHaveMore;

  @override
  int get hashCode => values.hashCode ^ mightHaveMore.hashCode;
}

class PresentationNotLoaded extends PresentationListState {}
