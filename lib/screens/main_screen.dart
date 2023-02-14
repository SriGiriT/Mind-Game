import 'package:flutter/material.dart';
import 'dart:math';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:memory_matrix/components/TilesForGame1.dart';
import 'package:memory_matrix/data/DataOf1.dart';
import 'package:memory_matrix/data/DataOf2.dart';
import 'package:memory_matrix/data/DataOf3.dart';
import 'package:memory_matrix/data/DataOf4.dart';
import 'package:memory_matrix/data/DataOf5.dart';
import 'package:memory_matrix/data/DataOf6.dart';
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
    DataOf1 dt = new DataOf1();
    DataOf2 dt2 = new DataOf2();
    DataOf3 dt3 = new DataOf3();
    DataOf4 dt4 = new DataOf4();
    DataOf5 dt5 = new DataOf5();
    DataOf6 dt6 = new DataOf6();
    dt.loadData();
    dt2.loadData();
    dt3.loadData();
    dt4.loadData();
    dt5.loadData();
    dt6.loadData();
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

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: Center(child: new Text('Are you sure?')),
            content: new Text('Do you want to exit the application?'),
            actions: <Widget>[
              new ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    print(TilesForGame1.timer);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0A0E21),
          title: Center(
            child: Text(
              "Exercise",
              style: large_text.copyWith(color: Colors.white),
            ),
          ),
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
                }, DataOf1.timer, "images/first.png"),
                Listofgames(2, "Memory Matrix", () {
                  if (toShow()) {
                    showRewardedAd();
                  }
                  Navigator.pushNamed(context, '/game2');
                }, (DataOf2.timer), "images/matrix.png"),
                Listofgames(3, "Memory II", () {
                  if (toShow()) {
                    showRewardedAd();
                  }
                  Navigator.pushNamed(context, '/game3');
                }, DataOf3.timer, "images/second.png"),
                Listofgames(4, "Position change", () {
                  if (toShow()) {
                    showRewardedAd();
                  }
                  Navigator.pushNamed(context, '/game4');
                }, DataOf4.timer, "images/third.png"),
                Listofgames(5, "Equal cells", () {
                  if (toShow()) {
                    showRewardedAd();
                  }
                  Navigator.pushNamed(context, '/game5');
                }, DataOf5.timer, "images/four.png"),
                Listofgames(6, "Remember", () {
                  if (toShow()) {
                    showRewardedAd();
                  }
                  Navigator.pushNamed(context, '/game6');
                }, DataOf6.timer, "images/six.png"),
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Listofgames extends StatelessWidget {
  Listofgames(this.ind, this.text, this.pressed, this.score, this.img);
  String text;
  int ind;
  void Function()? pressed;
  String score;
  String img;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: pressed,
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xFF1D1E33),
              border: Border.all(
                color: Color(0xFF1D1E33),
              ),
              borderRadius: BorderRadius.circular(10.0)),
          height: 20,
          width: 20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(img),
                height: 90,
                width: 90,
              ),
              Text(
                '${text} - ${score}',
                style: large_text.copyWith(color: Colors.white, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
