enum StripeStatus { initial, loading, success, failure }

class StripeState {
  final StripeStatus status;
  final String? error;

  StripeState({this.status = StripeStatus.initial, this.error});
}
