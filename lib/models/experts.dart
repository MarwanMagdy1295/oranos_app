// ignore_for_file: prefer_if_null_operators

class Experts {
  Experts({
    this.id,
    this.name,
    this.email,
    this.dob,
    this.phoneNumber,
    this.gender,
    this.profileImg,
    this.rating,
    this.title,
    this.isFavorite = false,
  });

  int? id;
  double? rating;
  String? name;
  String? email;
  DateTime? dob;
  String? phoneNumber;
  int? gender;
  String? profileImg;
  String? title;
  bool? isFavorite;

  factory Experts.fromJson(Map<String, dynamic> json) => Experts(
        id: json["id"],
        rating: json["rating"] == null ? null : json["rating"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        phoneNumber: json["phone_number"],
        gender: json["gender"],
        profileImg: json["profile_img"] == null ? null : json["profile_img"],
        title: json["title"] == null ? null : json["title"],
        isFavorite: json["is_favorate"] == null ? null : json["is_favorate"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "dob":
            "${dob?.year.toString().padLeft(4, '0')}-${dob?.month.toString().padLeft(2, '0')}-${dob?.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "phone_number": phoneNumber,
        "profile_img": profileImg,
      };
}
