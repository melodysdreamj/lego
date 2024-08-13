import 'dart:convert';

import '../../enum/project_type/enum.dart';

class CreationResult {
  // int I000 = 0;
  // int I001 = 0;
  // int I002 = 0;
  // int I003 = 0;
  // int I004 = 0;
  // int I005 = 0;
  // int I006 = 0;
  // int I007 = 0;
  // int I008 = 0;
  // int I009 = 0;
  // int I010 = 0;
  // int I011 = 0;
  // int I012 = 0;
  // int I013 = 0;
  // int I014 = 0;
  // int I015 = 0;
  // int I016 = 0;
  // int I017 = 0;
  // int I018 = 0;
  // int I019 = 0;
  // int I020 = 0;
  // int I021 = 0;
  // int I022 = 0;
  // int I023 = 0;
  // int I024 = 0;
  // int I025 = 0;
  // int I026 = 0;
  // int I027 = 0;
  // int I028 = 0;
  // int I029 = 0;
  // int I030 = 0;
  // int I031 = 0;
  // int I032 = 0;
  // int I033 = 0;
  // int I034 = 0;
  // int I035 = 0;
  // int I036 = 0;
  // int I037 = 0;
  // int I038 = 0;
  // int I039 = 0;
  // int I040 = 0;
  // int I041 = 0;
  // int I042 = 0;
  // int I043 = 0;
  // int I044 = 0;
  // int I045 = 0;
  // int I046 = 0;
  // int I047 = 0;
  // int I048 = 0;
  // int I049 = 0;
  // int I050 = 0;
  // int I051 = 0;
  // int I052 = 0;
  // int I053 = 0;
  // int I054 = 0;
  // int I055 = 0;
  // int I056 = 0;
  // int I057 = 0;
  // int I058 = 0;
  // int I059 = 0;
  // int I060 = 0;
  // int I061 = 0;
  // int I062 = 0;
  // int I063 = 0;
  // int I064 = 0;
  // int I065 = 0;
  // int I066 = 0;
  // int I067 = 0;
  // int I068 = 0;
  // int I069 = 0;
  // int I070 = 0;
  // int I071 = 0;
  // int I072 = 0;
  // int I073 = 0;
  // int I074 = 0;
  // int I075 = 0;
  // int I076 = 0;
  // int I077 = 0;
  // int I078 = 0;
  // int I079 = 0;
  // int I080 = 0;
  // int I081 = 0;
  // int I082 = 0;
  // int I083 = 0;
  // int I084 = 0;
  // int I085 = 0;
  // int I086 = 0;
  // int I087 = 0;
  // int I088 = 0;
  // int I089 = 0;
  // int I090 = 0;
  // int I091 = 0;
  // int I092 = 0;
  // int I093 = 0;
  // int I094 = 0;
  // int I095 = 0;
  // int I096 = 0;
  // int I097 = 0;
  // int I098 = 0;
  // int I099 = 0;
  //
  String Name = "";
  String PackageName = "";
  // String S002 = "";
  // String S003 = "";
  // String S004 = "";
  // String S005 = "";
  // String S006 = "";
  // String S007 = "";
  // String S008 = "";
  // String S009 = "";
  // String S010 = "";
  // String S011 = "";
  // String S012 = "";
  // String S013 = "";
  // String S014 = "";
  // String S015 = "";
  // String S016 = "";
  // String S017 = "";
  // String S018 = "";
  // String S019 = "";
  // String S020 = "";
  // String S021 = "";
  // String S022 = "";
  // String S023 = "";
  // String S024 = "";
  // String S025 = "";
  // String S026 = "";
  // String S027 = "";
  // String S028 = "";
  // String S029 = "";
  // String S030 = "";
  // String S031 = "";
  // String S032 = "";
  // String S033 = "";
  // String S034 = "";
  // String S035 = "";
  // String S036 = "";
  // String S037 = "";
  // String S038 = "";
  // String S039 = "";
  // String S040 = "";
  // String S041 = "";
  // String S042 = "";
  // String S043 = "";
  // String S044 = "";
  // String S045 = "";
  // String S046 = "";
  // String S047 = "";
  // String S048 = "";
  // String S049 = "";
  // String S050 = "";
  // String S051 = "";
  // String S052 = "";
  // String S053 = "";
  // String S054 = "";
  // String S055 = "";
  // String S056 = "";
  // String S057 = "";
  // String S058 = "";
  // String S059 = "";
  // String S060 = "";
  // String S061 = "";
  // String S062 = "";
  // String S063 = "";
  // String S064 = "";
  // String S065 = "";
  // String S066 = "";
  // String S067 = "";
  // String S068 = "";
  // String S069 = "";
  // String S070 = "";
  // String S071 = "";
  // String S072 = "";
  // String S073 = "";
  // String S074 = "";
  // String S075 = "";
  // String S076 = "";
  // String S077 = "";
  // String S078 = "";
  // String S079 = "";
  // String S080 = "";
  // String S081 = "";
  // String S082 = "";
  // String S083 = "";
  // String S084 = "";
  // String S085 = "";
  // String S086 = "";
  // String S087 = "";
  // String S088 = "";
  // String S089 = "";
  // String S090 = "";
  // String S091 = "";
  // String S092 = "";
  // String S093 = "";
  // String S094 = "";
  // String S095 = "";
  // String S096 = "";
  // String S097 = "";
  // String S098 = "";
  // String S099 = "";
  //
  // bool B000 = false;
  // bool B001 = false;
  // bool B002 = false;
  // bool B003 = false;
  // bool B004 = false;
  // bool B005 = false;
  // bool B006 = false;
  // bool B007 = false;
  // bool B008 = false;
  // bool B009 = false;
  // bool B010 = false;
  // bool B011 = false;
  // bool B012 = false;
  // bool B013 = false;
  // bool B014 = false;
  // bool B015 = false;
  // bool B016 = false;
  // bool B017 = false;
  // bool B018 = false;
  // bool B019 = false;
  // bool B020 = false;
  // bool B021 = false;
  // bool B022 = false;
  // bool B023 = false;
  // bool B024 = false;
  // bool B025 = false;
  // bool B026 = false;
  // bool B027 = false;
  // bool B028 = false;
  // bool B029 = false;
  // bool B030 = false;
  //
  // num R000 = 0;
  // num R001 = 0;
  // num R002 = 0;
  // num R003 = 0;
  // num R004 = 0;
  // num R005 = 0;
  // num R006 = 0;
  // num R007 = 0;
  // num R008 = 0;
  // num R009 = 0;
  // num R010 = 0;
  // num R011 = 0;
  // num R012 = 0;
  // num R013 = 0;
  // num R014 = 0;
  // num R015 = 0;
  // num R016 = 0;
  // num R017 = 0;
  // num R018 = 0;
  // num R019 = 0;
  // num R020 = 0;
  // num R021 = 0;
  // num R022 = 0;
  // num R023 = 0;
  // num R024 = 0;
  // num R025 = 0;
  // num R026 = 0;
  // num R027 = 0;
  // num R028 = 0;
  // num R029 = 0;
  // num R030 = 0;
  //
  // DateTime T000 = DateTime.fromMillisecondsSinceEpoch(0);
  // DateTime T001 = DateTime.fromMillisecondsSinceEpoch(0);
  // DateTime T002 = DateTime.fromMillisecondsSinceEpoch(0);
  // DateTime T003 = DateTime.fromMillisecondsSinceEpoch(0);
  // DateTime T004 = DateTime.fromMillisecondsSinceEpoch(0);
  // DateTime T005 = DateTime.fromMillisecondsSinceEpoch(0);
  // DateTime T006 = DateTime.fromMillisecondsSinceEpoch(0);
  // DateTime T007 = DateTime.fromMillisecondsSinceEpoch(0);
  // DateTime T008 = DateTime.fromMillisecondsSinceEpoch(0);
  // DateTime T009 = DateTime.fromMillisecondsSinceEpoch(0);
  // DateTime T010 = DateTime.fromMillisecondsSinceEpoch(0);
  // DateTime T011 = DateTime.fromMillisecondsSinceEpoch(0);
  // DateTime T012 = DateTime.fromMillisecondsSinceEpoch(0);
  // DateTime T013 = DateTime.fromMillisecondsSinceEpoch(0);
  // DateTime T014 = DateTime.fromMillisecondsSinceEpoch(0);
  // DateTime T015 = DateTime.fromMillisecondsSinceEpoch(0);
  // DateTime T016 = DateTime.fromMillisecondsSinceEpoch(0);
  // DateTime T017 = DateTime.fromMillisecondsSinceEpoch(0);
  // DateTime T018 = DateTime.fromMillisecondsSinceEpoch(0);
  // DateTime T019 = DateTime.fromMillisecondsSinceEpoch(0);
  // DateTime T020 = DateTime.fromMillisecondsSinceEpoch(0);
  // DateTime T021 = DateTime.fromMillisecondsSinceEpoch(0);
  // DateTime T022 = DateTime.fromMillisecondsSinceEpoch(0);
  // DateTime T023 = DateTime.fromMillisecondsSinceEpoch(0);
  // DateTime T024 = DateTime.fromMillisecondsSinceEpoch(0);
  // DateTime T025 = DateTime.fromMillisecondsSinceEpoch(0);
  // DateTime T026 = DateTime.fromMillisecondsSinceEpoch(0);
  // DateTime T027 = DateTime.fromMillisecondsSinceEpoch(0);
  // DateTime T028 = DateTime.fromMillisecondsSinceEpoch(0);
  // DateTime T029 = DateTime.fromMillisecondsSinceEpoch(0);
  // DateTime T030 = DateTime.fromMillisecondsSinceEpoch(0);

