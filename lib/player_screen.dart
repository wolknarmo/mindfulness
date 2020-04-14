import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:mindfulness/models.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

enum CurrentState { player, settings }

class PlayerScreen extends StatefulWidget {
  PlayerScreen(this.item);

  final Item item;

  @override
  PlayerScreenState createState() => PlayerScreenState(item);
}

class PlayerScreenState extends State<PlayerScreen> {
  PlayerScreenState(this.item);

  final Item item;
  final mainPlayer = AssetsAudioPlayer(id: "main");
  final backgroundPlayer = AssetsAudioPlayer(id: "background");
  var isPlaying = false;
  double volume = 1;
  CurrentState state = CurrentState.player;

  @override
  void initState() {
    super.initState();
    backgroundPlayer.toggleLoop();
    backgroundPlayer.stop();
    mainPlayer.open(Audio(item.audioAsset));
    isPlaying = true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPressed,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(item.background),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              actions: getActions(),
            ),
            body: state == CurrentState.player ? getPlayerWidget() : getSettingsWidget(),
          ),
        ],
      ),
    );
  }

  getActions() {
    return [
      IconButton(
        icon: mainPlayer.volume.value == 0 ? Icon(Icons.volume_off) : Icon(Icons.volume_up),
        onPressed: () {
          mainPlayer.setVolume(mainPlayer.volume.value == 0 ? volume : 0);
          setState(() {});
        },
      ),
      IconButton(
        icon: Icon(Icons.settings),
        onPressed: () {
          setState(() {
            if (state == CurrentState.player)
              state = CurrentState.settings;
            else
              state = CurrentState.player;
          });
        },
      ),
    ];
  }

  getPlayerWidget() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(item.title, style: TextStyle(color: Colors.white, fontSize: 32)),
          getCurrentPosition(),
          getAudioControls(),
        ],
      ),
    );
  }

  getSettingsWidget() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          getHeader("VOLUME"),
          Slider(
            activeColor: Colors.white,
            value: volume,
            onChanged: (double value) {
              setState(() {
                volume = value;
              });
              mainPlayer.setVolume(volume);
            },
          ),
          getHeader("SOUND"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                child: Icon(Icons.cloud),
                color: Colors.blue[900],
                shape: CircleBorder(),
                onPressed: () {
                  backgroundPlayer.open(Audio("assets/rain.mp3"));
                },
              ),
              RaisedButton(
                child: Icon(Icons.brightness_high),
                color: Colors.red,
                shape: CircleBorder(),
                onPressed: () {
                  backgroundPlayer.open(Audio("assets/fire.mp3"));
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  getHeader(String title) => Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(top: 32, bottom: 8),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      );

  Future<bool> onBackPressed() async {
    if (state == CurrentState.settings) {
      setState(() {
        state = CurrentState.player;
      });
      return false;
    } else {
      return true;
    }
  }

  getCurrentPosition() {
    return StreamBuilder(
      stream: mainPlayer.currentPosition,
      builder: (context, asyncSnapshot) {
        final Duration timeElapsed = asyncSnapshot.data;
        var timeLeft = Duration(seconds: mainPlayer.current.value.audio.duration.inSeconds - timeElapsed.inSeconds);
        return CircularPercentIndicator(
          radius: 220.0,
          lineWidth: 2.0,
          percent: timeElapsed.inSeconds / mainPlayer.current.value.audio.duration.inSeconds,
          center: Text(getDurationString(timeLeft), style: TextStyle(color: Colors.white, fontSize: 32)),
          backgroundColor: Colors.white30,
          progressColor: Colors.white,
        );
      },
    );
  }

  getDurationString(Duration duration) {
    if (duration == null) return "";
    return "${duration.inMinutes.remainder(60).toString().padLeft(2, "0")}:${duration.inSeconds.remainder(60).toString().padLeft(2, "0")}";
  }

  getAudioControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Offstage(
          offstage: isPlaying,
          child: OutlineButton(
            borderSide: BorderSide(color: Colors.white),
            child: Text("Stop", style: TextStyle(color: Colors.white)),
            onPressed: () {
              mainPlayer.stop();
              backgroundPlayer.stop();
              setState(() {
                isPlaying = false;
              });
              Navigator.pop(context);
            },
          ),
        ),
        Offstage(
          offstage: !isPlaying,
          child: OutlineButton(
            borderSide: BorderSide(color: Colors.white),
            child: Text("Pause", style: TextStyle(color: Colors.white)),
            onPressed: () {
              mainPlayer.pause();
              backgroundPlayer.pause();
              setState(() {
                isPlaying = false;
              });
            },
          ),
        ),
        Offstage(
          offstage: isPlaying,
          child: RaisedButton(
            color: Colors.white,
            child: Text("Resume"),
            onPressed: () {
              mainPlayer.play();
              backgroundPlayer.play();
              setState(() {
                isPlaying = true;
              });
            },
          ),
        )
      ],
    );
  }
}
