import 'package:flutter/material.dart';

void main() {
  runApp(StudentFinanceApp());
}

class StudentFinanceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Finance Dashboard',
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  double balance = 5000.0; // Saldo awal
  List<Transaction> transactions = [
    Transaction('Uang Saku', 1000.0),
    Transaction('Beli Buku', -200.0),
    Transaction('Bayar Kos', -500.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard Keuangan'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Saldo Saat Ini',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Rp ${balance.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Transaksi Terbaru',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  Transaction transaction = transactions[index];
                  return ListTile(
                    title: Text(transaction.description),
                    trailing: Text(
                      'Rp ${transaction.amount.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: transaction.amount > 0 ? Colors.green : Colors.red,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tambahkan logika untuk menambahkan transaksi baru
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class Transaction {
  final String description;
  final double amount;

  Transaction(this.description, this.amount);
}