"use strict";
//General
let user = 'Mustafa Kaya';
let salery = 4000;
let lang = ['Javascript', 'Html', 'Css', 'Nodejs', 'Laravel'];
console.log(user + ' ' + salery + ' ' + lang);
//union
let id = '1233';
console.log(id);
//enum with string
var EnumString;
(function (EnumString) {
    EnumString["Up"] = "Up";
    EnumString["Down"] = "Down";
    EnumString["Left"] = "Left";
    EnumString["Right"] = "Right";
})(EnumString || (EnumString = {}));
console.log(EnumString.Up);
//enum with number
var EnumNumber;
(function (EnumNumber) {
    EnumNumber[EnumNumber["Up"] = 1] = "Up";
    EnumNumber[EnumNumber["Down"] = 2] = "Down";
    EnumNumber[EnumNumber["Left"] = 3] = "Left";
    EnumNumber[EnumNumber["Right"] = 4] = "Right";
})(EnumNumber || (EnumNumber = {}));
console.log(EnumNumber.Up);
//object salery optional prop
let Users = {
    id: 1,
    name: 'Mustafa',
    // salery:4000
};
console.log(Users);
//assertion
let uid = '123';
let custId = uid; //uid type is any but here i want number
//function
let sum = (x, y) => {
    return x + y;
};
console.log(sum(10, 30));
//the void type as the return type of functions that do not return a value.
let task = (taskId) => {
    console.log(taskId);
};
task('Hello');
//class
class Person {
    constructor(name, age) {
        this.name = name;
        this.age = age;
    }
    fullName() {
        return this.name + ' ' + this.age;
    }
}
let Per1 = new Person('Mustafa', 34);
console.log(Per1.fullName());
