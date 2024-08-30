
import 'package:flutter/material.dart';

class Badges extends StatelessWidget {
  const Badges({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Badges Earned", style: Theme.of(context).textTheme.titleLarge,),
              const SizedBox(height: 40,),
               Row(
                 children: [
                   SizedBox(
                     width: 100,
                     child: LinearProgressIndicator(
                       minHeight: 6,
                       value: (3 - 1) / 9,
                       backgroundColor: const Color(0xFFC1DAFC),
                       borderRadius: BorderRadius.circular(10),
                       valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF458AEB)),
                     ),
                   ),
                   const SizedBox(width: 10),
                   const Text("3 / 10", style: TextStyle(color: Color.fromARGB(255, 4, 86, 200)),),
                  
                 ],
               ),
      
      
      
            ],
          ),
          const SizedBox(height: 15,),
          const Flexible(
            flex: 1,
            child: BadgeList())
        ],
      ),
    );
  }
}






class BadgeList extends StatelessWidget {
  const BadgeList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2, // Number of columns
        crossAxisSpacing: 10,
        mainAxisSpacing: 20,
        childAspectRatio: 1/1.25,
        children: [
          buildBadgeCard(
            context,
            imagePath: 'assets/images/starter_badge.png',
            gradient: [const Color(0xFFFFEF5C), const Color(0xFFFFDFDF)],
            title: 'Starter',
            earned: true,
            backgroundColor: Colors.yellow,
            titleColor: Colors.orange,
            earnedColor: Colors.orange,
          ),
          buildBadgeCard(
            context,
            gradient: [const Color(0xFFFFECEC), const Color(0xFFC6A8D5)],
            imagePath: 'assets/images/legend_badge.png',
            title: 'Legend',
            earned: true,
            backgroundColor: Colors.purple,
            titleColor: Colors.purple,
            earnedColor: Colors.purple,
            offset: const Offset(0, 30)
          ),
          buildBadgeCard(
            context,
            gradient: [const Color(0xFFFFDFDF), const Color(0xFFFFEF5C)],
            imagePath: 'assets/images/elite_badge.png',
            title: 'Starter',
            earned: true,
            backgroundColor: Colors.blue,
            titleColor: Colors.blue,
            earnedColor: Colors.blue,
          ),
          buildBadgeCard(
            context,
            gradient: [const Color(0xFFFFDFDF), const Color(0xFFFFEF5C)],
            imagePath: 'assets/images/ninja_badge.png',
            title: 'Ninja',
            earned: false,
            backgroundColor: Colors.pink,
            titleColor: Colors.pink,
            earnedColor: Colors.pink,
            offset: const Offset(0, 30)
          ),
        ],
      ),
    );
  }

  Widget buildBadgeCard(
    BuildContext context, {
    required String imagePath,
    required List<Color> gradient,
    required String title,
    required bool earned,
    required Color backgroundColor,
    required Color titleColor,
    required Color earnedColor,
     Offset? offset,
  }) {
    return Transform.translate(
      offset: offset ?? const Offset(0, 0),
      child: Container(
        
        decoration: BoxDecoration(
          // color: backgroundColor,
          backgroundBlendMode: earned ?null : BlendMode.modulate,
          gradient: LinearGradient(
            colors: gradient
            
            ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imagePath, height: 90), // Badge image
              const SizedBox(height: 16),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
                // style: Theme.of(context).textTheme.headline6?.copyWith(
                //       color: titleColor,
                //       fontWeight: FontWeight.bold,
                //     ),
              ),
              const SizedBox(height: 8),
              if (earned)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
                  decoration: BoxDecoration(
                    color: earnedColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text(
                    'Earned',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
      
                if (!earned)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text(
                    'Not yet Earned',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
