/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 link_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_model/tools/query/query_tools.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals_model/model/link_model.dart';

abstract class LinkListEvent extends Equatable {
  const LinkListEvent();
  @override
  List<Object?> get props => [];
}

class LoadLinkList extends LinkListEvent {}

class NewPage extends LinkListEvent {}

class AddLinkList extends LinkListEvent {
  final LinkModel? value;

  const AddLinkList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'AddLinkList{ value: $value }';
}

class UpdateLinkList extends LinkListEvent {
  final LinkModel? value;

  const UpdateLinkList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'UpdateLinkList{ value: $value }';
}

class DeleteLinkList extends LinkListEvent {
  final LinkModel? value;

  const DeleteLinkList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'DeleteLinkList{ value: $value }';
}

class LinkListUpdated extends LinkListEvent {
  final List<LinkModel?>? value;
  final bool? mightHaveMore;

  const LinkListUpdated({this.value, this.mightHaveMore});

  @override
  List<Object?> get props => [value, mightHaveMore];

  @override
  String toString() =>
      'LinkListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class LinkChangeQuery extends LinkListEvent {
  final EliudQuery? newQuery;

  const LinkChangeQuery({required this.newQuery});

  @override
  List<Object?> get props => [newQuery];

  @override
  String toString() => 'LinkChangeQuery{ value: $newQuery }';
}
