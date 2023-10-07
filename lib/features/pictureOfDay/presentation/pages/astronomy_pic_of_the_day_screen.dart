import 'package:astromars/core/utils/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';

class AstronomyPicOfTheDayScreen extends StatelessWidget {
  const AstronomyPicOfTheDayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        key: const Key('picOfTheDayScrollView'),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            pinned: true,
            expandedHeight: 500.0,
            flexibleSpace: FlexibleSpaceBar(
              background: FadeIn(
                duration: const Duration(milliseconds: 500),
                child: ShaderMask(
                  shaderCallback: (rect) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black,
                        Colors.black,
                        Colors.transparent,
                      ],
                      stops: [-0.0, 0.12, 1.0, 1.0],
                    ).createShader(
                      Rect.fromLTRB(0.0, 1.0, rect.width, rect.height),
                    );
                  },
                  blendMode: BlendMode.dstIn,
                  child: CachedNetworkImage(
                    width: MediaQuery.of(context).size.width,
                    imageUrl:
                        'https://apod.nasa.gov/apod/image/2310/M31_HubbleSpitzerGendler_2000.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('The Once and Future Stars of Andromeda',
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 9.0),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 2.0,
                          horizontal: 8.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: const Text(
                          '2023/11/21',
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 16.0)
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    "This picture of Andromeda shows not only where stars are now, but where stars will be. The big, beautiful Andromeda Galaxy, M31, is a spiral galaxy a mere 2.5 million light-years away.  Image data from space-based and ground-based observatories have been combined here to produce this intriguing composite view of Andromeda at wavelengths both inside and outside normally visible light. The visible light shows where M31's stars are now, highlighted in white and blue hues and imaged by the Hubble, Subaru, and Mayall telescopes.  The infrared light shows where M31's future stars will soon form, highlighted in orange hues and imaged by NASA's Spitzer Space Telescope.  The infrared light tracks enormous lanes of dust, warmed by stars, sweeping along Andromeda's spiral arms.  This dust is a tracer of the galaxy's vast interstellar gas, raw material for future star formation.  Of course, the new stars will likely form over the next hundred million years or so. That's well before Andromeda merges with our Milky Way Galaxy in about 5 billion years.",
                  ),
                  const SizedBox(height: 8.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
