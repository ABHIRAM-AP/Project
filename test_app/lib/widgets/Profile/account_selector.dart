import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountSelector extends StatefulWidget {
  const AccountSelector({super.key});

  @override
  State<AccountSelector> createState() => _AccountSelectorState();
}

class _AccountSelectorState extends State<AccountSelector> {
  final List<String> accountNumbers = ['548738468', '568738430', '518794684'];
  String selectedAccount = '548738468';

  void _showAccountMenu() {
    // DropDown From the bottom
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      builder: (context) => Column(
        children: [
          ...accountNumbers.map(
            (acc) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedAccount =
                          acc; // Sets the tapped account in dropbox field
                    });
                    Navigator.pop(
                        context); // Moves back to profile section after selecting account
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (acc ==
                                selectedAccount) // Current Account sets to Active after selecting
                              Text(
                                "Active",
                                style: GoogleFonts.urbanist(
                                  fontSize: 12,
                                  color: Colors.white54,
                                ),
                              ),
                            Text(
                              acc,
                              style: GoogleFonts.urbanist(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const Icon(Icons.north_east, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 16),

          // For Adding New Account
          _addNewAccount(),
        ],
      ),
    );
  }

  void _showAddNewDialog() {
    String newAcc = '';
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Add New Account"),
        content: TextField(
          autofocus: true,
          decoration: const InputDecoration(hintText: "Enter new account"),
          onChanged: (val) => newAcc = val,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              if (newAcc.isNotEmpty) {
                setState(() {
                  accountNumbers.add(newAcc);
                  selectedAccount = newAcc;
                });
              }
              Navigator.pop(context);
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  Widget _addNewAccount() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        _showAddNewDialog(); // Dialog Box for entering new account number
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Add New",
            style: GoogleFonts.urbanist(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.add_circle_outline_sharp, color: Colors.white),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: _showAccountMenu,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white24),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedAccount,
                  style: GoogleFonts.urbanist(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Icon(Icons.keyboard_arrow_down_rounded,
                    color: Colors.white),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
