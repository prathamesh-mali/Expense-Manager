import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  const ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromARGB(255, 252, 248, 248)),
      child: LayoutBuilder(
        builder: (ctx, constraints) {
          return Column(
            children: <Widget>[
              SizedBox(
                height: constraints.maxHeight * 0.15,
                child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      '₹ ${spendingAmount.toStringAsFixed(0)}',
                    )),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.05,
              ),
              SizedBox(
                height: constraints.maxHeight * 0.6,
                width: 10,
                child: Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingPctOfTotal,
                    child: Container(
                        decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(10),
                    )),
                  )
                ]),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.05,
              ),
              SizedBox(
                height: constraints.maxHeight * 0.15,
                child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      label,
                    )),
              )
            ],
          );
        },
      ),
    );
  }
}
