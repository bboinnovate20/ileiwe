
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:ileiwe/app/library/data/models/video.dart';
import 'package:ileiwe/app/library/providers/library_provider.dart';
import 'package:ileiwe/app/library/view/widget/video_card.dart';
import 'package:ileiwe/cores/common/widgets/loading.dart';
// import 'package:ileiwe/cores/common/widgets/network_image.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart'; 

class AllSkits extends ConsumerStatefulWidget {
  const AllSkits({
    super.key,
    required this.skits,
    required this.showHeader
  });

  final List<Video> skits;
  final bool showHeader;

  @override
  ConsumerState<AllSkits> createState() => _AllSkitsState();
}

class _AllSkitsState extends ConsumerState<AllSkits> {

  int active = 0;

  @override
  void initState() {
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
     
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.showHeader ? Container(
            height: 40,
            decoration:  BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.secondary),
              borderRadius: BorderRadius.circular(10)
            ),
            clipBehavior: Clip.hardEdge,
            child:  Row(
              children: [
                _tabHeader(context, "Recommended", isActive: active==0, flex: 5, action: () => setState(() => active = 0) ),
                
                _tabHeader(context, "Featured", isActive: active==1, centered: true, flex: 4, action: () => setState(() => active = 1)),
                
                _tabHeader(context, "Popular", isActive: active==2 ,flex: 4, action: () => setState(() => active = 2))
              ],
            ) ,
          ): const Gap(10),
           
           Expanded(
             child: Padding(
               padding: const EdgeInsets.only(top: 20.0),
               child:          SizedBox(
                             height: 500,
                             child:GridView.count(
                               
                               crossAxisCount: 2,
                               crossAxisSpacing: 10,
                               mainAxisSpacing: 20,
                               childAspectRatio: 1.15 / 1.45,
                               children: List.generate(widget.skits.length, (index) {
                                 final skit = widget.skits[index];
                                 return Column(
                                   children: [
                                     ClipRRect(
                                       borderRadius: BorderRadius.circular(10),
                                       child: SizedBox(
                                         // height: 10,
                                         child: videoThumbnail(context,  Video(id: skit.id, categoryName: skit.categoryName, 
                                         thumbnailUrl: skit.thumbnailUrl, videoId: skit.videoId, title: skit.title)))),
                                     // const Gap(10),
                                   ],
                                 );
                               }),
                             )
                          
                           ),
             )
              
            )
          
        ],
      ),
    );
  }


  Widget _tabHeader(BuildContext context, 
    String title, {isActive=false, centered=false, flex=1, required void Function() action} ) {
    return Expanded(
      flex: flex,
      child: GestureDetector(
        onTap: () => action(),
        child: Container(
          // height: 100,
          padding: const EdgeInsets.symmetric(horizontal: 10,),
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
      ),
    );
  }
}

