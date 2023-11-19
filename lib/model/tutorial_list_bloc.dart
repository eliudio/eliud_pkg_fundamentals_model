/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 tutorial_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_fundamentals_model/model/tutorial_repository.dart';
import 'package:eliud_pkg_fundamentals_model/model/tutorial_list_event.dart';
import 'package:eliud_pkg_fundamentals_model/model/tutorial_list_state.dart';
import 'package:eliud_core_model/tools/query/query_tools.dart';

import 'tutorial_model.dart';

typedef FilterTutorialModels = List<TutorialModel?> Function(
    List<TutorialModel?> values);

class TutorialListBloc extends Bloc<TutorialListEvent, TutorialListState> {
  final FilterTutorialModels? filter;
  final TutorialRepository _tutorialRepository;
  StreamSubscription? _tutorialsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int tutorialLimit;

  TutorialListBloc(
      {this.filter,
      this.paged,
      this.orderBy,
      this.descending,
      this.detailed,
      this.eliudQuery,
      required TutorialRepository tutorialRepository,
      this.tutorialLimit = 5})
      : _tutorialRepository = tutorialRepository,
        super(TutorialListLoading()) {
    on<LoadTutorialList>((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadTutorialListToState();
      } else {
        _mapLoadTutorialListWithDetailsToState();
      }
    });

    on<NewPage>((event, emit) {
      pages = pages +
          1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadTutorialListWithDetailsToState();
    });

    on<TutorialChangeQuery>((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadTutorialListToState();
      } else {
        _mapLoadTutorialListWithDetailsToState();
      }
    });

    on<AddTutorialList>((event, emit) async {
      await _mapAddTutorialListToState(event);
    });

    on<UpdateTutorialList>((event, emit) async {
      await _mapUpdateTutorialListToState(event);
    });

    on<DeleteTutorialList>((event, emit) async {
      await _mapDeleteTutorialListToState(event);
    });

    on<TutorialListUpdated>((event, emit) {
      emit(_mapTutorialListUpdatedToState(event));
    });
  }

  List<TutorialModel?> _filter(List<TutorialModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadTutorialListToState() async {
    int amountNow = (state is TutorialListLoaded)
        ? (state as TutorialListLoaded).values!.length
        : 0;
    _tutorialsListSubscription?.cancel();
    _tutorialsListSubscription = _tutorialRepository.listen(
        (list) => add(TutorialListUpdated(
            value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * tutorialLimit : null);
  }

  Future<void> _mapLoadTutorialListWithDetailsToState() async {
    int amountNow = (state is TutorialListLoaded)
        ? (state as TutorialListLoaded).values!.length
        : 0;
    _tutorialsListSubscription?.cancel();
    _tutorialsListSubscription = _tutorialRepository.listenWithDetails(
        (list) => add(TutorialListUpdated(
            value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * tutorialLimit : null);
  }

  Future<void> _mapAddTutorialListToState(AddTutorialList event) async {
    var value = event.value;
    if (value != null) {
      await _tutorialRepository.add(value);
    }
  }

  Future<void> _mapUpdateTutorialListToState(UpdateTutorialList event) async {
    var value = event.value;
    if (value != null) {
      await _tutorialRepository.update(value);
    }
  }

  Future<void> _mapDeleteTutorialListToState(DeleteTutorialList event) async {
    var value = event.value;
    if (value != null) {
      await _tutorialRepository.delete(value);
    }
  }

  TutorialListLoaded _mapTutorialListUpdatedToState(
          TutorialListUpdated event) =>
      TutorialListLoaded(
          values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _tutorialsListSubscription?.cancel();
    return super.close();
  }
}
