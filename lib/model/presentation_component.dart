/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 presentation_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_fundamentals_model/model/presentation_component_bloc.dart';
import 'package:eliud_pkg_fundamentals_model/model/presentation_component_event.dart';
import 'package:eliud_pkg_fundamentals_model/model/presentation_model.dart';
import 'package:eliud_pkg_fundamentals_model/model/presentation_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_main/apis/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core_main/widgets/alert_widget.dart';
import 'package:eliud_core_main/model/app_model.dart';

/*
 * AbstractPresentationComponent is the base class to extend / implement in case you need to implement a component
 */
abstract class AbstractPresentationComponent extends StatelessWidget {
  static String componentName = "presentations";
  final AppModel app;
  final String presentationId;

  /*
   * Construct AbstractPresentationComponent
   */
  AbstractPresentationComponent(
      {super.key, required this.app, required this.presentationId});

  /*
   * build the component
   */
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PresentationComponentBloc>(
      create: (context) => PresentationComponentBloc(
          presentationRepository:
              presentationRepository(appId: app.documentID)!)
        ..add(FetchPresentationComponent(id: presentationId)),
      child: _presentationBlockBuilder(context),
    );
  }

  Widget _presentationBlockBuilder(BuildContext context) {
    return BlocBuilder<PresentationComponentBloc, PresentationComponentState>(
        builder: (context, state) {
      if (state is PresentationComponentLoaded) {
        return yourWidget(context, state.value);
      } else if (state is PresentationComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is PresentationComponentError) {
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
  Widget yourWidget(BuildContext context, PresentationModel value);
}
