/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 grid_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals_model/model/grid_model.dart';

/*
 * GridComponentEvent is the base class for events to be used with constructing a GridComponentBloc 
 */
abstract class GridComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchGridComponent is the event to instruct the bloc to fetch the component
 */
class FetchGridComponent extends GridComponentEvent {
  final String? id;

  /*
   * Construct the FetchGridComponent
   */
  FetchGridComponent({this.id});
}

/*
 * GridComponentUpdated is the event to inform the bloc that a component has been updated
 */
class GridComponentUpdated extends GridComponentEvent {
  final GridModel value;

  /*
   * Construct the GridComponentUpdated
   */
  GridComponentUpdated({required this.value});
}
