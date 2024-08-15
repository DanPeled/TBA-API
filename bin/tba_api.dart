import 'dart:io';

import 'package:tba_api/tba_api.dart';

void main(List<String> arguments) async {
  TBAApi api = TBAApi();

  api.initialize(Platform.environment["TBA_API_KEY"] ?? "");

  print((await api.getTeam("frc9738")).teamName);
  print((await api.getEventsFromYear(2024)).first.startDate);
  print((await api.getEventTeams("2024isde1")).last.teamName);
  print((await api.getEventKeysFromYear(2024)).first);
}
