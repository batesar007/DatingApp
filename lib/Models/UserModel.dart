class Usermodel {
  String? username, gmail, dob, gender, qualification, img, uid;
  Usermodel(
      {this.username,
      this.dob,
      this.gender,
      this.gmail,
      this.qualification,
      this.img,
      this.uid});
  Usermodel.fromuser(Map<String, dynamic> json, this.uid)
      : username = json["username"] ?? "",
        gmail = json["gmail"] ?? "",
        dob = json["dob"] ?? "",
        gender = json["gender"] ?? "",
        img = json["img"] ?? "",
        qualification = json["qualification"] ?? "";
  Map<String, dynamic> tojson() {
    return {
      "username": username,
      "dob": dob,
      "gender": gender,
      "gmail": gmail,
      "img": img,
      "qualification": qualification
    };
  }

  Usermodel copywith({String? username, gmail, dob, gender, qualification, uid}) {
    return Usermodel(
        username: username ?? this.username,
        gmail: gmail ?? this.gmail,
        gender: gender ?? this.gender,
        dob: dob ?? this.dob,
        qualification: qualification ?? this.qualification,
        img: img ?? this.img,
        uid: uid ?? this.uid);
  }
}