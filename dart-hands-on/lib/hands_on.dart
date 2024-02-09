import 'user_model.dart';


void main(List<String> arguments) {
  // ========== Variable Declaration ==========
  var name = 'Mitchell';

  String lastName = "Starc"; // String can be declared using single quotes (') and also with double quotes (")
  String abc = "abc";
  String def = 'def';

  int age = 20;
  double x = 2.2;

  // ========== Null Safety ==========
  UserModel user = UserModel(); // "new" keyword is optional to create an object
  user.firstName;

  print('First Name: ${user.firstName}'); // First Name: Jethalal
  print('Last Name: ${user.lastName}'); // Last Name: null

  sendDetails(user.firstName!, user.lastName ?? 'Mehta'); // using exclamation(!) is very risky, here it will throw an error

  // ========== Type casting ==========
  var math = 97;
  int mark = math as int;
  print(mark);

  // ========== Operators ==========
  // Dart has all the basic operators like ++, -- as all other languages

  var name1 = user.lastName ?? 'Mehta'; // if null operator -> it eliminates the following code

  if(user.lastName == null){
    name1 = 'Mehta';
  }


  // cascade operator
  //Using the .. operator for operations on Example object
  UserModel user1 = UserModel()
    ..firstName = "Tapaswi"
    ..lastName = "Patel"
    ..doSomething();


  //The same operations as above but without the .. operator
  UserModel user2 = UserModel();
  user2.firstName = 'Madhvi';
  user2.lastName = 'Bhide';
  user2.doSomething();

  // as, is & is! operators
  var a = 2.2;
  double b = a as double;
  print(b);
  print("user1 is UserModel?: ${user1 is UserModel}");
  print("b is double?: ${user1 is! String}");

  // ========== Data Types ==========
  // all the data types are there

  // Record type denoted by ( )
  var record = ('first', a: 2, b: true, 'last'); // python tupple

  // Record type annotation in a variable declaration:
  (String, int) record1;

  // Initialize it with a record expression:
  record1 = ('A string', 123);

  // Record with named parameters
  ({int a, bool b}) record3;
  record3 = (a: 123, b: true);


  // To access the records
  var record4 = ('first', a: 2, b: true, 'last');
  print(record4.$1); // Prints 'first'
  print(record4.a); // Prints 2
  print(record4.b); // Prints true
  print(record4.$2); // Prints 'last'

  // it can be used to return multiple values
  (int, String) someFunction(){
    return (20, 'Tapu');
  }

  // ========== List / Array, Set & Map ==========
  var list = [1,2,3];
  list.add(4);

  List<String> list1 = ['AA', 'BB'];
  list1.add('fluorine'); // can add 1 element

  List<String> list2 = ['CC', 'DD'];
  list1.addAll(list2); // can add whole collection

  // List can also be createed using "List.generate" method
  List<UserModel> list3 = List.generate(10,
          (index){
        index = index++;
        return UserModel();
      }
  ); // Creates List of 10 UserModel objects


  // Set
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};

  //To create an empty set
  var names = <String>{};

  // To add elements
  Set<String> elements = {};
  elements.add('fluorine'); // can add 1 element
  elements.addAll(halogens); // can add whole collection
  elements.length; // return the length of the list, play with all the functions

  // Map
  Map gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };

  // Same object using Map constructor
  Map gifts1 = Map<String, String>();
  gifts1['first'] = 'partridge';
  gifts1['second'] = 'turtledoves';
  gifts1['fifth'] = 'golden rings';

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };

  // Same object using map constructor
  var nobleGases1 = Map<int, String>();
  nobleGases1[2] = 'helium';
  nobleGases1[10] = 'neon';
  nobleGases1[18] = 'argon';


  // ========== Functions ==========
  isNoble(2);
  isNoble1(atomicNumber: null); //optional with null value
  isNoble2(); //optional with default value
  isNoble3(atomicNumber: 2); //Required parameter, null will throw an error
  isNoble4(); //optional with non-named parameter

  /// we will always use named parameters in function!

  int ans = calculation(n1: 2.5, n2: 2.5, operation: (num1, num2) {
    return num1 + num2;
  }
  );

  // above function can also be written as:
  calculation(n1: 5, n2: 5, operation: (num1, num2) => num1 * num2);

  // refer to the where method of list for function as a data type;

  // ========== Loops ==========
  for(int i=0; i<10; i++){
    if(i==5) {
      continue; // for skipping a particular iteration
    }else{
      // do something
    }
  } //basic

  for(UserModel user in list3){
    print(user.firstName);
  }

  list1.forEach((element) { });
  list3.forEach((element) { });

  // Error Handling Try-Catch

  try{
    someMethod();
  } on FormatException catch(e){
    print('Exception Caught: $e');
  } on UnimplementedError{
    print('Unimplemented error...');
  } on Exception{
    // Do something
  } catch(e){
    // Do something
  }

  // ==========  Mixins ==========
  AdminUser adminUser = new AdminUser();
  adminUser.adminOperation1();
  adminUser.adminOperation2();
  adminUser.adminOperation3();

  Student student = Student();
  // student.adminOperation1(); // This will throw a compile time error

  // ========== Enums ==========
  GameType gameType = GameType.ONE_PLAYER;

  // ========== Extensions ==========
  String marks = '23';
  int mks = marks.parseInt();

  String? gender = null;
  sendValues("Kush", 20, gender);

}

enum GameType{
  ONE_PLAYER,
  TWO_PLAYER
}

extension StringExtension on String{
  parseInt(){
    return int.parse(this);
  }
}

sendValues(String name, int age, String? gender){
  if(gender == null){
    // Dont send it
  }else{
    // send all three variables
  }
}

sendDetails(String fName, String lName){
  String upperCaseName = fName.toUpperCase(); // Throws exception because we have provided null value

}

var nobleGases = {
  2: 'helium',
  10: 'neon',
  18: 'argon',
};

// normal function
bool isNoble(int atomicNumber) {
  bool value = nobleGases[atomicNumber] != null;
  return value;
}


// function without return type <<not recommended>>
// Function with optional named parameter
isNoble1({int? atomicNumber}) { // dart doesn't have the concept of function overloading
  bool value = nobleGases[atomicNumber] != null;
  return value;
}

// Shorthand syntax of above function using lambda operator
// Function with default parameter value
bool isNoble2({int atomicNumber = 1}) => nobleGases[atomicNumber] != null;

// Function with required named parameter
bool isNoble3({required int atomicNumber}) => nobleGases[atomicNumber] != null;

// Function with un-named optional parameter
bool isNoble4([int atomicNumber = 2]) => nobleGases[atomicNumber] != null;

// function as a data type
int calculation({
  required double n1,
  required double n2,
  required int Function(int num1, int num2) operation}){
  return operation(n1.toInt(),n2.toInt());
}
void someMethod() => throw FormatException("Improper format...!");