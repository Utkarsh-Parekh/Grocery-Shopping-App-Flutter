import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shopping_cart/bloc/payment_event.dart';
import 'package:shopping_cart/bloc/payment_state.dart';
import 'package:shopping_cart/constants/constants.dart';

class StripeBloc extends Bloc<StripeEvent, StripeState> {
  StripeBloc() : super(StripeState()) {
    on<MakePaymentEvent>(_handlePayment);
  }

  Future<void> _handlePayment(
      MakePaymentEvent event,
      Emitter<StripeState> emit,
      ) async {
    emit(StripeState(status: StripeStatus.loading));

    try {
      final url = Uri.parse("https://api.stripe.com/v1/payment_intents");
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer ${Constants.secreatKey}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: {
          "amount": event.amount.toString(),
          "currency": event.currency,
        },
      );

      final jsonResponse = json.decode(response.body);
      final clientSecret = jsonResponse['client_secret'];


      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: 'Utkarsh’s App',

        ),
      );

      await Stripe.instance.presentPaymentSheet();

      emit(StripeState(status: StripeStatus.success));
    } catch (e) {
      emit(StripeState(status: StripeStatus.failure, error: e.toString()));
    }
  }
}
