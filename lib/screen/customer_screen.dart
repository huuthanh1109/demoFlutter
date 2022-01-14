import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learnflutter/model/customer_model.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({Key? key}) : super(key: key);

  @override
  _CustomerScreenState createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 44,
        title: const Text(
          'Customer',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final Customer customer = customers[index];
                  return ItemCustomer(
                    name: customer.name,
                    phoneNumber: customer.phoneNumber,
                    customer: customers[index],
                    // index: customers.indexWhere((element) => false),
                  );
                },
                childCount: customers.length,
              ),
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.only(top: 80),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showCupertinoDialog(
            context: context,
            builder: (BuildContext ctx) {
              return CupertinoAlertDialog(
                title: const Text('Add new customer'),
                content: Card(
                  color: Colors.grey.shade200,
                  borderOnForeground: false,
                  elevation: 0,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(width: 1, color: Colors.grey),
                        ),
                        child: TextField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            hintText: 'Customer Name',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            border: InputBorder.none,
                          ),
                          cursorWidth: 1,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 2, vertical: 0),
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(width: 1, color: Colors.grey),
                        ),
                        child: TextField(
                          controller: phoneController,
                          decoration: const InputDecoration(
                            hintText: 'Phone Number',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            border: InputBorder.none,
                          ),
                          cursorWidth: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  CupertinoDialogAction(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.redAccent),
                    ),
                    isDefaultAction: false,
                    isDestructiveAction: false,
                  ),
                  CupertinoDialogAction(
                    onPressed: () {
                      setState(
                        () {
                          customers.add(
                            Customer(
                              name: nameController.text,
                              phoneNumber: phoneController.text,
                            ),
                          );
                          Navigator.of(context).pop();
                        },
                      );
                    },
                    child: const Text(
                      'OK',
                      style: TextStyle(color: Colors.blue),
                    ),
                    isDefaultAction: true,
                    isDestructiveAction: false,
                  ),
                ],
              );
            },
          );
        },
        tooltip: 'Add Customer',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget ItemCustomer(
          {String? name,
          String? phoneNumber,
          Customer? customer,
          int? index}) =>
      GestureDetector(
        onTap: () {
          showCupertinoDialog(
            context: context,
            builder: (BuildContext ctx) {
              return CupertinoAlertDialog(
                title: const Text('Update customer'),
                content: Card(
                  color: Colors.grey.shade200,
                  borderOnForeground: false,
                  elevation: 0,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(width: 1, color: Colors.grey),
                        ),
                        child: TextField(
                          controller: nameController
                            ..text = '${customer?.name}',
                          decoration: const InputDecoration(
                            hintText: 'Customer Name',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            border: InputBorder.none,
                          ),
                          cursorWidth: 1,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 2, vertical: 0),
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(width: 1, color: Colors.grey),
                        ),
                        child: TextField(
                          controller: phoneController
                            ..text = '${customer?.phoneNumber}',
                          decoration: const InputDecoration(
                            hintText: 'Phone Number',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            border: InputBorder.none,
                          ),
                          cursorWidth: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  CupertinoDialogAction(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.redAccent),
                    ),
                    isDefaultAction: false,
                    isDestructiveAction: false,
                  ),
                  CupertinoDialogAction(
                    onPressed: () {
                      int selectedIndex = 0;
                      setState(
                        () {
                          customers.remove(customer);
                          customers.add(
                            Customer(
                              name: nameController.text,
                              phoneNumber: phoneController.text,
                            ),
                          );
                          Navigator.of(context).pop();
                        },
                      );
                    },
                    child: const Text(
                      'OK',
                      style: TextStyle(color: Colors.blue),
                    ),
                    isDefaultAction: true,
                    isDestructiveAction: false,
                  ),
                ],
              );
            },
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name!.isEmpty ? 'Customer Name' : name,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    phoneNumber!,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    customers.remove(customer);
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    CupertinoIcons.delete,
                    size: 20,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
