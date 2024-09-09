
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
// import 'package:ileiwe/cores/common/widgets/network_image.dart';
// import 'package:youtube_player_iframe/youtube_player_iframe.dart'; 

class AllSkits extends StatefulWidget {
  const AllSkits({
    super.key,
  });

  @override
  State<AllSkits> createState() => _AllSkitsState();
}

class _AllSkitsState extends State<AllSkits> {

  // final controller = YoutubePlayerController(); 


  @override
  void initState() {
    super.initState();
    //  controller.loadVideoById(videoId: "KGD-T3bhFEA");
  }

  
  @override
  Widget build(BuildContext context) {
     
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 30,
            decoration:  BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.secondary),
              borderRadius: BorderRadius.circular(10)
            ),
            clipBehavior: Clip.hardEdge,
            child:  Row(
              children: [
                _tabHeader(context, "Recommended", isActive: true, flex: 5),
                
                _tabHeader(context, "Featured", isActive: false, centered: true, flex: 4),
                
                _tabHeader(context, "Popular", isActive: false ,flex: 4)
              ],
            ),
          ),
          //  SizedBox(
          //   height: 400,
          //    child: YoutubePlayer( 
          //     controller: controller, // Controler that we created earlier 
          //     aspectRatio: 16 / 9,      // Aspect ratio you want to take in screen 
          //              ),
          //  ),
           Expanded(
             child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child:          SizedBox(
                              height: 500,
                              child:GridView.count(
                                physics: const NeverScrollableScrollPhysics(),
                                crossAxisCount: 3,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 20,
                                childAspectRatio: 1 / 2.25,
                                children: List.generate(3, (index) {
                                  // final bk = books[index];
                                  return Column(
                                    children: [
                                      Container(
                                        height: 150,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(100),
                                          color: Colors.blue, 
                                        ),
                                        
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: const Text("dddd"))
                                      ),
                                      const Gap(10),
                                      const Text("bk.name", style: TextStyle(fontWeight: FontWeight.bold),), // Example text with index
                                    ],
                                  );
                                }),
                              )
             
                            )
             
                     ,
              ),
                       ),
           ),
        ],
      ),
    );
  }

  Widget _tabHeader(BuildContext context, 
    String title, {isActive=false, centered=false, flex=1} ) {
    return Expanded(
      flex: flex,
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
              border: centered ? Border.symmetric(vertical: 
                      BorderSide(color: Theme.of(context).colorScheme.secondary)) 
                      : Border.all(width: 0, color: Colors.transparent),
              color: isActive ? Theme.of(context).colorScheme.secondary : Colors.transparent,
        ),
                  child:  Align(
                    alignment: Alignment.center,
                    child: Text(title, style:  
                      TextStyle(color: isActive ? Colors.white : Colors.black),)),
                ),
    );
  }
}

