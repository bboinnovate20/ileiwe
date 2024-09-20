import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:ileiwe/app/auth/model/data/register.dart';
import 'package:ileiwe/app/auth/model/data/user_info.dart';
import 'package:ileiwe/app/auth/provider/user_state_notifier.dart';
import 'package:ileiwe/app/auth/view/widget/input_field_auth.dart';
import 'package:ileiwe/app/coinsHistory/data/models/coin_history.dart';
import 'package:ileiwe/app/coinsHistory/provider/coin_history_notifier.dart';
import 'package:ileiwe/app/onboarding/view/widget/button_one.dart';
import 'package:ileiwe/app/profile/profile_controller.dart';
import 'package:ileiwe/constant/routes.dart';
import 'package:ileiwe/cores/common/widgets/app_container.dart';
import 'package:ileiwe/cores/common/widgets/coin_reward.dart';
import 'package:ileiwe/cores/common/widgets/loading.dart';




class CoinHistoryScreen extends ConsumerStatefulWidget {
  const CoinHistoryScreen({super.key});

  @override
  ConsumerState<CoinHistoryScreen> createState() => _EditProfileState();
}

class _EditProfileState extends ConsumerState<CoinHistoryScreen> {


  @override
  Widget build(BuildContext context) {

    final histories = ref.watch(coinHistoriesProvider);
    
    return 
    
     AppContainer(
          addHeader: true,
          // singleHeader:
          title: "Coin History",
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children:        
              
                    histories.when(
                      data: (history) {
                        return List.generate(
                        history.length,
                        (index) {
                          final myHistory = history[index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 20),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                                color: Colors.white30,
                                borderRadius: BorderRadius.circular(10)
                                
                              ),
                        child:  coinHistoryCard(myHistory),
                      );
              
                        }
                       );
                        
                      }, error: (err, _) =>[Text("$err")], 
                      loading: () => [loadingWidget()])
                    
                ,
              ),
            ),
          )
          
   
   );
  }

  Widget coinHistoryCard(CoinHistory history) {
    return Column(
      children: [
        Row(
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
           const CircleAvatar(radius: 26,child: Icon(Icons.arrow_outward_rounded),),
           const Gap(15),
           Expanded(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(history.title ),
                 Text(history.timestamp, style: const TextStyle(color: Colors.grey))
               ],
             ),
           ),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 10.0),
             child: Text("${history.coinEarned}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
           )
         ],
        ),
           
      ],
    );
  }


}

