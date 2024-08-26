import 'dart:io';

import 'package:tba_api/award.dart';
import 'package:tba_api/event.dart';
import 'package:tba_api/match_data.dart';
import 'package:tba_api/robot.dart';
import 'package:tba_api/tba_api.dart';
import 'package:tba_api/tba_status.dart';
import 'package:tba_api/team.dart';
import 'package:tba_api/team_year_status.dart';
import 'package:test/test.dart';

void main() async {
  TBAApi api = TBAApi();
  api.initialize(Platform.environment["TBA_API_KEY"] ?? "");
  test('Get team info', () async {
    Team team = await api.getTeam("frc9738");
    expect(team.teamNumber, 9738);
  });

  test('Get year events', () async {
    List<Event> events = await api.getEventsFromYear(2020);
    expect(events.length, greaterThan(0));
  });

  test('Get Status', () async {
    TBAStatus status = await api.getStatus();

    expect(status, isNotNull);
  });

  test('Get Event Teams', () async {
    String eventKey = (await api.getEventKeysFromYear(2020)).first;
    List<Team> eventTeams = await api.getEventTeams(eventKey);

    expect(eventTeams.length, greaterThan(0));
  });

  test('Get team events from year', () async {
    List<Event> events = await api.getTeamEventsFromYear("frc9738", 2024);

    expect(events.length, greaterThan(0));
  });

  test('Get team matches data', () async {
    List<MatchData> matches =
        await api.getTeamMatchesFromEvent("frc9738", "2024isde1");

    expect(matches.length, greaterThan(0));
  });

  test('Get team year statuses', () async {
    TeamYearStatus teamYearStatus =
        await api.getTeamYearStatus("frc9738", 2024);

    expect(teamYearStatus.statuses.length, greaterThan(0));
  });

  test('Get team awards from event', () async {
    List<Award> awards = await api.getTeamEventAwards("frc9738", "2024isde1");

    expect(awards.length, greaterThan(0));
  });

  test('Get team robots', () async {
    Robot robot = (await api.getTeamRobots("frc1690")).first;

    expect(robot.robotName, "rafiki");
  });

  test('Get team robot image', () async {
    String imageURL = await api.getTeamRobotImage("frc9738", 2024);

    expect(Uri.parse(imageURL).isAbsolute, isTrue);
  });
}
