class TBAStatus {
  final int currentSeason;
  final int maxSeason;
  final bool dataFeedDown;

  TBAStatus(
      {required this.currentSeason,
      required this.maxSeason,
      required this.dataFeedDown});

  static TBAStatus fromJson(Map<String, dynamic> json) {
    return TBAStatus(
      currentSeason: json["current_season"],
      maxSeason: json["max_season"],
      dataFeedDown: json["is_datafeed_down"],
    );
  }
}
