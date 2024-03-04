class ModelUserInfo {
  final String channelname = 'kakao';
  final String userid;
  final String nick;
  final String profile;
  final String thumbnail;

  ModelUserInfo({
    required this.userid,
    required this.nick,
    required this.profile,
    required this.thumbnail,
  });

  factory ModelUserInfo.fromJson(Map<String, dynamic> json) {
    return ModelUserInfo (
      userid: json['userid'],
      nick: json['nick'],
      profile: json['profile'],
      thumbnail: json['thumbnail'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'channelname': channelname,
      'userid': userid,
      'nick': nick,
      'profile': profile,
      'thumbnail': thumbnail,
    };
  }

  @override
  String toString() {
    return 'ModelUserInfo {channelname: $channelname, userid: $userid, nick: $nick, profile: $profile, thumbnail: $thumbnail}';
  }
}
