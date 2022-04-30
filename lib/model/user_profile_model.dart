class UserProfileModel
{
  final String? image;
  final String? name;

  UserProfileModel({this.image, this.name});

}

List<UserProfileModel> userProfile = [
  UserProfileModel(image: "assets/images/user_profile1.png", name: "Anna"),
  UserProfileModel(image: "assets/images/user_profile2.png", name: "Alex"),
  UserProfileModel(image: "assets/images/user_profile3.png", name: "Devid"),
  UserProfileModel(image: "assets/images/user_profile4.png", name: "Kenne"),
  UserProfileModel(image: "assets/images/user_profile5.png", name: "Lana"),
];
