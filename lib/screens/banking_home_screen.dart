import 'package:bank_app_ui/detail/transaction_item_detail.dart';
import 'package:bank_app_ui/screens/master_card.dart';
import 'package:bank_app_ui/screens/transactions.dart';
import 'package:flutter/material.dart';

class BankingHomeScreen extends StatefulWidget {
  const BankingHomeScreen({super.key});

  @override
  State<BankingHomeScreen> createState() => _BankingHomeScreenState();
}

class _BankingHomeScreenState extends State<BankingHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          //For Custom App Bar
          customAppBar(),
          SizedBox(
            height: 340,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              scrollDirection: Axis.horizontal,
              children: [
                MasterCard(
                  id: "*******4567",
                  balance: '\$600',
                  color: Colors.deepPurple,
                ),
                MasterCard(
                  id: "*******54970",
                  balance: '\$60',
                  color: Colors.blueAccent,
                ),
                MasterCard(
                  id: "*******966586",
                  balance: '\$50000',
                  color: Colors.pinkAccent,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Transaction",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 18,
            ),
            child: ListView(
              children: [
                TransactionItems(
                    icon: Icons.flight_takeoff,
                    onTab: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const TransactionItemDetails()));
                    },
                    remark: "Travelling",
                    total: "\$445.000",
                    time: "3 Day Ago",
                    date: "24 Feb ",
                    color: Colors.blue),
                     TransactionItems(
                    icon: Icons.fastfood,
                    onTab: (){},
                    remark: "Food",
                    total: "\$45.000",
                    time: "Today",
                    date: "27 Feb ",
                    color: Colors.orange),
                     TransactionItems(
                    icon: Icons.menu_outlined,
                    onTab: (){},
                    remark: "Yoga",
                    total: "\$445.000",
                    time: "1 MonthAgo",
                    date: "24 jan ",
                    color: Colors.deepOrange),
              ],
            ),
          ))
        ],
      )),
    );
  }

  Padding customAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "My Card",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Text(
                "27 Feb",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.grey),
              ),
            ],
          ),
          Container(
            height: 70,
            width: 75,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xffff8b66)),
            child: const Text(
              "😛",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40),
            ),
          )
        ],
      ),
    );
  }
}
