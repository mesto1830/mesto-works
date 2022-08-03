//General
let user: string = 'Mustafa Kaya'
let salery: number = 4000
let lang: string[] = ['Javascript', 'Html', 'Css', 'Nodejs','Laravel']
console.log(user + ' ' + salery +' '+ lang)

//union
let id: string|number = '1233'
console.log(id)

//enum with string
enum EnumString{
  Up = 'Up',
  Down = 'Down',
  Left = 'Left',
  Right = 'Right'
}
console.log(EnumString.Up)

//enum with number
enum EnumNumber{
  Up = 1,
  Down = 2,
  Left = 3,
  Right = 4
}
console.log(EnumNumber.Up)

//object salery optional prop
let Users: {id:number, name:string, salery?:number} = {
  id:1,
  name:'Mustafa',
  // salery:4000
}
console.log(Users)


//assertion
let uid: any = '123'
let custId = uid as number//uid type is any but here i want number


//function
let sum = (x:number, y:number):number => {
  return x+y
}
console.log(sum(10,30))

//the void type as the return type of functions that do not return a value.
let task = (taskId: string | number): void => {
  console.log(taskId)
}
task('Hello')

//class
class Person {
  name:string
  age:number
  constructor(name:string, age:number) {
    this.name = name;
    this.age = age;
  }
  fullName(){
    return this.name +' '+ this.age
  }
}
let Per1 = new Person('Mustafa',34)
console.log(Per1.fullName())