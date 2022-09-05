import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:memory_matrix/components/TilesForGame1.dart';
import 'package:memory_matrix/components/TilesForGame2.dart';
import 'package:memory_matrix/components/TilesForGame3.dart';
import 'package:memory_matrix/components/TilesForGame5.dart';
import 'package:memory_matrix/data/DataOf4.dart';

class MyMainScreen extends StatefulWidget {
  @override
  State<MyMainScreen> createState() => _MyMainScreenState();
}

class _MyMainScreenState extends State<MyMainScreen> {
  late BannerAd _bannerAd;
  late RewardedAd _rewardedAd;

  bool _isAdLoaded = false;

  @override
  void initState() {
    super.initState();
    _initBannerAd();
    loadRewardedAd();
    _isAdLoaded = true;
  }

  void loadRewardedAd() {
    RewardedAd.load(
        adUnitId: 'ca-app-pub-3940256099942544/5224354917',
        request: AdRequest(),
        rewardedAdLoadCallback:
            RewardedAdLoadCallback(onAdLoaded: (RewardedAd ad) {
          this._rewardedAd = ad;
        }, onAdFailedToLoad: (LoadAdError err) {
          //
        }));
  }

  void showRewardedAd() {
    _rewardedAd.show(onUserEarnedReward: ((ad, reward) {
      print("Reward Earned in ${reward.amount}");
    }));

    _rewardedAd.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) {},
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError err) {
        ad.dispose();
      },
      onAdDismissedFullScreenContent: (RewardedAd ad) {
        ad.dispose();
      },
      onAdImpression: (RewardedAd ad) => print("${ad} impression occurred"),
    );
    loadRewardedAd();
  }

  _initBannerAd() {
    // var testAdUnitId = 'ca-app-pub-3940256099942544/6300978111';
    _bannerAd = BannerAd(
      // adUnitId: 'ca-app-pub-5065616329586324/4643184259',
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      size: AdSize.banner,
      listener: BannerAdListener(
          onAdLoaded: (ad) {
            setState(() {
              _isAdLoaded = true;
            });
          },
          onAdFailedToLoad: (ad, error) {}),
      request: const AdRequest(),
    );

    _bannerAd.load().then((value) => setState(() => _isAdLoaded = true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   actions: <Widget>[
      //     IconButton(
      //       icon: const Icon(Icons.settings),
      //       onPressed: () {
      //         Navigator.pushNamed(context, '/settings');
      //       },
      //     ),
      //   ],
      //   centerTitle: true,
      //   title: Text("Memory Matrix"),
      //   backgroundColor: Colors.white54,
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/settings');
                    },
                    child: const Icon(
                      Icons.settings_outlined,
                      size: 30,
                    ),
                  ),
                ],
              ),
              const Text(
                "Exercises.", // 6 no  8 yes 9 no 16 yes 23 yes.  nos 6 9.
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Practice daily or when you can't concentrate and you will see improvement very soon.",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    showRewardedAd();
                  },
                  child: Text("kk")),
              Listofgames(1, "Memory.                                         ",
                  () {
                Navigator.pushNamed(context, '/game11');
              }, "Memorize positions", TilesForGame1.getTotalScore()),
              Listofgames(2, "Memory Matrix.                           ", () {
                Navigator.pushNamed(context, '/game2');
              }, "Remember and find the right cells",
                  TilesForGame2.getTotalScore()),
              Listofgames(3, "Ascending Numbers.                  ", () {
                Navigator.pushNamed(context, '/game3');
              }, "Remember and find numbers in ascending order.",
                  TilesForGame3.getTotalScore()),
              Listofgames(4, "Positions change.                        ", () {
                Navigator.pushNamed(context, '/game4');
              }, "Count the number of points that haven't changed their position.",
                  DataOf4.getTotalScore()),
              Listofgames(5, "Equal cells.                                    ",
                  () {
                Navigator.pushNamed(context, '/game5');
              }, "Find the identical cells", TilesForGame5.getTotalScore()),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _isAdLoaded
          ? Container(
              height: _bannerAd.size.height.toDouble(),
              width: _bannerAd.size.width.toDouble(),
              child: AdWidget(ad: _bannerAd),
            )
          : const SizedBox(),
    );
  }
}

class Listofgames extends StatelessWidget {
  Listofgames(this.ind, this.text, this.pressed, this.description, this.score);
  String text;
  String description;
  int ind;
  void Function()? pressed;
  int score;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pressed,
      child: Container(
        color: Colors.white70,
        height: 100,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  '${ind}.',
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "${text}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "${score}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              "${description}",
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
