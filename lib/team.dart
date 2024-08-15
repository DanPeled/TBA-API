class Team {
  final String? address;
  final String? city;
  final String? country;
  final String key;
  final String? schoolName;
  final String teamName;
  final int rookieYear;
  final String? stateProv;
  final int teamNumber;
  final Uri? website;
  final String? gmapsPlaceId;
  final String? gmapsUrl;
  final double? lat;
  final double? lng;
  final String? locationName;
  final String? postalCode;

  Team({
    required this.address,
    required this.city,
    required this.country,
    required this.key,
    required this.schoolName,
    required this.teamName,
    required this.rookieYear,
    required this.stateProv,
    required this.teamNumber,
    required this.website,
    this.gmapsPlaceId,
    this.gmapsUrl,
    this.lat,
    this.lng,
    this.locationName,
    this.postalCode,
  });

  static Team fromJson(Map<String, dynamic> json) {
    return Team(
      address: json["address"],
      city: json["city"],
      country: json["country"],
      key: json["key"] ?? "",
      schoolName: json["school_name"],
      teamName: json["nickname"],
      rookieYear: json["rookie_year"],
      stateProv: json["state_prov"],
      teamNumber: json["team_number"],
      website: json["website"] != null ? Uri.parse(json["website"]) : null,
      gmapsPlaceId: json["gmaps_place_id"],
      gmapsUrl: json["gmaps_url"],
      lat: json["lat"]?.toDouble(),
      lng: json["lng"]?.toDouble(),
      locationName: json["location_name"],
      postalCode: json["postal_code"],
    );
  } 
}
