//////////////////Response model/////////////////
class ProfileDetailsResponseModel {
    int? id;
    String? title;
    String? body;

    ProfileDetailsResponseModel({
        required this.id,
        required this.title,
        required this.body,
    });
  ProfileDetailsResponseModel.fromJson(Map<String,dynamic>json){
      id = json["id"];
      title = json["title"];
      body = json["body"];
        }
}
///////////////////RequestModel////////////////////////////
class  ProfileDetailsRequestModel  {
  String? userId;
  ProfileDetailsRequestModel({
    this.userId,
  });
  Map<String, dynamic> toJson(){
    Map<String, dynamic> data={};
    data['userId']= userId;
    return data;
  }
}