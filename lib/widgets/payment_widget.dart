import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/bloc/payment_bloc.dart';
import 'package:shopping_cart/bloc/payment_event.dart';
import 'package:shopping_cart/bloc/payment_state.dart';


class PaymentScreen extends StatelessWidget {
  final int amountTobePay;
  const PaymentScreen({super.key,required this.amountTobePay});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StripeBloc, StripeState>(
          listener: (context, state) {
            if (state.status == StripeStatus.success) {
              showDialog(
                  context: context,
                  builder: (_) => const AlertDialog(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 100.0,
                        ),
                        SizedBox(height: 10.0),
                        Text("Payment Successful!"),
                      ],
                    ),
                  ));

            } else if (state.status == StripeStatus.failure) {
              showDialog(
                  context: context,
                  builder: (_) => const AlertDialog(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.cancel_outlined,
                          color: Colors.red,
                          size: 100.0,
                        ),
                        SizedBox(height: 10.0),
                        Text("Payment Failure!"),
                      ],
                    ),
                  ));
            }
          },
          builder: (context, state) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<StripeBloc>().add(MakePaymentEvent(
                    amount: amountTobePay,
                    currency: 'usd',
                  ));
                },
                child: state.status == StripeStatus.loading
                    ? const CircularProgressIndicator()
                    : const Text('Pay Now'),
              ),
            );
          },
    );
  }
}
