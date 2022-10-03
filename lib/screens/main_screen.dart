import 'package:flutter/material.dart';
import 'dart:math';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:memory_matrix/components/TilesForGame1.dart';
import 'package:memory_matrix/components/TilesForGame2.dart';
import 'package:memory_matrix/components/TilesForGame3.dart';
import 'package:memory_matrix/components/TilesForGame5.dart';
import 'package:memory_matrix/components/TilesForGame6.dart';
import 'package:memory_matrix/data/DataOf4.dart';
import 'package:memory_matrix/data/constants.dart';

class MyMainScreen extends StatefulWidget {
  @override
  State<MyMainScreen> createState() => _MyMainScreenState();
}

class _MyMainScreenState extends State<MyMainScreen> {
  late BannerAd _bannerAd;
  late RewardedAd _rewardedAd;
  bool toShow() => Random().nextInt(6) == 1;
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
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Center(child: Text("Exercise", style: large_text)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            padding: const EdgeInsets.all(8),
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Listofgames(1, "Memory", () {
                if (toShow()) {
                  showRewardedAd();
                }
                Navigator.pushNamed(context, '/game11');
              }, TilesForGame1.getTotalScore()),
              Listofgames(2, "Memory Matrix", () {
                if (toShow()) {
                  showRewardedAd();
                }
                Navigator.pushNamed(context, '/game2');
              }, TilesForGame2.getTotalScore()),
              Listofgames(3, "Memory 2", () {
                if (toShow()) {
                  showRewardedAd();
                }
                Navigator.pushNamed(context, '/game3');
              }, TilesForGame3.getTotalScore()),
              Listofgames(4, "Position change", () {
                if (toShow()) {
                  showRewardedAd();
                }
                Navigator.pushNamed(context, '/game4');
              }, DataOf4.getTotalScore()),
              Listofgames(5, "Equal cells", () {
                if (toShow()) {
                  showRewardedAd();
                }
                Navigator.pushNamed(context, '/game5');
              }, TilesForGame5.getTotalScore()),
              Listofgames(6, "Remember word", () {
                if (toShow()) {
                  showRewardedAd();
                }
                Navigator.pushNamed(context, '/game6');
              }, TilesForGame6.getTotalScore()),
              //   ],
              // )
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
  Listofgames(this.ind, this.text, this.pressed, this.score);
  String text;
  int ind;
  void Function()? pressed;
  int score;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: pressed,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF1D1E33),
            borderRadius: BorderRadius.circular(10.0)
          ),
          height: 20,
          width: 20,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                      '${text}',
                      style: small_text,
                    ),
            ),
          ),
          ),
        ),
    );
  }
}
