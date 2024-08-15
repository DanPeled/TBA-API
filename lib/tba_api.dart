import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tba_api/award.dart';
import 'package:tba_api/event.dart';
import 'package:tba_api/match_data.dart';
import 'package:tba_api/tba_status.dart';
import 'package:tba_api/team.dart';
import 'package:tba_api/team_year_status.dart';

/// A class to interact with The Blue Alliance (TBA) API.
///
/// Provides methods to fetch team details, event information, and status from
/// the TBA API. Requires an API key for authentication.
class TBAApi {
  String? _apiKey;
  final String _apiUrl = 'https://www.thebluealliance.com/api/v3';

  /// Initializes the API client with the provided API key.
  ///
  /// [apiKey] The API key used for authentication with the TBA API.
  void initialize(String apiKey) {
    _apiKey = apiKey;
  }

  /// Retrieves details for a specific team.
  ///
  /// [teamKey] The unique key identifying the team.
  ///
  /// Returns a [Team] object containing team details.
  Future<Team> getTeam(String teamKey) async {
    final jsonResponse = await _getFromURI("team/$teamKey");
    return Team.fromJson(jsonResponse);
  }

  /// Fetches data from the specified URI path.
  ///
  /// [path] The API endpoint path to fetch data from.
  ///
  /// Throws an [ArgumentError] if the API key is not set.
  /// Returns the parsed JSON response as a [dynamic] object.
  Future<dynamic> _getFromURI(String path) async {
    if (_apiKey == null) {
      throw ArgumentError("API key cannot be null");
    }

    final response = await http.get(
      Uri.parse("$_apiUrl/$path"),
      headers: {'X-TBA-Auth-Key': _apiKey!},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data from API');
    }
  }

  /// Retrieves the status of the TBA API.
  ///
  /// Returns a [TBAStatus] object containing API status information.
  Future<TBAStatus> getStatus() async {
    final jsonResponse = await _getFromURI("status");
    return TBAStatus.fromJson(jsonResponse);
  }

  /// Retrieves a list of events for a specific year.
  ///
  /// [year] The year to retrieve events for.
  ///
  /// Returns a list of [Event] objects for the specified year.
  /// Throws a [FormatException] if the API response is not in the expected format.
  Future<List<Event>> getEventsFromYear(int year) async {
    final jsonResponse = await _getFromURI("events/$year");

    if (jsonResponse is List<dynamic>) {
      List<Event> events = [];
      for (var eventJson in jsonResponse) {
        if (eventJson is Map<String, dynamic>) {
          try {
            events.add(Event.fromJson(eventJson));
          } catch (e) {
            print('Error parsing eventJson: $eventJson');
            print('Exception: $e');
          }
        } else {
          print('Unexpected format for event data: $eventJson');
        }
      }
      return events;
    } else {
      throw FormatException(
          'Expected a list of events, but got ${jsonResponse.runtimeType}');
    }
  }

  /// Retrieves a list of event keys for a specific year.
  ///
  /// [year] The year to retrieve event keys for.
  ///
  /// Returns a list of event keys as strings.
  /// Throws a [FormatException] if the API response is not in the expected format.
  Future<List<String>> getEventKeysFromYear(int year) async {
    final jsonResponse = await _getFromURI("events/$year/keys");

    if (jsonResponse is List<dynamic>) {
      List<String> keys = [];
      for (var eventJson in jsonResponse) {
        if (eventJson is String) {
          try {
            keys.add(eventJson);
          } catch (e) {
            print('Error parsing eventJson: $eventJson');
            print('Exception: $e');
          }
        } else {
          print('Unexpected format for event data: $eventJson');
        }
      }
      return keys;
    } else {
      throw FormatException(
          'Expected a list of keys, but got ${jsonResponse.runtimeType}');
    }
  }

  /// Retrieves a list of teams participating in a specific event.
  ///
  /// [eventKey] The key of the event to retrieve teams for.
  ///
  /// Returns a list of [Team] objects participating in the event.
  /// Throws a [FormatException] if the API response is not in the expected format.
  Future<List<Team>> getEventTeams(String eventKey) async {
    final jsonResponse = await _getFromURI("event/$eventKey/teams");

    if (jsonResponse is List<dynamic>) {
      List<Team> teams = [];
      for (var eventJson in jsonResponse) {
        if (eventJson is Map<String, dynamic>) {
          try {
            teams.add(Team.fromJson(eventJson));
          } catch (e) {
            print('Error parsing eventJson: $eventJson');
            print('Exception: $e');
          }
        } else {
          print('Unexpected format for event data: $eventJson');
        }
      }
      return teams;
    } else {
      throw FormatException(
          'Expected a list of teams, but got ${jsonResponse.runtimeType}');
    }
  }

  Future<List<Event>> getTeamEventsFromYear(String teamKey, int year) async {
    final jsonResponse = await _getFromURI("team/$teamKey/events/$year");

    if (jsonResponse is List<dynamic>) {
      List<Event> events = [];
      for (var eventJson in jsonResponse) {
        if (eventJson is Map<String, dynamic>) {
          try {
            events.add(Event.fromJson(eventJson));
          } catch (e) {
            print('Error parsing eventJson: $eventJson');
            print('Exception: $e');
          }
        } else {
          print('Unexpected format for event data: $eventJson');
        }
      }
      return events;
    } else {
      throw FormatException(
          'Expected a list of events, but got ${jsonResponse.runtimeType}');
    }
  }

  Future<List<MatchData>> getTeamMatchesFromEvent(
      String teamKey, String eventKey) async {
    final jsonResponse =
        await _getFromURI("team/$teamKey/event/$eventKey/matches");

    if (jsonResponse is List<dynamic>) {
      List<MatchData> matches = [];
      for (var eventJson in jsonResponse) {
        if (eventJson is Map<String, dynamic>) {
          try {
            matches.add(MatchData.fromJson(eventJson));
          } catch (e) {
            print('Error parsing eventJson: $eventJson');
            print('Exception: $e');
          }
        } else {
          print('Unexpected format for event data: $eventJson');
        }
      }
      return matches;
    } else {
      throw FormatException(
          'Expected a list of events, but got ${jsonResponse.runtimeType}');
    }
  }

  Future<TeamYearStatus> getTeamYearStatus(String teamKey, int year) async {
    final jsonResponse =
        await _getFromURI("team/$teamKey/events/$year/statuses");

    return TeamYearStatus.fromJson(jsonResponse);
  }

  Future<List<Award>> getTeamEventAwards(
      String teamKey, String eventKey) async {
    final jsonResponse =
        await _getFromURI("team/$teamKey/event/$eventKey/awards");

    if (jsonResponse is List<dynamic>) {
      List<Award> awards = [];
      for (var awardJson in jsonResponse) {
        if (awardJson is Map<String, dynamic>) {
          try {
            awards.add(Award.fromJson(awardJson));
          } catch (e) {
            print('Error parsing awardJson: $awardJson');
            print('Exception: $e');
          }
        } else {
          print('Unexpected format for award data: $awardJson');
        }
      }
      return awards;
    } else {
      throw FormatException(
          'Expected a list of awards, but got ${jsonResponse.runtimeType}');
    }
  }
}
