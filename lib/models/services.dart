// ignore_for_file: prefer_if_null_operators

class Services {
  Services({
    this.title,
    this.subTitle,
    this.icon,
  });

  String? title;
  String? subTitle;
  String? icon;

  factory Services.fromJson(Map<String, dynamic> json) => Services(
        title: json["title"] == null ? null : json["title"],
        subTitle: json["subTitle"] == null ? null : json["subTitle"],
        icon: json["icon"] == null ? null : json["icon"],
      );
}
