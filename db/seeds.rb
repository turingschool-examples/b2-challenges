Professor.destroy_all
Student.destroy_all

professor1 = Professor.create(name: "Minerva McGonagall", age: 204, specialty: "Transfiguration")
professor2 = Professor.create(name: "Severus Snape", age: 204, specialty: "Potions")
professor3 = Professor.create(name: "Alastor Moody", age: 204, specialty: "Defense Against the Dark Arts")
student1 = professor1.students.create(name: "Harry Potter", age: 17)
student2 = professor1.students.create(name: "Ronald Weasley", age: 17)
student3 = professor2.students.create(name: "Hermione Granger", age: 18)
student4 = professor2.students.create(name: "Neville Longbottom", age: 17)
