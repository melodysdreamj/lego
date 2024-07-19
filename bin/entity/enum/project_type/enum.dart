import 'dart:convert';

enum ProjectTypeEnum {
  NotSelected,
  Skeleton,
  WidgetLegoTemplate,
  // ViewTemplate,
  // JuneViewProject,
  LegoTemplate,
  // P005,
  // P006,
  // P007,
  // P008,
  // P009,
  // P010,
  // P011,
  // P012,
  // P013,
  // P014,
  // P015,
  // P016,
  // P017,
  // P018,
  // P019,
  // P020,
  ;

  String toStringValue() {
    return toString().split('.').last;
  }

  static ProjectTypeEnum fromString(String enumString) {
    return ProjectTypeEnum.values.firstWhere((e) => e.toStringValue() == enumString);
  }
}
