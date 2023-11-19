/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dynamic_widget_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_fundamentals_model/model/dynamic_widget_component_bloc.dart';
import 'package:eliud_pkg_fundamentals_model/model/dynamic_widget_component_event.dart';
import 'package:eliud_pkg_fundamentals_model/model/dynamic_widget_model.dart';
import 'package:eliud_pkg_fundamentals_model/model/dynamic_widget_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_model/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core_model/model/app_model.dart';

/*
 * AbstractDynamicWidgetComponent is the base class to extend / implement in case you need to implement a component
 */
abstract class AbstractDynamicWidgetComponent extends StatelessWidget {
  static String componentName = "dynamicWidgets";
  final AppModel app;
  final String dynamicWidgetId;

  /*
   * Construct AbstractDynamicWidgetComponent
   */
  AbstractDynamicWidgetComponent(
      {super.key, required this.app, required this.dynamicWidgetId});

  /*
   * build the component
   */
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DynamicWidgetComponentBloc>(
      create: (context) => DynamicWidgetComponentBloc(
          dynamicWidgetRepository:
              dynamicWidgetRepository(appId: app.documentID)!)
        ..add(FetchDynamicWidgetComponent(id: dynamicWidgetId)),
      child: _dynamicWidgetBlockBuilder(context),
    );
  }

  Widget _dynamicWidgetBlockBuilder(BuildContext context) {
    return BlocBuilder<DynamicWidgetComponentBloc, DynamicWidgetComponentState>(
        builder: (context, state) {
      if (state is DynamicWidgetComponentLoaded) {
        return yourWidget(context, state.value);
      } else if (state is DynamicWidgetComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is DynamicWidgetComponentError) {
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
  Widget yourWidget(BuildContext context, DynamicWidgetModel value);
}
