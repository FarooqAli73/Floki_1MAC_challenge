class TheUser {
  final String uid;
  TheUser({this.uid});
}

class UserDataSnap {
  final String location;
  final String uid;
  final String name;
  final bool pub;
  final String job;
  final String phone;
  final String des;
  final int age;
  final bool employer;
  final int likes;

  UserDataSnap(
      {this.pub,
      this.employer,
      this.location,
      this.likes,
      this.phone,
      this.des,
      this.uid,
      this.name,
      this.job,
      this.age});
}
