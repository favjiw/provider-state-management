import 'package:flutter/material.dart';
import 'package:learn_provider/multi_provider/cart.dart';
import 'package:learn_provider/multi_provider/money.dart';
import 'package:provider/provider.dart';

class MultiProviderMain extends StatelessWidget {
  const MultiProviderMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<Money>(create: (context) => Money()),
          ChangeNotifierProvider<Cart>(create: (context) => Cart()),
        ],
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.purple,
            title: Text('Multi Provider'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Balance'),
                    Container(
                      height: 30,
                      width: 150,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.purple[100],
                        border: Border.all(color: Colors.purple, width: 2),
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Consumer<Money>(
                          builder:
                              (context, money, _) => Text(
                                money.balance.toString(),
                                style: TextStyle(
                                  color: Colors.purple,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 30,
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    // color: Colors.purple[100],
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Consumer<Cart>(
                      builder:
                          (context, cart, _) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Apple (500) x ' + cart.quantity.toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                (500 * cart.quantity).toString(),
                                style: TextStyle(
                                  color: Colors.purple,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Consumer<Money>(
                  builder:
                      (context, money, _) => Consumer<Cart>(
                        builder:
                            (context, cart, _) => TextButton(
                              onPressed: () {
                                money.balance = 10000;
                                cart.quantity = 0;
                              },
                              child: Text('Reset'),
                            ),
                      ),
                ),
              ],
            ),
          ),
          floatingActionButton: Consumer<Money>(
            builder:
                (context, money, _) => Consumer<Cart>(
                  builder:
                      (context, cart, _) => FloatingActionButton(
                        onPressed: () {
                          if (money.balance >= 500) {
                            cart.quantity += 1;
                            money.balance -= 500;
                          }
                        },
                        shape: CircleBorder(),
                        backgroundColor: Colors.purple,
                        child: Icon(
                          Icons.add_shopping_cart,
                          color: Colors.white,
                        ),
                      ),
                ),
          ),
        ),
      ),
    );
  }
}
