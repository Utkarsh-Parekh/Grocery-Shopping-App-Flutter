abstract class StripeEvent {}

class MakePaymentEvent extends StripeEvent {
  final int amount; // in cents
  final String currency;

  MakePaymentEvent({required this.amount, required this.currency});
}
