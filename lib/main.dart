import 'package:flutter/material.dart';

void main() {
  runApp(const CheckoutApp());
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CheckoutPage(),
    );
  }
}

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  // Widget untuk menampilkan baris label dan nilai
  Widget _buildInfoRow(String label, String value, {bool isBoldValue = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 13, color: Colors.black54),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 13,
              color: Colors.black87,
              fontWeight: isBoldValue ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk menampilkan langkah-langkah pembayaran
  Widget _buildPaymentStep(int step, String label, String price, bool active) {
    return Column(
      children: [
        CircleAvatar(
          radius: 14,
          backgroundColor: active ? Colors.purple : Colors.grey.shade300,
          child: Text(
            "$step",
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 11)),
        const SizedBox(height: 2),
        Text(price,
            style: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: const Text("Checkout",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bagian Alamat
            const Text(
              "Address",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "82 Melora Street,\nWestbridge, CA, United States. 92841",
              style: TextStyle(fontSize: 13),
            ),
            const SizedBox(height: 4),
            const Text(
              "Phone : +1 (555) 1123-4456",
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
            const SizedBox(height: 20),

            // Bagian Ringkasan Produk
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Product Summary",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "\$123.38",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            _buildInfoRow("Order ID", "BD23672983"),
            _buildInfoRow("Store", "Adidas"),
            _buildInfoRow("Category", "Basketball"),
            _buildInfoRow("Product", "D.O.N ISSUE #6"),
            _buildInfoRow("Colors", "Like Water"),
            _buildInfoRow("Quantity", "1 item"),
            _buildInfoRow("Price", "\$123.38"),
            _buildInfoRow("Shipping", "Free"),
            const SizedBox(height: 20),

            // Bagian Jadwal Pembayaran
            const Text(
              "Payment Schedule",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.purple.shade100,
                        ),
                        child: const Icon(Icons.account_balance_wallet,
                            color: Colors.purple),
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text(
                          "Paynex account\n028********240",
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      const Icon(Icons.more_vert, size: 20),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildPaymentStep(1, "Due Today", "\$22.31", true),
                      _buildPaymentStep(2, "In a month", "\$38.72", false),
                      _buildPaymentStep(3, "In 2 month", "\$39.07", false),
                      _buildPaymentStep(4, "In 3 month", "\$23.28", false),
                    ],
                  ),
                  const SizedBox(height: 14),
                  _buildInfoRow("Down payment due today", "\$22.31", isBoldValue: true),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Tombol Pembayaran
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Payment",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
