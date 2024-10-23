import 'package:demo_app/calculator/widgets/calculator_bottom.dart';
import 'package:demo_app/provider/calculator_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.network(
                'https://images.unsplash.com/photo-1724926201899-40530ae44ee4?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 150,
              left: 20,
              right: 20,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: context
                              .read<CalculatorProvider>()
                              .numberOneController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              gapPadding: 33,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            fillColor: const Color(0xffD9D9D9),
                            filled: true,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: context
                              .read<CalculatorProvider>()
                              .numberTwoController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              gapPadding: 33,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            fillColor: const Color(0xffD9D9D9),
                            filled: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: List.generate(
                      4,
                      (index) {
                        List<String> calculatorBottom = ['+', '-', '*', '/'];
                        return InkWell(
                          onTap: () => context
                              .read<CalculatorProvider>()
                              .onSubmit(calculatorBottom[index]),
                          child: CalculatorBottom(
                            title: calculatorBottom[index],
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffFFFFFF),
                    ),
                    child: Consumer<CalculatorProvider>(
                      builder: (_, provider, __) {
                        return ListView.builder(
                          itemCount: provider.listResults.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Slidable(
                              key: ValueKey(provider.listResults[index]),
                              startActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                dismissible: DismissiblePane(
                                  onDismissed: () {
                                    provider.deleteResult(index);
                                  },
                                ),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      provider.deleteResult(index);
                                    },
                                    backgroundColor: const Color(0xFFFE4A49),
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                  ),
                                ],
                              ),
                              child: ListTile(
                                title: Text(
                                  provider.listResults[index],
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
