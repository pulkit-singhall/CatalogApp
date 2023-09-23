class User {
  final String name;
  final String mobile;
  final String email;
  final String address;

  User(
      {required this.name,
      required this.mobile,
      required this.email,
      required this.address});
}

Map<String,String> userModule(User user){
  return {
    'name' : user.name.toString(),
    'mobile' : user.mobile.toString(),
    'email' : user.email.toString(),
    'address' : user.address.toString(),
  };
}

