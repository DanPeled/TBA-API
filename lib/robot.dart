class Robot {
  final String robotKey;
  final String robotName;
  final String teamKey;
  final int year;

  Robot(
      {required this.robotKey,
      required this.robotName,
      required this.teamKey,
      required this.year});

  static Robot fromJson(Map<String, dynamic> json) {
    return Robot(
      robotKey: json["key"],
      robotName: json["robot_name"],
      teamKey: json["team_key"],
      year: json["year"] as int,
    );
  }
}
