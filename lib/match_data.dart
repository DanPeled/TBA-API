class MatchData {
  String key;
  String compLevel;
  int setNumber;
  int matchNumber;
  Alliances alliances;
  String winningAlliance;
  String eventKey;
  int time;
  int actualTime;
  int predictedTime;
  int postResultTime;
  ScoreBreakdown scoreBreakdown;
  List<Video> videos;

  MatchData({
    required this.key,
    required this.compLevel,
    required this.setNumber,
    required this.matchNumber,
    required this.alliances,
    required this.winningAlliance,
    required this.eventKey,
    required this.time,
    this.actualTime = 0,
    this.predictedTime = 0,
    this.postResultTime = 0,
    required this.scoreBreakdown,
    required this.videos,
  });

  factory MatchData.fromJson(Map<String, dynamic> json) {
    return MatchData(
      key: json['key'] ?? '',
      compLevel: json['comp_level'] ?? '',
      setNumber: json['set_number'] ?? 0,
      matchNumber: json['match_number'] ?? 0,
      alliances: Alliances.fromJson(json['alliances'] ?? {}),
      winningAlliance: json['winning_alliance'] ?? '',
      eventKey: json['event_key'] ?? '',
      time: json['time'] ?? 0,
      actualTime: json['actual_time'] ?? 0,
      predictedTime: json['predicted_time'] ?? 0,
      postResultTime: json['post_result_time'] ?? 0,
      scoreBreakdown: ScoreBreakdown.fromJson(json['score_breakdown'] ?? {}),
      videos: (json['videos'] as List<dynamic>?)
              ?.map((video) => Video.fromJson(video as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'comp_level': compLevel,
      'set_number': setNumber,
      'match_number': matchNumber,
      'alliances': alliances.toJson(),
      'winning_alliance': winningAlliance,
      'event_key': eventKey,
      'time': time,
      'actual_time': actualTime,
      'predicted_time': predictedTime,
      'post_result_time': postResultTime,
      'score_breakdown': scoreBreakdown.toJson(),
      'videos': videos.map((video) => video.toJson()).toList(),
    };
  }
}

class Alliances {
  Alliance red;
  Alliance blue;

  Alliances({
    required this.red,
    required this.blue,
  });

  factory Alliances.fromJson(Map<String, dynamic> json) {
    return Alliances(
      red: Alliance.fromJson(json['red'] ?? {}),
      blue: Alliance.fromJson(json['blue'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'red': red.toJson(),
      'blue': blue.toJson(),
    };
  }
}

class Alliance {
  int score;
  List<String> teamKeys;
  List<String> surrogateTeamKeys;
  List<String> dqTeamKeys;

  Alliance({
    required this.score,
    required this.teamKeys,
    required this.surrogateTeamKeys,
    required this.dqTeamKeys,
  });

  factory Alliance.fromJson(Map<String, dynamic> json) {
    return Alliance(
      score: json['score'] ?? 0,
      teamKeys: List<String>.from(json['team_keys'] ?? []),
      surrogateTeamKeys: List<String>.from(json['surrogate_team_keys'] ?? []),
      dqTeamKeys: List<String>.from(json['dq_team_keys'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'score': score,
      'team_keys': teamKeys,
      'surrogate_team_keys': surrogateTeamKeys,
      'dq_team_keys': dqTeamKeys,
    };
  }
}

class ScoreBreakdown {
  BreakdownDetails blue;
  BreakdownDetails red;
  String coopertition;
  int coopertitionPoints;

  ScoreBreakdown({
    required this.blue,
    required this.red,
    this.coopertition = 'None',
    this.coopertitionPoints = 0,
  });

  factory ScoreBreakdown.fromJson(Map<String, dynamic> json) {
    return ScoreBreakdown(
      blue: BreakdownDetails.fromJson(json['blue'] ?? {}),
      red: BreakdownDetails.fromJson(json['red'] ?? {}),
      coopertition: json['coopertition'] ?? 'None',
      coopertitionPoints: json['coopertition_points'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'blue': blue.toJson(),
      'red': red.toJson(),
      'coopertition': coopertition,
      'coopertition_points': coopertitionPoints,
    };
  }
}

class BreakdownDetails {
  int autoPoints;
  int teleopPoints;
  int containerPoints;
  int totePoints;
  int litterPoints;
  int foulPoints;
  int adjustPoints;
  int totalPoints;
  int foulCount;
  int toteCountFar;
  int toteCountNear;
  bool toteSet;
  bool toteStack;
  int containerCountLevel1;
  int containerCountLevel2;
  int containerCountLevel3;
  int containerCountLevel4;
  int containerCountLevel5;
  int containerCountLevel6;
  bool containerSet;
  int litterCountContainer;
  int litterCountLandfill;
  int litterCountUnprocessed;
  bool robotSet;

  BreakdownDetails({
    this.autoPoints = 0,
    this.teleopPoints = 0,
    this.containerPoints = 0,
    this.totePoints = 0,
    this.litterPoints = 0,
    this.foulPoints = 0,
    this.adjustPoints = 0,
    this.totalPoints = 0,
    this.foulCount = 0,
    this.toteCountFar = 0,
    this.toteCountNear = 0,
    this.toteSet = false,
    this.toteStack = false,
    this.containerCountLevel1 = 0,
    this.containerCountLevel2 = 0,
    this.containerCountLevel3 = 0,
    this.containerCountLevel4 = 0,
    this.containerCountLevel5 = 0,
    this.containerCountLevel6 = 0,
    this.containerSet = false,
    this.litterCountContainer = 0,
    this.litterCountLandfill = 0,
    this.litterCountUnprocessed = 0,
    this.robotSet = false,
  });

  factory BreakdownDetails.fromJson(Map<String, dynamic> json) {
    return BreakdownDetails(
      autoPoints: json['auto_points'] ?? 0,
      teleopPoints: json['teleop_points'] ?? 0,
      containerPoints: json['container_points'] ?? 0,
      totePoints: json['tote_points'] ?? 0,
      litterPoints: json['litter_points'] ?? 0,
      foulPoints: json['foul_points'] ?? 0,
      adjustPoints: json['adjust_points'] ?? 0,
      totalPoints: json['total_points'] ?? 0,
      foulCount: json['foul_count'] ?? 0,
      toteCountFar: json['tote_count_far'] ?? 0,
      toteCountNear: json['tote_count_near'] ?? 0,
      toteSet: json['tote_set'] ?? false,
      toteStack: json['tote_stack'] ?? false,
      containerCountLevel1: json['container_count_level1'] ?? 0,
      containerCountLevel2: json['container_count_level2'] ?? 0,
      containerCountLevel3: json['container_count_level3'] ?? 0,
      containerCountLevel4: json['container_count_level4'] ?? 0,
      containerCountLevel5: json['container_count_level5'] ?? 0,
      containerCountLevel6: json['container_count_level6'] ?? 0,
      containerSet: json['container_set'] ?? false,
      litterCountContainer: json['litter_count_container'] ?? 0,
      litterCountLandfill: json['litter_count_landfill'] ?? 0,
      litterCountUnprocessed: json['litter_count_unprocessed'] ?? 0,
      robotSet: json['robot_set'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'auto_points': autoPoints,
      'teleop_points': teleopPoints,
      'container_points': containerPoints,
      'tote_points': totePoints,
      'litter_points': litterPoints,
      'foul_points': foulPoints,
      'adjust_points': adjustPoints,
      'total_points': totalPoints,
      'foul_count': foulCount,
      'tote_count_far': toteCountFar,
      'tote_count_near': toteCountNear,
      'tote_set': toteSet,
      'tote_stack': toteStack,
      'container_count_level1': containerCountLevel1,
      'container_count_level2': containerCountLevel2,
      'container_count_level3': containerCountLevel3,
      'container_count_level4': containerCountLevel4,
      'container_count_level5': containerCountLevel5,
      'container_count_level6': containerCountLevel6,
      'container_set': containerSet,
      'litter_count_container': litterCountContainer,
      'litter_count_landfill': litterCountLandfill,
      'litter_count_unprocessed': litterCountUnprocessed,
      'robot_set': robotSet,
    };
  }
}

class Video {
  String key;
  String type;

  Video({
    required this.key,
    required this.type,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      key: json['key'] ?? '',
      type: json['type'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'type': type,
    };
  }
}
