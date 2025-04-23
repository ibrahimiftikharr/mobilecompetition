import 'package:flutter/material.dart';
import 'package:theloanapp/widgets/TextStyles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:theloanapp/services/auth_service.dart';
import 'package:theloanapp/screens/signin_page.dart';


class InvestorHomePage extends StatefulWidget
{
  InvestorHomePage({super.key, required this.currUser});

  final User currUser;

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<InvestorHomePage>
{
  String? selectedAmount;
  final List<String> presetAmounts = ['10', '20', '30', '40', '50'];

  void _selectAmount(String amount) {
    setState(() {
      selectedAmount = amount;
    });
  }

  void _showCustomAmountInput() {
    final TextEditingController controller = TextEditingController();

    showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: myPoppinText('Enter Amount', FontWeight.w600, 18),
        content: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: CupertinoTextField(
            controller: controller,
            placeholder: '\$0',
            keyboardType: TextInputType.number,
          ),
        ),
        actions: [
          CupertinoDialogAction(
            child: myPoppinText("Cancel", FontWeight.w400, 16),
            onPressed: () => Navigator.pop(context),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            child: myPoppinText("OK", FontWeight.w600, 16),
            onPressed: () {
              Navigator.pop(context);
              if (controller.text.isNotEmpty) {
                _selectAmount(controller.text);
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.white,
      navigationBar: CupertinoNavigationBar(
        middle: const Text("Loan"),
        leading: const Icon(CupertinoIcons.back),
        trailing: GestureDetector(
          onTap: () async {
            await AuthService().logout();
            Navigator.of(context).popUntil((route) => route.isFirst);
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SigninPage()));
          },
          child: const Icon(CupertinoIcons.square_arrow_right),
        ),
      ),

      child: SafeArea(
        child: SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 20),


                Image.asset(
                  "assets/loan_banner.jpeg",
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 20),

                myPoppinText("Choose your investment amount", FontWeight.w600, 20),
                const SizedBox(height: 10),

                myPoppinText(
                  "Invest to earn profitable rates, most attractive in the market. Your ultimate desination.",
                  FontWeight.w400,
                  14,
                ),

                const SizedBox(height: 30),


                SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.35,
                  child: GridView.count(
                    crossAxisCount: 3,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    shrinkWrap:
                    true,
                    children: [
                      ...presetAmounts.map((amount) {
                        return LoanAmountBox(
                          label: '\$$amount',
                          icon: Icons.attach_money,
                          isSelected: selectedAmount == amount,
                          onTap: () => _selectAmount(amount),
                        );
                      }),
                      LoanAmountBox(
                        label: "Type the amount",
                        icon: Icons.add,
                        isCustom: true,
                        isSelected:
                        !presetAmounts.contains(selectedAmount ?? ""),
                        onTap: _showCustomAmountInput,
                        iconSize: 20,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),


                CupertinoButton.filled(
                  child: myPoppinText("Next", FontWeight.w500, 16),
                  onPressed: selectedAmount != null
                      ? () {
                    showCupertinoDialog(
                      context: context,
                      builder: (_) => CupertinoAlertDialog(
                        title: myPoppinText(
                            "Selected Amount", FontWeight.w600, 18),
                        content: myPoppinText(
                            "\$$selectedAmount", FontWeight.w500, 16),
                        actions: [
                          CupertinoDialogAction(
                            child:
                            myPoppinText("OK", FontWeight.w500, 16),
                            onPressed: () => Navigator.pop(context),
                          )
                        ],
                      ),
                    );
                  }
                      : null,
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoanAmountBox extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final bool isCustom;
  final VoidCallback onTap;
  final double iconSize; // Added iconSize parameter

  const LoanAmountBox({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
    this.isSelected = false,
    this.isCustom = false,
    this.iconSize = 20, // Default value for icon size is 20
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isCustom ? const Color(0xFFDDF5B7) : const Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? Colors.green : Colors.transparent,
            width: 2,
          ),
        ),
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon,
                  size: iconSize, color: Colors.purple),
              const SizedBox(height: 10),
              myPoppinText(label, FontWeight.w500, 14),
            ],
          ),
        ),
      ),
    );
  }


}