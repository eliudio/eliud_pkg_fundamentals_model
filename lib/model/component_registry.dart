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
import 'package:eliud_core_main/apis/registryapi/component/component_spec.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core_main/apis/registryapi/component/component_constructor.dart';
import 'package:eliud_core_main/apis/apis.dart';

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
    Apis.apis()
        .getRegistryApi()
        .addInternalComponents('eliud_pkg_fundamentals_model', [
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

    Apis.apis()
        .getRegistryApi()
        .addDropDownSupporter("booklets", DropdownButtonComponentFactory());
    Apis.apis().getRegistryApi().register(
        componentName: "booklets",
        componentConstructor: bookletComponentConstructorDefault);
    Apis.apis().getRegistryApi().addDropDownSupporter(
        "decoratedContents", DropdownButtonComponentFactory());
    Apis.apis().getRegistryApi().register(
        componentName: "decoratedContents",
        componentConstructor: decoratedContentComponentConstructorDefault);
    Apis.apis()
        .getRegistryApi()
        .addDropDownSupporter("dividers", DropdownButtonComponentFactory());
    Apis.apis().getRegistryApi().register(
        componentName: "dividers",
        componentConstructor: dividerComponentConstructorDefault);
    Apis.apis()
        .getRegistryApi()
        .addDropDownSupporter("documents", DropdownButtonComponentFactory());
    Apis.apis().getRegistryApi().register(
        componentName: "documents",
        componentConstructor: documentComponentConstructorDefault);
    Apis.apis().getRegistryApi().addDropDownSupporter(
        "dynamicWidgets", DropdownButtonComponentFactory());
    Apis.apis().getRegistryApi().register(
        componentName: "dynamicWidgets",
        componentConstructor: dynamicWidgetComponentConstructorDefault);
    Apis.apis()
        .getRegistryApi()
        .addDropDownSupporter("faders", DropdownButtonComponentFactory());
    Apis.apis().getRegistryApi().register(
        componentName: "faders",
        componentConstructor: faderComponentConstructorDefault);
    Apis.apis()
        .getRegistryApi()
        .addDropDownSupporter("grids", DropdownButtonComponentFactory());
    Apis.apis().getRegistryApi().register(
        componentName: "grids",
        componentConstructor: gridComponentConstructorDefault);
    Apis.apis().getRegistryApi().addDropDownSupporter(
        "presentations", DropdownButtonComponentFactory());
    Apis.apis().getRegistryApi().register(
        componentName: "presentations",
        componentConstructor: presentationComponentConstructorDefault);
    Apis.apis()
        .getRegistryApi()
        .addDropDownSupporter("simpleImages", DropdownButtonComponentFactory());
    Apis.apis().getRegistryApi().register(
        componentName: "simpleImages",
        componentConstructor: simpleImageComponentConstructorDefault);
    Apis.apis()
        .getRegistryApi()
        .addDropDownSupporter("simpleTexts", DropdownButtonComponentFactory());
    Apis.apis().getRegistryApi().register(
        componentName: "simpleTexts",
        componentConstructor: simpleTextComponentConstructorDefault);
    Apis.apis()
        .getRegistryApi()
        .addDropDownSupporter("tutorials", DropdownButtonComponentFactory());
    Apis.apis().getRegistryApi().register(
        componentName: "tutorials",
        componentConstructor: tutorialComponentConstructorDefault);
    Apis.apis()
        .getRegistryApi()
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
    Apis.apis().getRegistryApi().registerRetrieveRepository(
        'eliud_pkg_fundamentals_model',
        'booklets',
        ({String? appId}) => bookletRepository(appId: appId)!);
    Apis.apis().getRegistryApi().registerRetrieveRepository(
        'eliud_pkg_fundamentals_model',
        'decoratedContents',
        ({String? appId}) => decoratedContentRepository(appId: appId)!);
    Apis.apis().getRegistryApi().registerRetrieveRepository(
        'eliud_pkg_fundamentals_model',
        'dividers',
        ({String? appId}) => dividerRepository(appId: appId)!);
    Apis.apis().getRegistryApi().registerRetrieveRepository(
        'eliud_pkg_fundamentals_model',
        'documents',
        ({String? appId}) => documentRepository(appId: appId)!);
    Apis.apis().getRegistryApi().registerRetrieveRepository(
        'eliud_pkg_fundamentals_model',
        'dynamicWidgets',
        ({String? appId}) => dynamicWidgetRepository(appId: appId)!);
    Apis.apis().getRegistryApi().registerRetrieveRepository(
        'eliud_pkg_fundamentals_model',
        'faders',
        ({String? appId}) => faderRepository(appId: appId)!);
    Apis.apis().getRegistryApi().registerRetrieveRepository(
        'eliud_pkg_fundamentals_model',
        'grids',
        ({String? appId}) => gridRepository(appId: appId)!);
    Apis.apis().getRegistryApi().registerRetrieveRepository(
        'eliud_pkg_fundamentals_model',
        'presentations',
        ({String? appId}) => presentationRepository(appId: appId)!);
    Apis.apis().getRegistryApi().registerRetrieveRepository(
        'eliud_pkg_fundamentals_model',
        'simpleImages',
        ({String? appId}) => simpleImageRepository(appId: appId)!);
    Apis.apis().getRegistryApi().registerRetrieveRepository(
        'eliud_pkg_fundamentals_model',
        'simpleTexts',
        ({String? appId}) => simpleTextRepository(appId: appId)!);
    Apis.apis().getRegistryApi().registerRetrieveRepository(
        'eliud_pkg_fundamentals_model',
        'tutorials',
        ({String? appId}) => tutorialRepository(appId: appId)!);
  }
}
