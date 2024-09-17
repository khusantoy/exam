import 'package:exam/features/expense/bloc/expense_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Xarajatlarni boshqarish"),
        ),
        body: BlocBuilder<ExpenseBloc, ExpenseState>(
          bloc: context.read<ExpenseBloc>()..add(GetExpensesEvent()),
          builder: (context, state) {
            if (state is ExpenseLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is ExpenseErrorState) {
              return Center(
                child: Text(state.message),
              );
            }

            print(state);

            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Card(
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text('Oziq-ovqat'),
                          ),
                        ),
                        Card(
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text('Transport'),
                          ),
                        ),
                        Card(
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text("Ta'lim"),
                          ),
                        ),
                        Card(
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text("Kommunal to'lovlar"),
                          ),
                        ),
                        Card(
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text("Ko'ngil ochar"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const ListTile(
                        leading: Icon(Icons.fire_truck),
                        title: Text("Uberdan taksi buyurtma qildim"),
                        subtitle: Text("10-08-2024"),
                        trailing: Text("+50"),
                      );
                    },
                  ),
                )
              ],
            );
          },
        ));
  }
}
