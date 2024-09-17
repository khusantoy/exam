import 'package:exam/features/expense/ui/expenses_screen.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
      ),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.balance),
            title: const Text("Xarajatlar hisobi uchun bosing"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ExpensesScreen(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.balance),
            title: const Text("Daromadlar hisobi uchun bosing"),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
