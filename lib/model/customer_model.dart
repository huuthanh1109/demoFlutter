class Customer {
  String? id;
  String? name;
  String? phoneNumber;

  Customer({
    this.id,
    this.name,
    this.phoneNumber,
  });
}

final List<Customer> customers = [
  Customer(id: '1', name: 'Nefertari', phoneNumber: '0928428349'),
  Customer(id: '2', name: 'John', phoneNumber: '0938953455'),
  Customer(id: '3', name: 'Abigail', phoneNumber: '0083285783'),
  Customer(id: '4', name: '', phoneNumber: '0188435345'),
  Customer(id: '5', name: 'Belinda', phoneNumber: '0854385723'),
  Customer(id: '6', name: 'Donatella', phoneNumber: '0234823455'),
  Customer(id: '7', name: '', phoneNumber: '0939999999'),
  Customer(id: '8', name: 'Kyomi', phoneNumber: '0237483247'),
  Customer(id: '9', name: 'Lucinda', phoneNumber: '0111111111'),
  Customer(id: '10', name: 'Sapphire', phoneNumber: '0924325444'),
];
