import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/bloc/payment_bloc.dart';
import 'package:shopping_cart/constants/constants.dart';
import 'package:shopping_cart/provider/item_provider.dart';
import 'package:shopping_cart/screens/shopping_onboarding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = Constants.publishableKey;
  runApp(
    BlocProvider(
      create: (context) => StripeBloc(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ItemProvider(),
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: ShoppingOnboard()),
    );
  }
}
