import 'package:flutter/material.dart';

class TopUpScreen extends StatefulWidget {
  @override
  _TopUpScreenState createState() => _TopUpScreenState();
}

class _TopUpScreenState extends State<TopUpScreen> {
  int selectedOption = 0;
  TextEditingController amountController = TextEditingController();

  final List<Map<String, dynamic>> topUpOptions = [
    {'coins': 21, 'price': 15.00},
    {'coins': 65, 'price': 35.00},
    {'coins': 330, 'price': 179.00},
    {'coins': 660, 'price': 355.00},
    {'coins': 1320, 'price': 709.00},
    {'coins': 3303, 'price': 1780.00},
    {'coins': 6607, 'price': 3550.00},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        centerTitle: true,
        title: const Text(
          "Get Coins",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Coins balance section
            Row(
              children: [
                const Text(
                  "Coins balance: ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Image.asset(
                  'assets/icons/tiktokcion.png', // Ensure the path to your coin icon is correct
                  width: 30,
                  height: 30,
                ),
                const SizedBox(width: 8),
                const Text(
                  "0", // Replace this with the dynamic coin balance
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Top-up options grid
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.5,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: topUpOptions.length,
                itemBuilder: (context, index) {
                  final option = topUpOptions[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOption = index; // Update selected option
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: selectedOption == index
                            ? Colors.pink.shade50
                            : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(2, 2),
                          ),
                        ],
                        border: Border.all(
                          color: selectedOption == index
                              ? Colors.pink.shade600
                              : Colors.grey.shade300,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Using Row for Image and Coin Count
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/icons/tiktokcion.png',
                                  width: 30,
                                  height: 30,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "${option['coins']} ",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 7),

                            // Using Row for Price
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "LAK ",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  "${option['price'].toStringAsFixed(2)}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // Top-up button with gradient background
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink.shade600,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  final selectedTopUp = topUpOptions[selectedOption];
                  _showAmountBottomSheet(selectedTopUp);
                },
                child: const Text(
                  "Recharge",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAmountBottomSheet(Map<String, dynamic> selectedTopUp) {
    // List of bank accounts for selection
    List<String> bankAccounts = ['Bank A', 'Bank B', 'Bank C'];
    // Currency options for selection
    List<String> currencies = ['USDT', 'LAK'];

    // Declare variables for selectedCurrency and selectedBankAccount outside the builder
    String selectedCurrency = currencies[0]; // Default to USDT
    String selectedBankAccount = bankAccounts[0]; // Default to Bank A

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Confirm Top-up",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.pink),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Price and Coins Info
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Coins: ${selectedTopUp['coins']}",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        "Price: LAK ${selectedTopUp['price'].toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 16),
                  // Enter Amount
                  const Text(
                    "Enter Amount:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  DropdownButton<String>(
                    value: selectedCurrency,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCurrency = newValue!;
                      });
                    },
                    items: currencies
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Row(
                          children: [
                            Icon(
                              value == 'USDT'
                                  ? Icons.monetization_on
                                  : Icons.attach_money,
                              color: Colors.pink,
                            ),
                            const SizedBox(width: 8),
                            Text(value),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  // Select Bank Account
                  const Text(
                    "Select Bank Account:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  DropdownButton<String>(
                    value: selectedBankAccount,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedBankAccount = newValue!;
                      });
                    },
                    items: bankAccounts
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Row(
                          children: [
                            const Icon(Icons.account_balance,
                                color: Colors.pink),
                            const SizedBox(width: 8),
                            Text(value),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  // Confirm Payment Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink.shade600,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () {
                        final enteredAmount = amountController.text;
                        if (enteredAmount.isNotEmpty) {
                          print(
                              "Processing payment for amount: $enteredAmount with currency: $selectedCurrency via $selectedBankAccount");
                          Navigator.pop(context);
                        } else {
                          print("Please enter a valid amount.");
                        }
                      },
                      child: const Text(
                        "Confirm Payment",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
