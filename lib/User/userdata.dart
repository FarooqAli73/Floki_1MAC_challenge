import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:floki/User/doc.dart';
import 'package:floki/User/user.dart';

class UserData {
  UserData({this.uid});
  final uid;

  //Auth _fire = Auth();

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future setUserData(
      {String name,
      String job,
      int age,
      String uid,
      int likes,
      String location,
      bool pub,
      bool employer,
      String phone,
      String description}) async {
    return await users.doc(uid).set({
      'Employer': employer,
      'Likes': likes,
      'Uid': uid,
      'Name': name,
      'Job': job,
      'Publish': pub,
      'Age': age,
      'Phone': phone,
      'Des': description,
      'Location': location,
    }).catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> updateLikes({int likes, String uid}) {
    return users
        .doc(uid)
        .update({'Likes': likes})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update likes: $error"));
  }

  Future<void> setType({bool employer, String uid}) {
    return users
        .doc(uid)
        .update({'Employer': employer})
        .then((value) => print("User Type Updated"))
        .catchError((error) => print("Failed to update type : $error"));
  }

  Future<void> updateUser(
      {String uid,
      String name,
      bool pub,
      String job,
      String des,
      String location,
      String phone,
      int age}) {
    return users
        .doc(uid)
        .update({
          'Job': job,
          'Name': name,
          'Location': location,
          "Phone": phone,
          'Age': age,
          'Des': des,
          'Publish': pub
        })
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  List<Doc> _fromDocsFirestore(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Doc(
          pub: doc['Publish'] ?? false,
          employer: doc['Employer'] ?? false,
          likes: doc['Likes'] ?? 0,
          uid: doc['Uid'] ?? uid,
          title: doc['Name'] ?? "name",
          job: doc['Job'] ?? "job",
          age: doc['Age'] ?? 0,
          phone: doc['Phone'] ?? '9641234567890',
          description: doc['Des'] ?? "description",
          location: doc['Location'] ?? 'location');
    }).toList();
  }

  Stream<List<Doc>> get usersDocs {
    return users.snapshots().map(_fromDocsFirestore);
  }

  UserDataSnap _userDataSnapshot(DocumentSnapshot snapshot) {
    return UserDataSnap(
        pub: snapshot['Publish'],
        employer: snapshot['Employer'],
        uid: snapshot['Uid'],
        likes: snapshot['Likes'],
        name: snapshot['Name'],
        job: snapshot['Job'],
        age: snapshot['Age'],
        des: snapshot['Des'],
        phone: snapshot['Phone'],
        location: snapshot['Location']);
  }

  Stream<UserDataSnap> get userDataSnap {
    return users.doc(uid).snapshots().map(_userDataSnapshot);
  }
}
