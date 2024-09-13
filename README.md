![](https://raw.githubusercontent.com/melodysdreamj/juneflow/document/assets/readme.webp)

# Lego
A Cli tool for sharing flutter widgets and code snippets.

## install & create project
```bash
dart pub global activate lego_cli
lego create
```
- find more information on [document](https://doc.junestory.com/)

### Widget Legos
some widget legos are available to view on [uihub](https://www.youtube.com/@FreeFlutterUIHub/shorts)

### Initial Legos

| Package                    | Version                                                                                           |
|----------------------------|---------------------------------------------------------------------------------------------------|
| bot_toast_lego             | [![bot_toast_lego](https://img.shields.io/pub/v/bot_toast_lego.svg)](https://pub.dev/packages/bot_toast_lego)             |
| screenutil_lego            | [![screenutil_lego](https://img.shields.io/pub/v/screenutil_lego.svg)](https://pub.dev/packages/screenutil_lego)             |
| device_preview_lego        | [![device_preview_lego](https://img.shields.io/pub/v/device_preview_lego.svg)](https://pub.dev/packages/device_preview_lego)             |
| theme_config_lego          | [![theme_config_lego](https://img.shields.io/pub/v/theme_config_lego.svg)](https://pub.dev/packages/theme_config_lego)          |
| widget_binding_lego        | [![widget_binding_lego](https://img.shields.io/pub/v/widget_binding_lego.svg)](https://pub.dev/packages/widget_binding_lego)        |
| beamer_lego                | [![beamer_lego](https://img.shields.io/pub/v/beamer_lego.svg)](https://pub.dev/packages/beamer_lego)                |
| getx_lego                  | [![getx_lego](https://img.shields.io/pub/v/getx_lego.svg)](https://pub.dev/packages/getx_lego)                  |
| go_router_lego             | [![go_router_lego](https://img.shields.io/pub/v/go_router_lego.svg)](https://pub.dev/packages/go_router_lego)             |
| orange_lego                | [![orange_lego](https://img.shields.io/pub/v/orange_lego.svg)](https://pub.dev/packages/orange_lego)                |
| permission_handler_lego    | [![permission_handler_lego](https://img.shields.io/pub/v/permission_handler_lego.svg)](https://pub.dev/packages/permission_handler_lego)    |
| usage_note_lego            | [![usage_note_lego](https://img.shields.io/pub/v/usage_note_lego.svg)](https://pub.dev/packages/usage_note_lego)            |
| logger_lego                | [![logger_lego](https://img.shields.io/pub/v/logger_lego.svg)](https://pub.dev/packages/logger_lego)                |
| geolocator_lego            | [![geolocator_lego](https://img.shields.io/pub/v/geolocator_lego.svg)](https://pub.dev/packages/geolocator_lego)            |
| easy_localization_csv_lego | [![easy_localization_csv_lego](https://img.shields.io/pub/v/easy_localization_csv_lego.svg)](https://pub.dev/packages/easy_localization_csv_lego) |
| app_links_lego             | [![app_links_lego](https://img.shields.io/pub/v/app_links_lego.svg)](https://pub.dev/packages/app_links_lego)             |
| listener_lego              | [![listener_lego](https://img.shields.io/pub/v/listener_lego.svg)](https://pub.dev/packages/listener_lego)              |
| flutter_fgbg_lego          | [![flutter_fgbg_lego](https://img.shields.io/pub/v/flutter_fgbg_lego.svg)](https://pub.dev/packages/flutter_fgbg_lego)          |
| flutter_launcher_icons_lego | [![flutter_launcher_icons_lego](https://img.shields.io/pub/v/flutter_launcher_icons_lego.svg)](https://pub.dev/packages/flutter_launcher_icons_lego) |
| flutter_native_splash_lego | [![flutter_native_splash_lego](https://img.shields.io/pub/v/flutter_native_splash_lego.svg)](https://pub.dev/packages/flutter_native_splash_lego) |
| firebase_core_lego         | [![firebase_core_lego](https://img.shields.io/pub/v/firebase_core_lego.svg)](https://pub.dev/packages/firebase_core_lego)         |
| firebase_analytics_lego    | [![firebase_analytics_lego](https://img.shields.io/pub/v/firebase_analytics_lego.svg)](https://pub.dev/packages/firebase_analytics_lego)    |
| firebase_crashlytics_lego  | [![firebase_crashlytics_lego](https://img.shields.io/pub/v/firebase_crashlytics_lego.svg)](https://pub.dev/packages/firebase_crashlytics_lego)  |
| firebase_app_check_lego    | [![firebase_app_check_lego](https://img.shields.io/pub/v/firebase_app_check_lego.svg)](https://pub.dev/packages/firebase_app_check_lego)    |
| firebase_vertexai_lego     | [![firebase_vertexai_lego](https://img.shields.io/pub/v/firebase_vertexai_lego.svg)](https://pub.dev/packages/firebase_vertexai_lego)     |
| admob_lego                 | [![admob_lego](https://img.shields.io/pub/v/admob_lego.svg)](https://pub.dev/packages/admob_lego)                 |
| timezone_lego             | [![timezone_lego](https://img.shields.io/pub/v/timezone_lego.svg)](https://pub.dev/packages/timezone_lego)              |
| intl_lego                  | [![intl_lego](https://img.shields.io/pub/v/intl_lego.svg)](https://pub.dev/packages/intl_lego)                  |
| csv_localizations_lego     | [![csv_localizations_lego](https://img.shields.io/pub/v/csv_localizations_lego.svg)](https://pub.dev/packages/csv_localizations_lego)     |
| step_counter_lego          | [![step_counter_lego](https://img.shields.io/pub/v/step_counter_lego.svg)](https://pub.dev/packages/step_counter_lego)          |
| add_widgetbook_page_lego   | [![add_widgetbook_page_lego](https://img.shields.io/pub/v/add_widgetbook_page_lego.svg)](https://pub.dev/packages/add_widgetbook_page_lego)   |



## Simple Architecture Lego
simple architecture under lego framework.

![](https://github.com/user-attachments/assets/a278586a-6d8f-416a-b30a-83d166695fbf)

### Structure
```bash
app
├── backend
│   ├── app_storage
│   ├── deeplink
│   ├── fcm
│   ├── firestore
│   ├── sqflite
│   ├── notification
│   └── ...
├── frontend
│   ├── listener
│   │   ├── battery
│   │   ├── connectivity
│   │   ├── location
│   │   └── ...
│   ├── view
│   │   ├── page
│   │   ├── component
│   │   ├── bottom_sheet
│   │   └── ...
│   └── view_model
└── usecase
    └── ...
```

### Simple Architecture Legos

| Package                    | Type             | Platform          | Version                                                                                           |
|----------------------------|------------------|-------------------|---------------------------------------------------------------------------------------------------|
| sa_data_class_lego            | backend          | all               | [![pub package](https://img.shields.io/pub/v/sa_data_class_lego.svg)](https://pub.dartlang.org/packages/sa_data_class_lego) |
| sa_enum_lego                  | backend          | all               | [![pub package](https://img.shields.io/pub/v/sa_enum_lego.svg)](https://pub.dartlang.org/packages/sa_enum_lego) |
| sa_sqflite_lego               | backend          | mobile,desktop    | [![pub package](https://img.shields.io/pub/v/sa_sqflite_lego.svg)](https://pub.dartlang.org/packages/sa_sqflite_lego) |
| sa_firestore_lego             | backend          | mobile,desktop    | [![pub package](https://img.shields.io/pub/v/sa_firestore_lego.svg)](https://pub.dartlang.org/packages/sa_firestore_lego) |
| sa_orange_lego                | backend          | all               | [![pub package](https://img.shields.io/pub/v/sa_orange_lego.svg)](https://pub.dartlang.org/packages/sa_orange_lego) |
| sa_shared_preference_lego      | backend          | mobile,desktop,web | [![pub package](https://img.shields.io/pub/v/sa_shared_preference_lego.svg)](https://pub.dartlang.org/packages/sa_shared_preference_lego) |
| sa_flutter_secure_storage_lego | backend          | mobile,desktop,web | [![pub package](https://img.shields.io/pub/v/sa_flutter_secure_storage_lego.svg)](https://pub.dartlang.org/packages/sa_flutter_secure_storage_lego) |
| package_info_plus_lego        | backend          | mobile,desktop,web | [![pub package](https://img.shields.io/pub/v/package_info_plus_lego.svg)](https://pub.dartlang.org/packages/package_info_plus_lego) |
| sa_app_storage_lego   | backend          | mobile,desktop,web | [![pub package](https://img.shields.io/pub/v/sa_app_storage_lego.svg)](https://pub.dartlang.org/packages/sa_app_storage_lego) |
| sa_firebase_storage_lego | backend          | mobile,desktop,web | [![pub package](https://img.shields.io/pub/v/sa_firebase_storage_lego.svg)](https://pub.dartlang.org/packages/sa_firebase_storage_lego) |
| sa_google_mlkit_translate_lego | backend          | mobile | [![pub package](https://img.shields.io/pub/v/sa_google_mlkit_translate_lego.svg)](https://pub.dartlang.org/packages/sa_google_mlkit_translate_lego) |
| sa_deeplink_lego      | backend,frontend | mobile,desktop    | [![pub package](https://img.shields.io/pub/v/sa_deeplink_lego.svg)](https://pub.dartlang.org/packages/sa_deeplink_lego) |
| sa_firebase_auth_lego | backend          | mobile,desktop    | [![pub package](https://img.shields.io/pub/v/sa_firebase_auth_lego.svg)](https://pub.dartlang.org/packages/sa_firebase_auth_lego) |
| sa_firebase_messaging_lego | backend          | mobile,desktop    | [![pub package](https://img.shields.io/pub/v/sa_firebase_messaging_lego.svg)](https://pub.dartlang.org/packages/sa_firebase_messaging_lego) |
| sa_lego_cloud_functions_lego | backend          | mobile,desktop    | [![pub package](https://img.shields.io/pub/v/sa_lego_cloud_functions_lego.svg)](https://pub.dartlang.org/packages/sa_lego_cloud_functions_lego) |
| sa_listener_lego               | frontend  | all               | [![pub package](https://img.shields.io/pub/v/sa_listener_lego.svg)](https://pub.dartlang.org/packages/sa_listener_lego) |
| sa_fgbg_listener_lego          | frontend  | mobile            | [![pub package](https://img.shields.io/pub/v/sa_fgbg_listener_lego.svg)](https://pub.dartlang.org/packages/sa_fgbg_listener_lego) |
| sa_battery_plus_listener_lego  | frontend  | all            | [![pub package](https://img.shields.io/pub/v/sa_battery_plus_listener_lego.svg)](https://pub.dartlang.org/packages/sa_battery_plus_listener_lego) |
| sa_app_links_listener_lego     | frontend  | all            | [![pub package](https://img.shields.io/pub/v/sa_app_links_listener_lego.svg)](https://pub.dartlang.org/packages/sa_app_links_listener_lego) |
| june_lego | frontend  | all               | [![pub package](https://img.shields.io/pub/v/june_lego.svg)](https://pub.dartlang.org/packages/june_lego) |
| sa_june_util_lego | frontend  | all               | [![pub package](https://img.shields.io/pub/v/sa_june_util_lego.svg)](https://pub.dartlang.org/packages/sa_june_util_lego) |
| easy_localization_csv_lego | frontend  | all               | [![pub package](https://img.shields.io/pub/v/easy_localization_csv_lego.svg)](https://pub.dartlang.org/packages/easy_localization_csv_lego) |





















































