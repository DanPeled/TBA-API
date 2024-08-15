class Event {
  final String key;
  final String name;
  final String eventCode;
  final int eventType;
  final District? district;
  final String? city;
  final String? stateProv;
  final String? country;
  final DateTime startDate;
  final DateTime endDate;
  final int year;
  final String? shortName;
  final String? eventTypeString;
  final int? week;
  final String? address;
  final String? postalCode;
  final String? gmapsPlaceId;
  final String? gmapsUrl;
  final double? lat;
  final double? lng;
  final String? locationName;
  final String? timezone;
  final String? website;
  final String? firstEventId;
  final String? firstEventCode;
  final List<Webcast>? webcasts;
  final List<String>? divisionKeys;
  final String? parentEventKey;
  final int? playoffType;
  final String? playoffTypeString;

  Event({
    required this.key,
    required this.name,
    required this.eventCode,
    required this.eventType,
    this.district,
    this.city,
    this.stateProv,
    this.country,
    required this.startDate,
    required this.endDate,
    required this.year,
    this.shortName,
    this.eventTypeString,
    this.week,
    this.address,
    this.postalCode,
    this.gmapsPlaceId,
    this.gmapsUrl,
    this.lat,
    this.lng,
    this.locationName,
    this.timezone,
    this.website,
    this.firstEventId,
    this.firstEventCode,
    this.webcasts,
    this.divisionKeys,
    this.parentEventKey,
    this.playoffType,
    this.playoffTypeString,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      key: json['key'] as String,
      name: json['name'] as String,
      eventCode: json['event_code'] as String,
      eventType: json['event_type'] as int,
      district: json['district'] != null
          ? District.fromJson(json['district'] as Map<String, dynamic>)
          : null,
      city: json['city'] as String?,
      stateProv: json['state_prov'] as String?,
      country: json['country'] as String?,
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: DateTime.parse(json['end_date'] as String),
      year: json['year'] as int,
      shortName: json['short_name'] as String?,
      eventTypeString: json['event_type_string'] as String?,
      week: json['week'] as int?,
      address: json['address'] as String?,
      postalCode: json['postal_code'] as String?,
      gmapsPlaceId: json['gmaps_place_id'] as String?,
      gmapsUrl: json['gmaps_url'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      locationName: json['location_name'] as String?,
      timezone: json['timezone'] as String?,
      website: json['website'] as String?,
      firstEventId: json['first_event_id'] as String?,
      firstEventCode: json['first_event_code'] as String?,
      webcasts: (json['webcasts'] as List<dynamic>?)
          ?.map((item) => Webcast.fromJson(item as Map<String, dynamic>))
          .toList(),
      divisionKeys: (json['division_keys'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
      parentEventKey: json['parent_event_key'] as String?,
      playoffType: json['playoff_type'] as int?,
      playoffTypeString: json['playoff_type_string'] as String?,
    );
  }
}

class District {
  final String abbreviation;
  final String displayName;
  final String key;
  final int year;

  District({
    required this.abbreviation,
    required this.displayName,
    required this.key,
    required this.year,
  });

  factory District.fromJson(Map<String, dynamic> json) {
    return District(
      abbreviation: json['abbreviation'] as String,
      displayName: json['display_name'] as String,
      key: json['key'] as String,
      year: json['year'] as int,
    );
  }
}

class Webcast {
  final String type;
  final String channel;
  final String? date;
  final String? file;

  Webcast({
    required this.type,
    required this.channel,
    this.date,
    this.file,
  });

  factory Webcast.fromJson(Map<String, dynamic> json) {
    return Webcast(
      type: json['type'] as String,
      channel: json['channel'] as String,
      date: json['date'] as String?,
      file: json['file'] as String?,
    );
  }
}
