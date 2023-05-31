import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String email;
  final String password;
  final String name;
  final String id;

  User(
    this.email,
    this.password,
    this.name,
    this.id,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'name': name,
      'id': id,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      map['email'] as String,
      map['password'] as String,
      map['name'] as String,
      map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Products {
  String? uid;
  String barcodeId;
  String? pname;
  String? category;
  // String? comment;
  String? image;
  // String? uname;
  Products({
    this.uid,
    required this.barcodeId,
    this.pname,
    this.category,
    //  this.comment,
    this.image,
    // this.uname,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'barcodeId': barcodeId,
      'pname': pname,
      'category': category,
      //'comment': comment,
      'image': image,
      //  'uname': uname,
    };
  }

  factory Products.fromMap(Map<String, dynamic> map) {
    return Products(
      uid: map['uid'] != null ? map['uid'] as String : null,
      barcodeId: map['barcodeId'] as String,
      pname: map['pname'] != null ? map['pname'] as String : null,
      category: map['category'] != null ? map['category'] as String : null,
      //  comment: map['comment'] != null ? map['comment'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      //  uname: map['uname'] != null ? map['uname'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Products.fromJson(String source) =>
      Products.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Commentt {
  String? comment;
  String? name;
  DateTime? createdAt;
  String? uid;
  Commentt({
    this.comment,
    this.name,
    this.createdAt,
    this.uid,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'comment': comment,
      'name': name,
      'createdAt': createdAt?.millisecondsSinceEpoch ?? 0,
      'uid': uid,
    };
  }

  factory Commentt.fromMap(Map<String, dynamic> map) {
    return Commentt(
      comment: map['comment'] != null ? map['comment'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map["createdAt"] as int),
      uid: map['uid'] != null ? map['uid'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Commentt.fromJson(String source) =>
      Commentt.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Commentt(comment: $comment, name: $name, createdAt: $createdAt, uid: $uid)';
  }
}