  //
  // List<dynamic> L000 = [];
  // List<dynamic> L001 = [];
  // List<dynamic> L002 = [];
  // List<dynamic> L003 = [];
  // List<dynamic> L004 = [];
  // List<dynamic> L005 = [];
  // List<dynamic> L006 = [];
  // List<dynamic> L007 = [];
  // List<dynamic> L008 = [];
  // List<dynamic> L009 = [];
  // List<dynamic> L010 = [];
  // List<dynamic> L011 = [];
  // List<dynamic> L012 = [];
  // List<dynamic> L013 = [];
  // List<dynamic> L014 = [];
  // List<dynamic> L015 = [];
  // List<dynamic> L016 = [];
  // List<dynamic> L017 = [];
  // List<dynamic> L018 = [];
  // List<dynamic> L019 = [];
  // List<dynamic> L020 = [];

  // SomeModel C000 = SomeModel();
  // SomeModel C001 = SomeModel();
  // SomeModel C002 = SomeModel();
  // SomeModel C003 = SomeModel();
  // SomeModel C004 = SomeModel();
  // SomeModel C005 = SomeModel();
  // SomeModel C006 = SomeModel();
  // SomeModel C007 = SomeModel();
  // SomeModel C008 = SomeModel();
  // SomeModel C009 = SomeModel();
  // SomeModel C010 = SomeModel();
  // SomeModel C011 = SomeModel();
  // SomeModel C012 = SomeModel();
  // SomeModel C013 = SomeModel();
  // SomeModel C014 = SomeModel();
  // SomeModel C015 = SomeModel();
  // SomeModel C016 = SomeModel();
  // SomeModel C017 = SomeModel();
  // SomeModel C018 = SomeModel();
  // SomeModel C019 = SomeModel();
  // SomeModel C020 = SomeModel();
  //
  // List<SomeModel> J000 = [];
  // List<SomeModel> J001 = [];
  // List<SomeModel> J002 = [];
  // List<SomeModel> J003 = [];
  // List<SomeModel> J004 = [];
  // List<SomeModel> J005 = [];
  // List<SomeModel> J006 = [];
  // List<SomeModel> J007 = [];
  // List<SomeModel> J008 = [];
  // List<SomeModel> J009 = [];
  // List<SomeModel> J010 = [];
  // List<SomeModel> J011 = [];
  // List<SomeModel> J012 = [];
  // List<SomeModel> J013 = [];
  // List<SomeModel> J014 = [];
  // List<SomeModel> J015 = [];
  // List<SomeModel> J016 = [];
  // List<SomeModel> J017 = [];
  // List<SomeModel> J018 = [];
  // List<SomeModel> J019 = [];
  // List<SomeModel> J020 = [];

  ProjectTypeEnum Type = ProjectTypeEnum.NotSelected;
  // SomeEnum E001 = SomeEnum.NotSelected;
  // SomeEnum E002 = SomeEnum.NotSelected;
  // SomeEnum E003 = SomeEnum.NotSelected;
  // SomeEnum E004 = SomeEnum.NotSelected;
  // SomeEnum E005 = SomeEnum.NotSelected;
  // SomeEnum E006 = SomeEnum.NotSelected;
  // SomeEnum E007 = SomeEnum.NotSelected;
  // SomeEnum E008 = SomeEnum.NotSelected;
  // SomeEnum E009 = SomeEnum.NotSelected;
  // SomeEnum E010 = SomeEnum.NotSelected;
  // SomeEnum E011 = SomeEnum.NotSelected;
  // SomeEnum E012 = SomeEnum.NotSelected;
  // SomeEnum E013 = SomeEnum.NotSelected;
  // SomeEnum E014 = SomeEnum.NotSelected;
  // SomeEnum E015 = SomeEnum.NotSelected;
  // SomeEnum E016 = SomeEnum.NotSelected;
  // SomeEnum E017 = SomeEnum.NotSelected;
  // SomeEnum E018 = SomeEnum.NotSelected;
  // SomeEnum E019 = SomeEnum.NotSelected;
  // SomeEnum E020 = SomeEnum.NotSelected;


