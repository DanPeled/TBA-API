class TeamYearStatus {
  Map<String, TeamStatus> statuses;

  TeamYearStatus({required this.statuses});

  factory TeamYearStatus.fromJson(Map<String, dynamic> json) {
    final statuses = <String, TeamStatus>{};
    json.forEach((key, value) {
      statuses[key] = TeamStatus.fromJson(value);
    });
    return TeamYearStatus(statuses: statuses);
  }

  Map<String, dynamic> toJson() {
    return statuses.map((key, value) => MapEntry(key, value.toJson()));
  }
}

class TeamStatus {
  QualDetail qual;
  Alliance alliance;
  Playoff playoff;
  String allianceStatusStr;
  String playoffStatusStr;
  String overallStatusStr;
  String nextMatchKey;
  String lastMatchKey;

  TeamStatus({
    required this.qual,
    required this.alliance,
    required this.playoff,
    this.allianceStatusStr = '',
    this.playoffStatusStr = '',
    this.overallStatusStr = '',
    this.nextMatchKey = '',
    this.lastMatchKey = '',
  });

  factory TeamStatus.fromJson(Map<String, dynamic> json) {
    return TeamStatus(
      qual: QualDetail.fromJson(json['qual'] ?? {}),
      alliance: Alliance.fromJson(json['alliance'] ?? {}),
      playoff: Playoff.fromJson(json['playoff'] ?? {}),
      allianceStatusStr: json['alliance_status_str'] ?? '',
      playoffStatusStr: json['playoff_status_str'] ?? '',
      overallStatusStr: json['overall_status_str'] ?? '',
      nextMatchKey: json['next_match_key'] ?? '',
      lastMatchKey: json['last_match_key'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'qual': qual.toJson(),
      'alliance': alliance.toJson(),
      'playoff': playoff.toJson(),
      'alliance_status_str': allianceStatusStr,
      'playoff_status_str': playoffStatusStr,
      'overall_status_str': overallStatusStr,
      'next_match_key': nextMatchKey,
      'last_match_key': lastMatchKey,
    };
  }
}

class QualDetail {
  int numTeams;
  Ranking ranking;
  List<SortOrderInfo> sortOrderInfo;
  String status;

  QualDetail({
    this.numTeams = 0,
    required this.ranking,
    List<SortOrderInfo>? sortOrderInfo,
    this.status = '',
  }) : sortOrderInfo = sortOrderInfo ?? [];

  factory QualDetail.fromJson(Map<String, dynamic> json) {
    return QualDetail(
      numTeams: json['num_teams'] ?? 0,
      ranking: Ranking.fromJson(json['ranking'] ?? {}),
      sortOrderInfo: (json['sort_order_info'] as List<dynamic>?)
              ?.map((info) =>
                  SortOrderInfo.fromJson(info as Map<String, dynamic>))
              .toList() ??
          [],
      status: json['status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'num_teams': numTeams,
      'ranking': ranking.toJson(),
      'sort_order_info': sortOrderInfo.map((info) => info.toJson()).toList(),
      'status': status,
    };
  }
}

class Ranking {
  int matchesPlayed;
  double qualAverage;
  List<double> sortOrders;
  Record record;
  int rank;
  int dq;
  String teamKey;

  Ranking({
    this.matchesPlayed = 0,
    this.qualAverage = 0.0,
    List<double>? sortOrders,
    required this.record,
    this.rank = 0,
    this.dq = 0,
    this.teamKey = '',
  }) : sortOrders = sortOrders ?? [];

  factory Ranking.fromJson(Map<String, dynamic> json) {
    return Ranking(
      matchesPlayed: json['matches_played'] ?? 0,
      qualAverage: (json['qual_average'] as num?)?.toDouble() ?? 0.0,
      sortOrders: List<double>.from(json['sort_orders'] ?? []),
      record: Record.fromJson(json['record'] ?? {}),
      rank: json['rank'] ?? 0,
      dq: json['dq'] ?? 0,
      teamKey: json['team_key'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'matches_played': matchesPlayed,
      'qual_average': qualAverage,
      'sort_orders': sortOrders,
      'record': record.toJson(),
      'rank': rank,
      'dq': dq,
      'team_key': teamKey,
    };
  }
}

class Record {
  int losses;
  int wins;
  int ties;

  Record({
    this.losses = 0,
    this.wins = 0,
    this.ties = 0,
  });

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
      losses: json['losses'] ?? 0,
      wins: json['wins'] ?? 0,
      ties: json['ties'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'losses': losses,
      'wins': wins,
      'ties': ties,
    };
  }
}

class SortOrderInfo {
  int precision;
  String name;

  SortOrderInfo({
    this.precision = 0,
    this.name = '',
  });

  factory SortOrderInfo.fromJson(Map<String, dynamic> json) {
    return SortOrderInfo(
      precision: json['precision'] ?? 0,
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'precision': precision,
      'name': name,
    };
  }
}

class Alliance {
  String name;
  int number;
  Backup backup;
  int pick;

  Alliance({
    this.name = '',
    this.number = 0,
    required this.backup,
    this.pick = 0,
  });

  factory Alliance.fromJson(Map<String, dynamic> json) {
    return Alliance(
      name: json['name'] ?? '',
      number: json['number'] ?? 0,
      backup: Backup.fromJson(json['backup'] ?? {}),
      pick: json['pick'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'number': number,
      'backup': backup.toJson(),
      'pick': pick,
    };
  }
}

class Backup {
  String outString;
  String inString;

  Backup({
    this.outString = '',
    this.inString = '',
  });

  factory Backup.fromJson(Map<String, dynamic> json) {
    return Backup(
      outString: json['out'] ?? '',
      inString: json['in'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'out': outString,
      'in': inString,
    };
  }
}

class Playoff {
  String level;
  Record currentLevelRecord;
  Record record;
  String status;
  double playoffAverage;

  Playoff({
    this.level = 'qm',
    required this.currentLevelRecord,
    required this.record,
    this.status = 'won',
    this.playoffAverage = 0.0,
  });

  factory Playoff.fromJson(Map<String, dynamic> json) {
    return Playoff(
      level: json['level'] ?? 'qm',
      currentLevelRecord: Record.fromJson(json['current_level_record'] ?? {}),
      record: Record.fromJson(json['record'] ?? {}),
      status: json['status'] ?? 'won',
      playoffAverage: (json['playoff_average'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'level': level,
      'current_level_record': currentLevelRecord.toJson(),
      'record': record.toJson(),
      'status': status,
      'playoff_average': playoffAverage,
    };
  }
}
