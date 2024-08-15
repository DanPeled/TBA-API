class Award {
  String name;
  int awardType;
  String eventKey;
  List<Recipient> recipientList;
  int year;

  Award({
    this.name = '',
    this.awardType = 0,
    this.eventKey = '',
    List<Recipient>? recipientList,
    this.year = 0,
  }) : recipientList = recipientList ?? [];

  factory Award.fromJson(Map<String, dynamic> json) {
    return Award(
      name: json['name'] ?? '',
      awardType: json['award_type'] ?? 0,
      eventKey: json['event_key'] ?? '',
      recipientList: (json['recipient_list'] as List<dynamic>?)
              ?.map((recipient) =>
                  Recipient.fromJson(recipient as Map<String, dynamic>))
              .toList() ??
          [],
      year: json['year'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'award_type': awardType,
      'event_key': eventKey,
      'recipient_list':
          recipientList.map((recipient) => recipient.toJson()).toList(),
      'year': year,
    };
  }
}

class Recipient {
  String teamKey;
  String awardee;

  Recipient({
    this.teamKey = '',
    this.awardee = '',
  });

  factory Recipient.fromJson(Map<String, dynamic> json) {
    return Recipient(
      teamKey: json['team_key'] ?? '',
      awardee: json['awardee'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'team_key': teamKey,
      'awardee': awardee,
    };
  }
}
