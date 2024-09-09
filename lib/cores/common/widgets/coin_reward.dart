import 'package:flutter/material.dart';

rewardWidget(BuildContext context, coinNumber) {
  return Container(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            width: 140,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.tertiary,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset("assets/images/coin_reward.png", height: 25,),
                                const SizedBox(width: 5,),
                                 Text("$coinNumber Coins", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),)
                              ],
                            ),);
}