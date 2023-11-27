/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 booklet_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_fundamentals_model/model/booklet_component_bloc.dart';
import 'package:eliud_pkg_fundamentals_model/model/booklet_component_event.dart';
import 'package:eliud_pkg_fundamentals_model/model/booklet_model.dart';
import 'package:eliud_pkg_fundamentals_model/model/booklet_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_main/apis/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core_main/widgets/alert_widget.dart';
import 'package:eliud_core_main/model/app_model.dart';

/*
 * AbstractBookletComponent is the base class to extend / implement in case you need to implement a component
 */
abstract class AbstractBookletComponent extends StatelessWidget {
  static String componentName = "booklets";
  final AppModel app;
  final String bookletId;

  /*
   * Construct AbstractBookletComponent
   */
  AbstractBookletComponent(
      {super.key, required this.app, required this.bookletId});

  /*
   * build the component
   */
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookletComponentBloc>(
      create: (context) => BookletComponentBloc(
          bookletRepository: bookletRepository(appId: app.documentID)!)
        ..add(FetchBookletComponent(id: bookletId)),
      child: _bookletBlockBuilder(context),
    );
  }

  Widget _bookletBlockBuilder(BuildContext context) {
    return BlocBuilder<BookletComponentBloc, BookletComponentState>(
        builder: (context, state) {
      if (state is BookletComponentLoaded) {
        return yourWidget(context, state.value);
      } else if (state is BookletComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is BookletComponentError) {
        return AlertWidget(app: app, title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(app)
              .frontEndStyle()
              .progressIndicatorStyle()
              .progressIndicator(app, context),
        );
      }
    });
  }

  /*
   * Implement this method to provide your widget
   */
  Widget yourWidget(BuildContext context, BookletModel value);
}
