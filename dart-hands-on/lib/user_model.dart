class UserModel{
  String? firstName; // Nullable type. Can be `null` or string.
  String? lastName; // Non-nullable type. Cannot be `null` but can be string.

  // UserModel(
  //     this.firstName,
  //     this.lastName
  // );

  doSomething(){
    /*
    using ?. operator is similar to following if condition:
    if(firstName != null){
      firstName = firstName!.toUpperCase();
    }
    */
    firstName = firstName?.toUpperCase();
    lastName = lastName?.toUpperCase();
  }
}

class AdminUser with AdminOperations{

}

class Student extends UserModel{

}

mixin AdminOperations{
  void adminOperation1(){

  }

  void adminOperation2(){

  }

  void adminOperation3(){

  }
}