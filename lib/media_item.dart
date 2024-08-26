class MediaItem {
  final Map<String, dynamic>? details;
  final String? directUrl;
  final String? foreignKey;
  final bool? preferred;
  final List<String>? teamKeys;
  final String? type;
  final String? viewUrl;

  MediaItem({
    this.details,
    this.directUrl,
    this.foreignKey,
    this.preferred,
    this.teamKeys,
    this.type,
    this.viewUrl,
  });

  factory MediaItem.fromJson(Map<String, dynamic> json) {
    return MediaItem(
      details: json['details'] as Map<String, dynamic>?,
      directUrl: json['direct_url'] as String?,
      foreignKey: json['foreign_key'] as String?,
      preferred: json['preferred'] as bool?,
      teamKeys: (json['team_keys'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      type: json['type'] as String?,
      viewUrl: json['view_url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'details': details,
      'direct_url': directUrl,
      'foreign_key': foreignKey,
      'preferred': preferred,
      'team_keys': teamKeys,
      'type': type,
      'view_url': viewUrl,
    };
  }
}
