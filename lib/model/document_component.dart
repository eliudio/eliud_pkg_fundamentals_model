/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 document_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_fundamentals_model/model/document_component_bloc.dart';
import 'package:eliud_pkg_fundamentals_model/model/document_component_event.dart';
import 'package:eliud_pkg_fundamentals_model/model/document_model.dart';
import 'package:eliud_pkg_fundamentals_model/model/document_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_model/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core_model/model/app_model.dart';

/*
 * AbstractDocumentComponent is the base class to extend / implement in case you need to implement a component
 */
abstract class AbstractDocumentComponent extends StatelessWidget {
  static String componentName = "documents";
  final AppModel app;
  final String documentId;

  /*
   * Construct AbstractDocumentComponent
   */
  AbstractDocumentComponent(
      {super.key, required this.app, required this.documentId});

  /*
   * build the component
   */
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DocumentComponentBloc>(
      create: (context) => DocumentComponentBloc(
          documentRepository: documentRepository(appId: app.documentID)!)
        ..add(FetchDocumentComponent(id: documentId)),
      child: _documentBlockBuilder(context),
    );
  }

  Widget _documentBlockBuilder(BuildContext context) {
    return BlocBuilder<DocumentComponentBloc, DocumentComponentState>(
        builder: (context, state) {
      if (state is DocumentComponentLoaded) {
        return yourWidget(context, state.value);
      } else if (state is DocumentComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is DocumentComponentError) {
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
  Widget yourWidget(BuildContext context, DocumentModel value);
}