  @override
  String toString() {
    return jsonEncode({
      // 'I000': I000,
      // 'I001': I001,
      // 'I002': I002,
      // 'I003': I003,
      // 'I004': I004,
      // 'I005': I005,
      // 'I006': I006,
      // 'I007': I007,
      // 'I008': I008,
      // 'I009': I009,
      // 'I010': I010,
      // 'I011': I011,
      // 'I012': I012,
      // 'I013': I013,
      // 'I014': I014,
      // 'I015': I015,
      // 'I016': I016,
      // 'I017': I017,
      // 'I018': I018,
      // 'I019': I019,
      // 'I020': I020,
      // 'I021': I021,
      // 'I022': I022,
      // 'I023': I023,
      // 'I024': I024,
      // 'I025': I025,
      // 'I026': I026,
      // 'I027': I027,
      // 'I028': I028,
      // 'I029': I029,
      // 'I030': I030,
      // 'I031': I031,
      // 'I032': I032,
      // 'I033': I033,
      // 'I034': I034,
      // 'I035': I035,
      // 'I036': I036,
      // 'I037': I037,
      // 'I038': I038,
      // 'I039': I039,
      // 'I040': I040,
      // 'I041': I041,
      // 'I042': I042,
      // 'I043': I043,
      // 'I044': I044,
      // 'I045': I045,
      // 'I046': I046,
      // 'I047': I047,
      // 'I048': I048,
      // 'I049': I049,
      // 'I050': I050,
      // 'I051': I051,
      // 'I052': I052,
      // 'I053': I053,
      // 'I054': I054,
      // 'I055': I055,
      // 'I056': I056,
      // 'I057': I057,
      // 'I058': I058,
      // 'I059': I059,
      // 'I060': I060,
      // 'I061': I061,
      // 'I062': I062,
      // 'I063': I063,
      // 'I064': I064,
      // 'I065': I065,
      // 'I066': I066,
      // 'I067': I067,
      // 'I068': I068,
      // 'I069': I069,
      // 'I070': I070,
      // 'I071': I071,
      // 'I072': I072,
      // 'I073': I073,
      // 'I074': I074,
      // 'I075': I075,
      // 'I076': I076,
      // 'I077': I077,
      // 'I078': I078,
      // 'I079': I079,
      // 'I080': I080,
      // 'I081': I081,
      // 'I082': I082,
      // 'I083': I083,
      // 'I084': I084,
      // 'I085': I085,
      // 'I086': I086,
      // 'I087': I087,
      // 'I088': I088,
      // 'I089': I089,
      // 'I090': I090,
      // 'I091': I091,
      // 'I092': I092,
      // 'I093': I093,
      // 'I094': I094,
      // 'I095': I095,
      // 'I096': I096,
      // 'I097': I097,
      // 'I098': I098,
      // 'I099': I099,
      'Name': Name,
      'PackageName': PackageName,
      // 'S002': S002,
      // 'S003': S003,
      // 'S004': S004,
      // 'S005': S005,
      // 'S006': S006,
      // 'S007': S007,
      // 'S008': S008,
      // 'S009': S009,
      // 'S010': S010,
      // 'S011': S011,
      // 'S012': S012,
      // 'S013': S013,
      // 'S014': S014,
      // 'S015': S015,
      // 'S016': S016,
      // 'S017': S017,
      // 'S018': S018,
      // 'S019': S019,
      // 'S020': S020,
      // 'S021': S021,
      // 'S022': S022,
      // 'S023': S023,
      // 'S024': S024,
      // 'S025': S025,
      // 'S026': S026,
      // 'S027': S027,
      // 'S028': S028,
      // 'S029': S029,
      // 'S030': S030,
      // 'S031': S031,
      // 'S032': S032,
      // 'S033': S033,
      // 'S034': S034,
      // 'S035': S035,
      // 'S036': S036,
      // 'S037': S037,
      // 'S038': S038,
      // 'S039': S039,
      // 'S040': S040,
      // 'S041': S041,
      // 'S042': S042,
      // 'S043': S043,
      // 'S044': S044,
      // 'S045': S045,
      // 'S046': S046,
      // 'S047': S047,
      // 'S048': S048,
      // 'S049': S049,
      // 'S050': S050,
      // 'S051': S051,
      // 'S052': S052,
      // 'S053': S053,
      // 'S054': S054,
      // 'S055': S055,
      // 'S056': S056,
      // 'S057': S057,
      // 'S058': S058,
      // 'S059': S059,
      // 'S060': S060,
      // 'S061': S061,
      // 'S062': S062,
      // 'S063': S063,
      // 'S064': S064,
      // 'S065': S065,
      // 'S066': S066,
      // 'S067': S067,
      // 'S068': S068,
      // 'S069': S069,
      // 'S070': S070,
      // 'S071': S071,
      // 'S072': S072,
      // 'S073': S073,
      // 'S074': S074,
      // 'S075': S075,
      // 'S076': S076,
      // 'S077': S077,
      // 'S078': S078,
      // 'S079': S079,
      // 'S080': S080,
      // 'S081': S081,
      // 'S082': S082,
      // 'S083': S083,
      // 'S084': S084,
      // 'S085': S085,
      // 'S086': S086,
      // 'S087': S087,
      // 'S088': S088,
      // 'S089': S089,
      // 'S090': S090,
      // 'S091': S091,
      // 'S092': S092,
      // 'S093': S093,
      // 'S094': S094,
      // 'S095': S095,
      // 'S096': S096,
      // 'S097': S097,
      // 'S098': S098,
      // 'S099': S099;
      // 'B000': B000,
      // 'B001': B001,
      // 'B002': B002,
      // 'B003': B003,
      // 'B004': B004,
      // 'B005': B005,
      // 'B006': B006,
      // 'B007': B007,
      // 'B008': B008,
      // 'B009': B009,
      // 'B010': B010,
      // 'B011': B011,
      // 'B012': B012,
      // 'B013': B013,
      // 'B014': B014,
      // 'B015': B015,
      // 'B016': B016,
      // 'B017': B017,
      // 'B018': B018,
      // 'B019': B019,
      // 'B020': B020,
      // 'B021': B021,
      // 'B022': B022,
      // 'B023': B023,
      // 'B024': B024,
      // 'B025': B025,
      // 'B026': B026,
      // 'B027': B027,
      // 'B028': B028,
      // 'B029': B029,
      // 'B030': B030,
      // 'R000': R000,
      // 'R001': R001,
      // 'R002': R002,
      // 'R003': R003,
      // 'R004': R004,
      // 'R005': R005,
      // 'R006': R006,
      // 'R007': R007,
      // 'R008': R008,
      // 'R009': R009,
      // 'R010': R010,
      // 'R011': R011,
      // 'R012': R012,
      // 'R013': R013,
      // 'R014': R014,
      // 'R015': R015,
      // 'R016': R016,
      // 'R017': R017,
      // 'R018': R018,
      // 'R019': R019,
      // 'R020': R020,
      // 'R021': R021,
      // 'R022': R022,
      // 'R023': R023,
      // 'R024': R024,
      // 'R025': R025,
      // 'R026': R026,
      // 'R027': R027,
      // 'R028': R028,
      // 'R029': R029,
      // 'R030': R030,
      // 'T000': T000.millisecondsSinceEpoch,
      // 'T001': T001.millisecondsSinceEpoch,
      // 'T002': T002.millisecondsSinceEpoch,
      // 'T003': T003.millisecondsSinceEpoch,
      // 'T004': T004.millisecondsSinceEpoch,
      // 'T005': T005.millisecondsSinceEpoch,
      // 'T006': T006.millisecondsSinceEpoch,
      // 'T007': T007.millisecondsSinceEpoch,
      // 'T008': T008.millisecondsSinceEpoch,
      // 'T009': T009.millisecondsSinceEpoch,
      // 'T010': T010.millisecondsSinceEpoch,
      // 'T011': T011.millisecondsSinceEpoch,
      // 'T012': T012.millisecondsSinceEpoch,
      // 'T013': T013.millisecondsSinceEpoch,
      // 'T014': T014.millisecondsSinceEpoch,
      // 'T015': T015.millisecondsSinceEpoch,
      // 'T016': T016.millisecondsSinceEpoch,
      // 'T017': T017.millisecondsSinceEpoch,
      // 'T018': T018.millisecondsSinceEpoch,
      // 'T019': T019.millisecondsSinceEpoch,
      // 'T020': T020.millisecondsSinceEpoch,
      // 'T021': T021.millisecondsSinceEpoch,
      // 'T022': T022.millisecondsSinceEpoch,
      // 'T023': T023.millisecondsSinceEpoch,
      // 'T024': T024.millisecondsSinceEpoch,
      // 'T025': T025.millisecondsSinceEpoch,
      // 'T026': T026.millisecondsSinceEpoch,
      // 'T027': T027.millisecondsSinceEpoch,
      // 'T028': T028.millisecondsSinceEpoch,
      // 'T029': T029.millisecondsSinceEpoch,
      // 'T030': T030.millisecondsSinceEpoch,
      // 'L000': L000,
      // 'L001': L001,
      // 'L002': L002,
      // 'L003': L003,
      // 'L004': L004,
      // 'L005': L005,
      // 'L006': L006,
      // 'L007': L007,
      // 'L008': L008,
      // 'L009': L009,
      // 'L010': L010,
      // 'L011': L011,
      // 'L012': L012,
      // 'L013': L013,
      // 'L014': L014,
      // 'L015': L015,
      // 'L016': L016,
      // 'L017': L017,
      // 'L018': L018,
      // 'L019': L019,
      // 'L020': L020,
      // 'C000': C000.toString(),
      // 'C001': C001.toString(),
      // 'C002': C002.toString(),
      // 'C003': C003.toString(),
      // 'C004': C004.toString(),
      // 'C005': C005.toString(),
      // 'C006': C006.toString(),
      // 'C007': C007.toString(),
      // 'C008': C008.toString(),
      // 'C009': C009.toString(),
      // 'C010': C010.toString(),
      // 'C011': C011.toString(),
      // 'C012': C012.toString(),
      // 'C013': C013.toString(),
      // 'C014': C014.toString(),
      // 'C015': C015.toString(),
      // 'C016': C016.toString(),
      // 'C017': C017.toString(),
      // 'C018': C018.toString(),
      // 'C019': C019.toString(),
      // 'C020': C020.toString(),
      // 'J000': jsonEncode(J000.map((model) => model.toString()).toList()),
      // 'J001': jsonEncode(J001.map((model) => model.toString()).toList()),
      // 'J002': jsonEncode(J002.map((model) => model.toString()).toList()),
      // 'J003': jsonEncode(J003.map((model) => model.toString()).toList()),
      // 'J004': jsonEncode(J004.map((model) => model.toString()).toList()),
      // 'J005': jsonEncode(J005.map((model) => model.toString()).toList()),
      // 'J006': jsonEncode(J006.map((model) => model.toString()).toList()),
      // 'J007': jsonEncode(J007.map((model) => model.toString()).toList()),
      // 'J008': jsonEncode(J008.map((model) => model.toString()).toList()),
      // 'J009': jsonEncode(J009.map((model) => model.toString()).toList()),
      // 'J010': jsonEncode(J010.map((model) => model.toString()).toList()),
      // 'J011': jsonEncode(J011.map((model) => model.toString()).toList()),
      // 'J012': jsonEncode(J012.map((model) => model.toString()).toList()),
      // 'J013': jsonEncode(J013.map((model) => model.toString()).toList()),
      // 'J014': jsonEncode(J014.map((model) => model.toString()).toList()),
      // 'J015': jsonEncode(J015.map((model) => model.toString()).toList()),
      // 'J016': jsonEncode(J016.map((model) => model.toString()).toList()),
      // 'J017': jsonEncode(J017.map((model) => model.toString()).toList()),
      // 'J018': jsonEncode(J018.map((model) => model.toString()).toList()),
      // 'J019': jsonEncode(J019.map((model) => model.toString()).toList()),
      // 'J020': jsonEncode(J020.map((model) => model.toString()).toList()),

      'Type': Type.toStringValue(),
      // 'E001': E001.toStringValue(),
      // 'E002': E002.toStringValue(),
      // 'E003': E003.toStringValue(),
      // 'E004': E004.toStringValue(),
      // 'E005': E005.toStringValue(),
      // 'E006': E006.toStringValue(),
      // 'E007': E007.toStringValue(),
      // 'E008': E008.toStringValue(),
      // 'E009': E009.toStringValue(),
      // 'E010': E010.toStringValue(),
      // 'E011': E011.toStringValue(),
      // 'E012': E012.toStringValue(),
      // 'E013': E013.toStringValue(),
      // 'E014': E014.toStringValue(),
      // 'E015': E015.toStringValue(),
      // 'E016': E016.toStringValue(),
      // 'E017': E017.toStringValue(),
      // 'E018': E018.toStringValue(),
      // 'E019': E019.toStringValue(),
      // 'E020': E020.toStringValue(),
    });
  }

