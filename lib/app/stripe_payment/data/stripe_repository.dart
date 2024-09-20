

import 'package:flutter_stripe/flutter_stripe.dart';

class StripePayment {

  StripePayment(){
    // init();
  }
  
  init() async {
    
    await Stripe.instance.applySettings();
  }
  makePayment() async {
    await init();
    
    try {
      final paymentMethod = await Stripe.instance.createPaymentMethod(
            params: const PaymentMethodParams.card(
              paymentMethodData: PaymentMethodData(),
            ),
          );
      
      // await Stripe.instance.confirmPayment(
      //   paymentIntentClientSecret: paymentMethod.id,
      //   data: const PaymentMethodParams.card(
      //     paymentMethodData: PaymentMethodData(
      //       billingDetails: BillingDetails(
      //         email: 'example@email.com',
      //       ),
      //     ),
      //   ),
      // );
      
    } catch (e) {
      
    }

  }
}