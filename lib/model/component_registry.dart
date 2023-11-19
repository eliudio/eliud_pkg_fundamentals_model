/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/component_registry.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import '../model/internal_component.dart';
import 'package:eliud_core/core/registry.dart';
import 'package:eliud_core_model/tools/component/component_spec.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/tools/component/component_constructor.dart';

import 'booklet_component_selector.dart';
import 'decorated_content_component_selector.dart';
import 'divider_component_selector.dart';
import 'document_component_selector.dart';
import 'dynamic_widget_component_selector.dart';
import 'fader_component_selector.dart';
import 'grid_component_selector.dart';
import 'presentation_component_selector.dart';
import 'simple_image_component_selector.dart';
import 'simple_text_component_selector.dart';
import 'tutorial_component_selector.dart';

/* 
 * Component registry contains a list of components
 */
class ComponentRegistry {
  /* 
   * Initialise the component registry
   */
  init(
    ComponentConstructor bookletComponentConstructorDefault,
    ComponentEditorConstructor bookletComponentEditorConstructor,
    ComponentConstructor decoratedContentComponentConstructorDefault,
    ComponentEditorConstructor decoratedContentComponentEditorConstructor,
    ComponentConstructor dividerComponentConstructorDefault,
    ComponentEditorConstructor dividerComponentEditorConstructor,
    ComponentConstructor documentComponentConstructorDefault,
    ComponentEditorConstructor documentComponentEditorConstructor,
    ComponentConstructor dynamicWidgetComponentConstructorDefault,
    ComponentEditorConstructor dynamicWidgetComponentEditorConstructor,
    ComponentConstructor faderComponentConstructorDefault,
    ComponentEditorConstructor faderComponentEditorConstructor,
    ComponentConstructor gridComponentConstructorDefault,
    ComponentEditorConstructor gridComponentEditorConstructor,
    ComponentConstructor presentationComponentConstructorDefault,
    ComponentEditorConstructor presentationComponentEditorConstructor,
    ComponentConstructor simpleImageComponentConstructorDefault,
    ComponentEditorConstructor simpleImageComponentEditorConstructor,
    ComponentConstructor simpleTextComponentConstructorDefault,
    ComponentEditorConstructor simpleTextComponentEditorConstructor,
    ComponentConstructor tutorialComponentConstructorDefault,
    ComponentEditorConstructor tutorialComponentEditorConstructor,
  ) {
    Apis.apis().addInternalComponents('eliud_pkg_fundamentals_model', [
      "booklets",
      "decoratedContents",
      "dividers",
      "documents",
      "dynamicWidgets",
      "faders",
      "grids",
      "presentations",
      "simpleImages",
      "simpleTexts",
      "tutorials",
    ]);

    Apis.apis().register(
        componentName: "eliud_pkg_fundamentals_model_internalWidgets",
        componentConstructor: ListComponentFactory());
    Apis.apis()
        .addDropDownSupporter("booklets", DropdownButtonComponentFactory());
    Apis.apis().register(
        componentName: "booklets",
        componentConstructor: bookletComponentConstructorDefault);
    Apis.apis().addDropDownSupporter(
        "decoratedContents", DropdownButtonComponentFactory());
    Apis.apis().register(
        componentName: "decoratedContents",
        componentConstructor: decoratedContentComponentConstructorDefault);
    Apis.apis()
        .addDropDownSupporter("dividers", DropdownButtonComponentFactory());
    Apis.apis().register(
        componentName: "dividers",
        componentConstructor: dividerComponentConstructorDefault);
    Apis.apis()
        .addDropDownSupporter("documents", DropdownButtonComponentFactory());
    Apis.apis().register(
        componentName: "documents",
        componentConstructor: documentComponentConstructorDefault);
    Apis.apis().addDropDownSupporter(
        "dynamicWidgets", DropdownButtonComponentFactory());
    Apis.apis().register(
        componentName: "dynamicWidgets",
        componentConstructor: dynamicWidgetComponentConstructorDefault);
    Apis.apis()
        .addDropDownSupporter("faders", DropdownButtonComponentFactory());
    Apis.apis().register(
        componentName: "faders",
        componentConstructor: faderComponentConstructorDefault);
    Apis.apis()
        .addDropDownSupporter("grids", DropdownButtonComponentFactory());
    Apis.apis().register(
        componentName: "grids",
        componentConstructor: gridComponentConstructorDefault);
    Apis.apis().addDropDownSupporter(
        "presentations", DropdownButtonComponentFactory());
    Apis.apis().register(
        componentName: "presentations",
        componentConstructor: presentationComponentConstructorDefault);
    Apis.apis()
        .addDropDownSupporter("simpleImages", DropdownButtonComponentFactory());
    Apis.apis().register(
        componentName: "simpleImages",
        componentConstructor: simpleImageComponentConstructorDefault);
    Apis.apis()
        .addDropDownSupporter("simpleTexts", DropdownButtonComponentFactory());
    Apis.apis().register(
        componentName: "simpleTexts",
        componentConstructor: simpleTextComponentConstructorDefault);
    Apis.apis()
        .addDropDownSupporter("tutorials", DropdownButtonComponentFactory());
    Apis.apis().register(
        componentName: "tutorials",
        componentConstructor: tutorialComponentConstructorDefault);
    Apis.apis()
        .addComponentSpec('eliud_pkg_fundamentals_model', 'fundamentals', [
      ComponentSpec(
          'booklets',
          bookletComponentConstructorDefault,
          BookletComponentSelector(),
          bookletComponentEditorConstructor,
          ({String? appId}) => bookletRepository(appId: appId)!),
      ComponentSpec(
          'decoratedContents',
          decoratedContentComponentConstructorDefault,
          DecoratedContentComponentSelector(),
          decoratedContentComponentEditorConstructor,
          ({String? appId}) => decoratedContentRepository(appId: appId)!),
      ComponentSpec(
          'dividers',
          dividerComponentConstructorDefault,
          DividerComponentSelector(),
          dividerComponentEditorConstructor,
          ({String? appId}) => dividerRepository(appId: appId)!),
      ComponentSpec(
          'documents',
          documentComponentConstructorDefault,
          DocumentComponentSelector(),
          documentComponentEditorConstructor,
          ({String? appId}) => documentRepository(appId: appId)!),
      ComponentSpec(
          'dynamicWidgets',
          dynamicWidgetComponentConstructorDefault,
          DynamicWidgetComponentSelector(),
          dynamicWidgetComponentEditorConstructor,
          ({String? appId}) => dynamicWidgetRepository(appId: appId)!),
      ComponentSpec(
          'faders',
          faderComponentConstructorDefault,
          FaderComponentSelector(),
          faderComponentEditorConstructor,
          ({String? appId}) => faderRepository(appId: appId)!),
      ComponentSpec(
          'grids',
          gridComponentConstructorDefault,
          GridComponentSelector(),
          gridComponentEditorConstructor,
          ({String? appId}) => gridRepository(appId: appId)!),
      ComponentSpec(
          'presentations',
          presentationComponentConstructorDefault,
          PresentationComponentSelector(),
          presentationComponentEditorConstructor,
          ({String? appId}) => presentationRepository(appId: appId)!),
      ComponentSpec(
          'simpleImages',
          simpleImageComponentConstructorDefault,
          SimpleImageComponentSelector(),
          simpleImageComponentEditorConstructor,
          ({String? appId}) => simpleImageRepository(appId: appId)!),
      ComponentSpec(
          'simpleTexts',
          simpleTextComponentConstructorDefault,
          SimpleTextComponentSelector(),
          simpleTextComponentEditorConstructor,
          ({String? appId}) => simpleTextRepository(appId: appId)!),
      ComponentSpec(
          'tutorials',
          tutorialComponentConstructorDefault,
          TutorialComponentSelector(),
          tutorialComponentEditorConstructor,
          ({String? appId}) => tutorialRepository(appId: appId)!),
    ]);
    Apis.apis().registerRetrieveRepository(
        'eliud_pkg_fundamentals_model',
        'booklets',
        ({String? appId}) => bookletRepository(appId: appId)!);
    Apis.apis().registerRetrieveRepository(
        'eliud_pkg_fundamentals_model',
        'decoratedContents',
        ({String? appId}) => decoratedContentRepository(appId: appId)!);
    Apis.apis().registerRetrieveRepository(
        'eliud_pkg_fundamentals_model',
        'dividers',
        ({String? appId}) => dividerRepository(appId: appId)!);
    Apis.apis().registerRetrieveRepository(
        'eliud_pkg_fundamentals_model',
        'documents',
        ({String? appId}) => documentRepository(appId: appId)!);
    Apis.apis().registerRetrieveRepository(
        'eliud_pkg_fundamentals_model',
        'dynamicWidgets',
        ({String? appId}) => dynamicWidgetRepository(appId: appId)!);
    Apis.apis().registerRetrieveRepository(
        'eliud_pkg_fundamentals_model',
        'faders',
        ({String? appId}) => faderRepository(appId: appId)!);
    Apis.apis().registerRetrieveRepository(
        'eliud_pkg_fundamentals_model',
        'grids',
        ({String? appId}) => gridRepository(appId: appId)!);
    Apis.apis().registerRetrieveRepository(
        'eliud_pkg_fundamentals_model',
        'presentations',
        ({String? appId}) => presentationRepository(appId: appId)!);
    Apis.apis().registerRetrieveRepository(
        'eliud_pkg_fundamentals_model',
        'simpleImages',
        ({String? appId}) => simpleImageRepository(appId: appId)!);
    Apis.apis().registerRetrieveRepository(
        'eliud_pkg_fundamentals_model',
        'simpleTexts',
        ({String? appId}) => simpleTextRepository(appId: appId)!);
    Apis.apis().registerRetrieveRepository(
        'eliud_pkg_fundamentals_model',
        'tutorials',
        ({String? appId}) => tutorialRepository(appId: appId)!);
  }
}
