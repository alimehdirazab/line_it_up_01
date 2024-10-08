part of 'view.dart';
class UserProfileSavedPaymentMethodPage extends StatelessWidget {
  const UserProfileSavedPaymentMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const UserProfileSavedPaymentMethodView();
  }
}
class UserProfileSavedPaymentMethodView extends StatelessWidget {
  const UserProfileSavedPaymentMethodView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(
          translate(context, 'profile'),
          style: LineItUpTextTheme().body.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),

        centerTitle: true,

      ),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24,),

            Text(
              translate(context, 'saved_payment_method'),
              style: LineItUpTextTheme().body.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 16,),
            PaymentMethodTile(
              onTap: () {
                context.pushPage(const LineSkipperChangePaymentMethodPage(userProfile: true,));
              },
              subtitle: "Exp. 12/29",
              paymetMehtodLogoUrl: LineItUpImages.masterCard,
              paymentMethodName: 'Master Card',
              trailingIcon: true,
            ),

            const SizedBox(height: 32,),

            Text(
              translate(context, 'add_payment_method'),
              style: LineItUpTextTheme().body.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 16,),

            GestureDetector(
              onTap: (){
                context.pushPage(const LineSkipperChangePaymentMethodPage(userProfile: true,));
              },
              child: Container(
                width: double.infinity,
                height: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: LineItUpColorTheme().grey20
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(LineItUpIcons().add,color: LineItUpColorTheme().black10,size: 20,),
                      const SizedBox(width: 10,),

                      Text(
                        translate(context, 'add_a_payment_method'),
                        style: LineItUpTextTheme().body.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            )



          ],
        ),
      ),
    );
  }
}