  static CreationResult fromString(String jsonString) {
    final data = jsonDecode(jsonString);
    var obj = CreationResult();

    // obj.I000 = data['I000'] ?? 0;
    // obj.I001 = data['I001'] ?? 0;
    // obj.I002 = data['I002'] ?? 0;
    // obj.I003 = data['I003'] ?? 0;
    // obj.I004 = data['I004'] ?? 0;
    // obj.I005 = data['I005'] ?? 0;
    // obj.I006 = data['I006'] ?? 0;
    // obj.I007 = data['I007'] ?? 0;
    // obj.I008 = data['I008'] ?? 0;
    // obj.I009 = data['I009'] ?? 0;
    // obj.I010 = data['I010'] ?? 0;
    // obj.I011 = data['I011'] ?? 0;
    // obj.I012 = data['I012'] ?? 0;
    // obj.I013 = data['I013'] ?? 0;
    // obj.I014 = data['I014'] ?? 0;
    // obj.I015 = data['I015'] ?? 0;
    // obj.I016 = data['I016'] ?? 0;
    // obj.I017 = data['I017'] ?? 0;
    // obj.I018 = data['I018'] ?? 0;
    // obj.I019 = data['I019'] ?? 0;
    // obj.I020 = data['I020'] ?? 0;
    // obj.I021 = data['I021'] ?? 0;
    // obj.I022 = data['I022'] ?? 0;
    // obj.I023 = data['I023'] ?? 0;
    // obj.I024 = data['I024'] ?? 0;
    // obj.I025 = data['I025'] ?? 0;
    // obj.I026 = data['I026'] ?? 0;
    // obj.I027 = data['I027'] ?? 0;
    // obj.I028 = data['I028'] ?? 0;
    // obj.I029 = data['I029'] ?? 0;
    // obj.I030 = data['I030'] ?? 0;
    // obj.I031 = data['I031'] ?? 0;
    // obj.I032 = data['I032'] ?? 0;
    // obj.I033 = data['I033'] ?? 0;
    // obj.I034 = data['I034'] ?? 0;
    // obj.I035 = data['I035'] ?? 0;
    // obj.I036 = data['I036'] ?? 0;
    // obj.I037 = data['I037'] ?? 0;
    // obj.I038 = data['I038'] ?? 0;
    // obj.I039 = data['I039'] ?? 0;
    // obj.I040 = data['I040'] ?? 0;
    // obj.I041 = data['I041'] ?? 0;
    // obj.I042 = data['I042'] ?? 0;
    // obj.I043 = data['I043'] ?? 0;
    // obj.I044 = data['I044'] ?? 0;
    // obj.I045 = data['I045'] ?? 0;
    // obj.I046 = data['I046'] ?? 0;
    // obj.I047 = data['I047'] ?? 0;
    // obj.I048 = data['I048'] ?? 0;
    // obj.I049 = data['I049'] ?? 0;
    // obj.I050 = data['I050'] ?? 0;
    // obj.I051 = data['I051'] ?? 0;
    // obj.I052 = data['I052'] ?? 0;
    // obj.I053 = data['I053'] ?? 0;
    // obj.I054 = data['I054'] ?? 0;
    // obj.I055 = data['I055'] ?? 0;
    // obj.I056 = data['I056'] ?? 0;
    // obj.I057 = data['I057'] ?? 0;
    // obj.I058 = data['I058'] ?? 0;
    // obj.I059 = data['I059'] ?? 0;
    // obj.I060 = data['I060'] ?? 0;
    // obj.I061 = data['I061'] ?? 0;
    // obj.I062 = data['I062'] ?? 0;
    // obj.I063 = data['I063'] ?? 0;
    // obj.I064 = data['I064'] ?? 0;
    // obj.I065 = data['I065'] ?? 0;
    // obj.I066 = data['I066'] ?? 0;
    // obj.I067 = data['I067'] ?? 0;
    // obj.I068 = data['I068'] ?? 0;
    // obj.I069 = data['I069'] ?? 0;
    // obj.I070 = data['I070'] ?? 0;
    // obj.I071 = data['I071'] ?? 0;
    // obj.I072 = data['I072'] ?? 0;
    // obj.I073 = data['I073'] ?? 0;
    // obj.I074 = data['I074'] ?? 0;
    // obj.I075 = data['I075'] ?? 0;
    // obj.I076 = data['I076'] ?? 0;
    // obj.I077 = data['I077'] ?? 0;
    // obj.I078 = data['I078'] ?? 0;
    // obj.I079 = data['I079'] ?? 0;
    // obj.I080 = data['I080'] ?? 0;
    // obj.I081 = data['I081'] ?? 0;
    // obj.I082 = data['I082'] ?? 0;
    // obj.I083 = data['I083'] ?? 0;
    // obj.I084 = data['I084'] ?? 0;
    // obj.I085 = data['I085'] ?? 0;
    // obj.I086 = data['I086'] ?? 0;
    // obj.I087 = data['I087'] ?? 0;
    // obj.I088 = data['I088'] ?? 0;
    // obj.I089 = data['I089'] ?? 0;
    // obj.I090 = data['I090'] ?? 0;
    // obj.I091 = data['I091'] ?? 0;
    // obj.I092 = data['I092'] ?? 0;
    // obj.I093 = data['I093'] ?? 0;
    // obj.I094 = data['I094'] ?? 0;
    // obj.I095 = data['I095'] ?? 0;
    // obj.I096 = data['I096'] ?? 0;
    // obj.I097 = data['I097'] ?? 0;
    // obj.I098 = data['I098'] ?? 0;
    // obj.I099 = data['I099'] ?? 0;
    obj.Name = data['Name'] ?? "";
    obj.PackageName = data['PackageName'] ?? "";
    // obj.S002 = data['S002'] ?? "";
    // obj.S003 = data['S003'] ?? "";
    // obj.S004 = data['S004'] ?? "";
    // obj.S005 = data['S005'] ?? "";
    // obj.S006 = data['S006'] ?? "";
    // obj.S007 = data['S007'] ?? "";
    // obj.S008 = data['S008'] ?? "";
    // obj.S009 = data['S009'] ?? "";
    // obj.S010 = data['S010'] ?? "";
    // obj.S011 = data['S011'] ?? "";
    // obj.S012 = data['S012'] ?? "";
    // obj.S013 = data['S013'] ?? "";
    // obj.S014 = data['S014'] ?? "";
    // obj.S015 = data['S015'] ?? "";
    // obj.S016 = data['S016'] ?? "";
    // obj.S017 = data['S017'] ?? "";
    // obj.S018 = data['S018'] ?? "";
    // obj.S019 = data['S019'] ?? "";
    // obj.S020 = data['S020'] ?? "";
    // obj.S021 = data['S021'] ?? "";
    // obj.S022 = data['S022'] ?? "";
    // obj.S023 = data['S023'] ?? "";
    // obj.S024 = data['S024'] ?? "";
    // obj.S025 = data['S025'] ?? "";
    // obj.S026 = data['S026'] ?? "";
    // obj.S027 = data['S027'] ?? "";
    // obj.S028 = data['S028'] ?? "";
    // obj.S029 = data['S029'] ?? "";
    // obj.S030 = data['S030'] ?? "";
    // obj.S031 = data['S031'] ?? "";
    // obj.S032 = data['S032'] ?? "";
    // obj.S033 = data['S033'] ?? "";
    // obj.S034 = data['S034'] ?? "";
    // obj.S035 = data['S035'] ?? "";
    // obj.S036 = data['S036'] ?? "";
    // obj.S037 = data['S037'] ?? "";
    // obj.S038 = data['S038'] ?? "";
    // obj.S039 = data['S039'] ?? "";
    // obj.S040 = data['S040'] ?? "";
    // obj.S041 = data['S041'] ?? "";
    // obj.S042 = data['S042'] ?? "";
    // obj.S043 = data['S043'] ?? "";
    // obj.S044 = data['S044'] ?? "";
    // obj.S045 = data['S045'] ?? "";
    // obj.S046 = data['S046'] ?? "";
    // obj.S047 = data['S047'] ?? "";
    // obj.S048 = data['S048'] ?? "";
    // obj.S049 = data['S049'] ?? "";
    // obj.S050 = data['S050'] ?? "";
    // obj.S051 = data['S051'] ?? "";
    // obj.S052 = data['S052'] ?? "";
    // obj.S053 = data['S053'] ?? "";
    // obj.S054 = data['S054'] ?? "";
    // obj.S055 = data['S055'] ?? "";
    // obj.S056 = data['S056'] ?? "";
    // obj.S057 = data['S057'] ?? "";
    // obj.S058 = data['S058'] ?? "";
    // obj.S059 = data['S059'] ?? "";
    // obj.S060 = data['S060'] ?? "";
    // obj.S061 = data['S061'] ?? "";
    // obj.S062 = data['S062'] ?? "";
    // obj.S063 = data['S063'] ?? "";
    // obj.S064 = data['S064'] ?? "";
    // obj.S065 = data['S065'] ?? "";
    // obj.S066 = data['S066'] ?? "";
    // obj.S067 = data['S067'] ?? "";
    // obj.S068 = data['S068'] ?? "";
    // obj.S069 = data['S069'] ?? "";
    // obj.S070 = data['S070'] ?? "";
    // obj.S071 = data['S071'] ?? "";
    // obj.S072 = data['S072'] ?? "";
    // obj.S073 = data['S073'] ?? "";
    // obj.S074 = data['S074'] ?? "";
    // obj.S075 = data['S075'] ?? "";
    // obj.S076 = data['S076'] ?? "";
    // obj.S077 = data['S077'] ?? "";
    // obj.S078 = data['S078'] ?? "";
    // obj.S079 = data['S079'] ?? "";
    // obj.S080 = data['S080'] ?? "";
    // obj.S081 = data['S081'] ?? "";
    // obj.S082 = data['S082'] ?? "";
    // obj.S083 = data['S083'] ?? "";
    // obj.S084 = data['S084'] ?? "";
    // obj.S085 = data['S085'] ?? "";
    // obj.S086 = data['S086'] ?? "";
    // obj.S087 = data['S087'] ?? "";
    // obj.S088 = data['S088'] ?? "";
    // obj.S089 = data['S089'] ?? "";
    // obj.S090 = data['S090'] ?? "";
    // obj.S091 = data['S091'] ?? "";
    // obj.S092 = data['S092'] ?? "";
    // obj.S093 = data['S093'] ?? "";
    // obj.S094 = data['S094'] ?? "";
    // obj.S095 = data['S095'] ?? "";
    // obj.S096 = data['S096'] ?? "";
    // obj.S097 = data['S097'] ?? "";
    // obj.S098 = data['S098'] ?? "";
    // obj.S099 = data['S099'] ?? "";
    // obj.B000 = data['B000'] ?? false;
    // obj.B001 = data['B001'] ?? false;
    // obj.B002 = data['B002'] ?? false;
    // obj.B003 = data['B003'] ?? false;
    // obj.B004 = data['B004'] ?? false;
    // obj.B005 = data['B005'] ?? false;
    // obj.B006 = data['B006'] ?? false;
    // obj.B007 = data['B007'] ?? false;
    // obj.B008 = data['B008'] ?? false;
    // obj.B009 = data['B009'] ?? false;
    // obj.B010 = data['B010'] ?? false;
    // obj.B011 = data['B011'] ?? false;
    // obj.B012 = data['B012'] ?? false;
    // obj.B013 = data['B013'] ?? false;
    // obj.B014 = data['B014'] ?? false;
    // obj.B015 = data['B015'] ?? false;
    // obj.B016 = data['B016'] ?? false;
    // obj.B017 = data['B017'] ?? false;
    // obj.B018 = data['B018'] ?? false;
    // obj.B019 = data['B019'] ?? false;
    // obj.B020 = data['B020'] ?? false;
    // obj.B021 = data['B021'] ?? false;
    // obj.B022 = data['B022'] ?? false;
    // obj.B023 = data['B023'] ?? false;
    // obj.B024 = data['B024'] ?? false;
    // obj.B025 = data['B025'] ?? false;
    // obj.B026 = data['B026'] ?? false;
    // obj.B027 = data['B027'] ?? false;
    // obj.B028 = data['B028'] ?? false;
    // obj.B029 = data['B029'] ?? false;
    // obj.B030 = data['B030'] ?? false;
    // obj.R000 = data['R000'] ?? 0;
    // obj.R001 = data['R001'] ?? 0;
    // obj.R002 = data['R002'] ?? 0;
    // obj.R003 = data['R003'] ?? 0;
    // obj.R004 = data['R004'] ?? 0;
    // obj.R005 = data['R005'] ?? 0;
    // obj.R006 = data['R006'] ?? 0;
    // obj.R007 = data['R007'] ?? 0;
    // obj.R008 = data['R008'] ?? 0;
    // obj.R009 = data['R009'] ?? 0;
    // obj.R010 = data['R010'] ?? 0;
    // obj.R011 = data['R011'] ?? 0;
    // obj.R012 = data['R012'] ?? 0;
    // obj.R013 = data['R013'] ?? 0;
    // obj.R014 = data['R014'] ?? 0;
    // obj.R015 = data['R015'] ?? 0;
    // obj.R016 = data['R016'] ?? 0;
    // obj.R017 = data['R017'] ?? 0;
    // obj.R018 = data['R018'] ?? 0;
    // obj.R019 = data['R019'] ?? 0;
    // obj.R020 = data['R020'] ?? 0;
    // obj.R021 = data['R021'] ?? 0;
    // obj.R022 = data['R022'] ?? 0;
    // obj.R023 = data['R023'] ?? 0;
    // obj.R024 = data['R024'] ?? 0;
    // obj.R025 = data['R025'] ?? 0;
    // obj.R026 = data['R026'] ?? 0;
    // obj.R027 = data['R027'] ?? 0;
    // obj.R028 = data['R028'] ?? 0;
    // obj.R029 = data['R029'] ?? 0;
    // obj.R030 = data['R030'] ?? 0;
    // obj.T000 = DateTime.fromMillisecondsSinceEpoch(data['T000'] ?? 0);
    // obj.T001 = DateTime.fromMillisecondsSinceEpoch(data['T001'] ?? 0);
    // obj.T002 = DateTime.fromMillisecondsSinceEpoch(data['T002'] ?? 0);
    // obj.T003 = DateTime.fromMillisecondsSinceEpoch(data['T003'] ?? 0);
    // obj.T004 = DateTime.fromMillisecondsSinceEpoch(data['T004'] ?? 0);
    // obj.T005 = DateTime.fromMillisecondsSinceEpoch(data['T005'] ?? 0);
    // obj.T006 = DateTime.fromMillisecondsSinceEpoch(data['T006'] ?? 0);
    // obj.T007 = DateTime.fromMillisecondsSinceEpoch(data['T007'] ?? 0);
    // obj.T008 = DateTime.fromMillisecondsSinceEpoch(data['T008'] ?? 0);
    // obj.T009 = DateTime.fromMillisecondsSinceEpoch(data['T009'] ?? 0);
    // obj.T010 = DateTime.fromMillisecondsSinceEpoch(data['T010'] ?? 0);
    // obj.T011 = DateTime.fromMillisecondsSinceEpoch(data['T011'] ?? 0);
    // obj.T012 = DateTime.fromMillisecondsSinceEpoch(data['T012'] ?? 0);
    // obj.T013 = DateTime.fromMillisecondsSinceEpoch(data['T013'] ?? 0);
    // obj.T014 = DateTime.fromMillisecondsSinceEpoch(data['T014'] ?? 0);
    // obj.T015 = DateTime.fromMillisecondsSinceEpoch(data['T015'] ?? 0);
    // obj.T016 = DateTime.fromMillisecondsSinceEpoch(data['T016'] ?? 0);
    // obj.T017 = DateTime.fromMillisecondsSinceEpoch(data['T017'] ?? 0);
    // obj.T018 = DateTime.fromMillisecondsSinceEpoch(data['T018'] ?? 0);
    // obj.T019 = DateTime.fromMillisecondsSinceEpoch(data['T019'] ?? 0);
    // obj.T020 = DateTime.fromMillisecondsSinceEpoch(data['T020'] ?? 0);
    // obj.T021 = DateTime.fromMillisecondsSinceEpoch(data['T021'] ?? 0);
    // obj.T022 = DateTime.fromMillisecondsSinceEpoch(data['T022'] ?? 0);
    // obj.T023 = DateTime.fromMillisecondsSinceEpoch(data['T023'] ?? 0);
    // obj.T024 = DateTime.fromMillisecondsSinceEpoch(data['T024'] ?? 0);
    // obj.T025 = DateTime.fromMillisecondsSinceEpoch(data['T025'] ?? 0);
    // obj.T026 = DateTime.fromMillisecondsSinceEpoch(data['T026'] ?? 0);
    // obj.T027 = DateTime.fromMillisecondsSinceEpoch(data['T027'] ?? 0);
    // obj.T028 = DateTime.fromMillisecondsSinceEpoch(data['T028'] ?? 0);
    // obj.T029 = DateTime.fromMillisecondsSinceEpoch(data['T029'] ?? 0);
    // obj.T030 = DateTime.fromMillisecondsSinceEpoch(data['T030'] ?? 0);
    // obj.L000 = List<String>.from(data['L000'] ?? []);
    // obj.L001 = List<String>.from(data['L001'] ?? []);
    // obj.L002 = List<String>.from(data['L002'] ?? []);
    // obj.L003 = List<String>.from(data['L003'] ?? []);
    // obj.L004 = List<String>.from(data['L004'] ?? []);
    // obj.L005 = List<String>.from(data['L005'] ?? []);
    // obj.L006 = List<String>.from(data['L006'] ?? []);
    // obj.L007 = List<String>.from(data['L007'] ?? []);
    // obj.L008 = List<String>.from(data['L008'] ?? []);
    // obj.L009 = List<String>.from(data['L009'] ?? []);
    // obj.L010 = List<String>.from(data['L010'] ?? []);
    // obj.L011 = List<String>.from(data['L011'] ?? []);
    // obj.L012 = List<String>.from(data['L012'] ?? []);
    // obj.L013 = List<String>.from(data['L013'] ?? []);
    // obj.L014 = List<String>.from(data['L014'] ?? []);
    // obj.L015 = List<String>.from(data['L015'] ?? []);
    // obj.L016 = List<String>.from(data['L016'] ?? []);
    // obj.L017 = List<String>.from(data['L017'] ?? []);
    // obj.L018 = List<String>.from(data['L018'] ?? []);
    // obj.L019 = List<String>.from(data['L019'] ?? []);
    // obj.L020 = List<String>.from(data['L020'] ?? []);

    // obj.C000 = SomeModel.fromString(data['C000'] ?? SomeModel().toString());
    // obj.C001 = SomeModel.fromString(data['C001'] ?? SomeModel().toString());
    // obj.C002 = SomeModel.fromString(data['C002'] ?? SomeModel().toString());
    // obj.C003 = SomeModel.fromString(data['C003'] ?? SomeModel().toString());
    // obj.C004 = SomeModel.fromString(data['C004'] ?? SomeModel().toString());
    // obj.C005 = SomeModel.fromString(data['C005'] ?? SomeModel().toString());
    // obj.C006 = SomeModel.fromString(data['C006'] ?? SomeModel().toString());
    // obj.C007 = SomeModel.fromString(data['C007'] ?? SomeModel().toString());
    // obj.C008 = SomeModel.fromString(data['C008'] ?? SomeModel().toString());
    // obj.C009 = SomeModel.fromString(data['C009'] ?? SomeModel().toString());
    // obj.C010 = SomeModel.fromString(data['C010'] ?? SomeModel().toString());
    // obj.C011 = SomeModel.fromString(data['C011'] ?? SomeModel().toString());
    // obj.C012 = SomeModel.fromString(data['C012'] ?? SomeModel().toString());
    // obj.C013 = SomeModel.fromString(data['C013'] ?? SomeModel().toString());
    // obj.C014 = SomeModel.fromString(data['C014'] ?? SomeModel().toString());
    // obj.C015 = SomeModel.fromString(data['C015'] ?? SomeModel().toString());
    // obj.C016 = SomeModel.fromString(data['C016'] ?? SomeModel().toString());
    // obj.C017 = SomeModel.fromString(data['C017'] ?? SomeModel().toString());
    // obj.C018 = SomeModel.fromString(data['C018'] ?? SomeModel().toString());
    // obj.C019 = SomeModel.fromString(data['C019'] ?? SomeModel().toString());
    // obj.C020 = SomeModel.fromString(data['C020'] ?? SomeModel().toString());

    // obj.J000 = List<String>.from(data['J000'] is String ? jsonDecode(data['J000']) : (data['J000'] ?? [])).map((item) => SomeModel.fromString(item)).toList();
    // obj.J001 = List<String>.from(data['J001'] is String ? jsonDecode(data['J001']) : (data['J001'] ?? [])).map((item) => SomeModel.fromString(item)).toList();
    // obj.J002 = List<String>.from(data['J002'] is String ? jsonDecode(data['J002']) : (data['J002'] ?? [])).map((item) => SomeModel.fromString(item)).toList();
    // obj.J003 = List<String>.from(data['J003'] is String ? jsonDecode(data['J003']) : (data['J003'] ?? [])).map((item) => SomeModel.fromString(item)).toList();
    // obj.J004 = List<String>.from(data['J004'] is String ? jsonDecode(data['J004']) : (data['J004'] ?? [])).map((item) => SomeModel.fromString(item)).toList();
    // obj.J005 = List<String>.from(data['J005'] is String ? jsonDecode(data['J005']) : (data['J005'] ?? [])).map((item) => SomeModel.fromString(item)).toList();
    // obj.J006 = List<String>.from(data['J006'] is String ? jsonDecode(data['J006']) : (data['J006'] ?? [])).map((item) => SomeModel.fromString(item)).toList();
    // obj.J007 = List<String>.from(data['J007'] is String ? jsonDecode(data['J007']) : (data['J007'] ?? [])).map((item) => SomeModel.fromString(item)).toList();
    // obj.J008 = List<String>.from(data['J008'] is String ? jsonDecode(data['J008']) : (data['J008'] ?? [])).map((item) => SomeModel.fromString(item)).toList();
    // obj.J009 = List<String>.from(data['J009'] is String ? jsonDecode(data['J009']) : (data['J009'] ?? [])).map((item) => SomeModel.fromString(item)).toList();
    // obj.J010 = List<String>.from(data['J010'] is String ? jsonDecode(data['J010']) : (data['J010'] ?? [])).map((item) => SomeModel.fromString(item)).toList();
    // obj.J011 = List<String>.from(data['J011'] is String ? jsonDecode(data['J011']) : (data['J011'] ?? [])).map((item) => SomeModel.fromString(item)).toList();
    // obj.J012 = List<String>.from(data['J012'] is String ? jsonDecode(data['J012']) : (data['J012'] ?? [])).map((item) => SomeModel.fromString(item)).toList();
    // obj.J013 = List<String>.from(data['J013'] is String ? jsonDecode(data['J013']) : (data['J013'] ?? [])).map((item) => SomeModel.fromString(item)).toList();
    // obj.J014 = List<String>.from(data['J014'] is String ? jsonDecode(data['J014']) : (data['J014'] ?? [])).map((item) => SomeModel.fromString(item)).toList();
    // obj.J015 = List<String>.from(data['J015'] is String ? jsonDecode(data['J015']) : (data['J015'] ?? [])).map((item) => SomeModel.fromString(item)).toList();
    // obj.J016 = List<String>.from(data['J016'] is String ? jsonDecode(data['J016']) : (data['J016'] ?? [])).map((item) => SomeModel.fromString(item)).toList();
    // obj.J017 = List<String>.from(data['J017'] is String ? jsonDecode(data['J017']) : (data['J017'] ?? [])).map((item) => SomeModel.fromString(item)).toList();
    // obj.J018 = List<String>.from(data['J018'] is String ? jsonDecode(data['J018']) : (data['J018'] ?? [])).map((item) => SomeModel.fromString(item)).toList();
    // obj.J019 = List<String>.from(data['J019'] is String ? jsonDecode(data['J019']) : (data['J019'] ?? [])).map((item) => SomeModel.fromString(item)).toList();
    // obj.J020 = List<String>.from(data['J020'] is String ? jsonDecode(data['J020']) : (data['J020'] ?? [])).map((item) => SomeModel.fromString(item)).toList();

    obj.Type = ProjectTypeEnum.fromString(data['Type'] ?? ProjectTypeEnum.NotSelected.toStringValue());
    // obj.E001 = SomeEnum.fromString(data['E001'] ?? SomeEnum.NotSelected.toStringValue());
    // obj.E002 = SomeEnum.fromString(data['E002'] ?? SomeEnum.NotSelected.toStringValue());
    // obj.E003 = SomeEnum.fromString(data['E003'] ?? SomeEnum.NotSelected.toStringValue());
    // obj.E004 = SomeEnum.fromString(data['E004'] ?? SomeEnum.NotSelected.toStringValue());
    // obj.E005 = SomeEnum.fromString(data['E005'] ?? SomeEnum.NotSelected.toStringValue());
    // obj.E006 = SomeEnum.fromString(data['E006'] ?? SomeEnum.NotSelected.toStringValue());
    // obj.E007 = SomeEnum.fromString(data['E007'] ?? SomeEnum.NotSelected.toStringValue());
    // obj.E008 = SomeEnum.fromString(data['E008'] ?? SomeEnum.NotSelected.toStringValue());
    // obj.E009 = SomeEnum.fromString(data['E009'] ?? SomeEnum.NotSelected.toStringValue());
    // obj.E010 = SomeEnum.fromString(data['E010'] ?? SomeEnum.NotSelected.toStringValue());
    // obj.E011 = SomeEnum.fromString(data['E011'] ?? SomeEnum.NotSelected.toStringValue());
    // obj.E012 = SomeEnum.fromString(data['E012'] ?? SomeEnum.NotSelected.toStringValue());
    // obj.E013 = SomeEnum.fromString(data['E013'] ?? SomeEnum.NotSelected.toStringValue());
    // obj.E014 = SomeEnum.fromString(data['E014'] ?? SomeEnum.NotSelected.toStringValue());
    // obj.E015 = SomeEnum.fromString(data['E015'] ?? SomeEnum.NotSelected.toStringValue());
    // obj.E016 = SomeEnum.fromString(data['E016'] ?? SomeEnum.NotSelected.toStringValue());
    // obj.E017 = SomeEnum.fromString(data['E017'] ?? SomeEnum.NotSelected.toStringValue());
    // obj.E018 = SomeEnum.fromString(data['E018'] ?? SomeEnum.NotSelected.toStringValue());
    // obj.E019 = SomeEnum.fromString(data['E019'] ?? SomeEnum.NotSelected.toStringValue());
    // obj.E020 = SomeEnum.fromString(data['E020'] ?? SomeEnum.NotSelected.toStringValue());

    return obj;
  }

}