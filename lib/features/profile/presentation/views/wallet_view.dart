import 'package:flutter/material.dart';
import 'package:thimar/features/profile/presentation/views/widgets/wallet_view_body.dart';
class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WalletViewBody(),
    );
  }
}
