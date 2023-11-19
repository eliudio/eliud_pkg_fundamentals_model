/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 booklet_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals_model/model/booklet_model.dart';

abstract class BookletListState extends Equatable {
  const BookletListState();

  @override
  List<Object?> get props => [];
}

class BookletListLoading extends BookletListState {}

class BookletListLoaded extends BookletListState {
  final List<BookletModel?>? values;
  final bool? mightHaveMore;

  const BookletListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [values, mightHaveMore];

  @override
  String toString() => 'BookletListLoaded { values: $values }';

  @override
  bool operator ==(Object other) =>
      other is BookletListLoaded &&
      runtimeType == other.runtimeType &&
      ListEquality().equals(values, other.values) &&
      mightHaveMore == other.mightHaveMore;

  @override
  int get hashCode => values.hashCode ^ mightHaveMore.hashCode;
}

class BookletNotLoaded extends BookletListState {}
