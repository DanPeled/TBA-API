import 'dart:io';

import 'package:tba_api/tba_api.dart';

void main(List<String> arguments) async {
  TBAApi api = TBAApi();

  api.initialize(Platform.environment["TBA_API_KEY"] ?? "");

  print((await api.getTeamMediaFromYear("frc9738", 2024)));

  print(await api.getTeamRobotImage("frc9738", 2024));
}
