import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CounterPage(),
    );
  }
}
//stateful
class CounterPage extends StatefulWidget {
  const CounterPage({super.key});
  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter_1000 = 0;
  int counter_500 = 0;
  int counter_200 = 0;
  int nowInvest = 0;
  int totalInvest = 0;
  int startGames = 0;
  int endGames = 0;
  int totalRotate = 0;
  double baseRate = 0.0;

  void add_1000() {
    counter_1000++;
    nowInvest += 1000;
    totalInvest = nowInvest;
    setState(() {});
  }void add_500() {
    counter_500++;
    nowInvest += 500;
    totalInvest = nowInvest;
    setState(() {});
  }void add_200() {
    counter_200++;
    nowInvest += 200;
    totalInvest = nowInvest;
    setState(() {});
  }Future<void> baseCount() async {
    baseRate = totalRotate / (totalInvest/1000);
    baseRate = ((baseRate*10).round()) / 10;
    if (totalInvest <= 0 || totalRotate <= 0){
      baseRate = 0.0;
    }
    setState(() {});
  }
  void reset() {
    counter_1000 = 0;
    counter_500 = 0;
    counter_200 = 0;
    totalInvest = 0;
    nowInvest = 0;
    endGames = 0;
    startGames = 0;
    totalRotate = 0;
    baseRate = 0.0;
    setState(() {});
  }

  Future<void> calc(int startNum, endNum) async {
    assert(endNum != null);
    totalRotate = (endNum - startNum);
    totalInvest = nowInvest;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(//UIはここに記述
        appBar: AppBar(
          title: const Text('Pボーダーカウンター'),
        ),
//        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(//縦に並べたい
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text(
                    'Start games：',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    child: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        style: const TextStyle(
                          fontSize: 17,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'num?',
                        ),
                        onChanged: (startNum) {// TODO: ここで取得したtextを使う
                          startGames = int.parse(startNum);
                          calc(startGames, endGames);
                          baseCount();
                        }
                    ),
                  ),
                  const Text(
                    'Now games：',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        style: const TextStyle(
                          fontSize: 17,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'end num?',
                        ),
                        onChanged: (finNum) { // TODO: ここで取得したtextを使う
                          endGames = int.parse(finNum);
                          calc(startGames, endGames);
                          baseCount();
                        }
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  Text(
                    ' 総回転数：$totalRotate',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    ' 投資金額：$totalInvest',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 100),
              Text(
                '1000円 ：$baseRate 回転　',
                style: const TextStyle(
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: 100),
              Row(
                children: const [
                  Text(
                    "投資：1000円",
                    style: TextStyle(
                      fontSize: 19,
                    ),
                  ),
                  SizedBox(
                    width: 61,
                  ),
                  Text(
                    '500円',
                    style: TextStyle(
                      fontSize: 19,
                    ),
                  ),
                  SizedBox(
                    width: 66,
                  ),
                  Text(
                    '200円',
                    style: TextStyle(
                      fontSize: 19,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      // selectHand('✊');
                      add_1000();
                      calc(startGames, endGames);
                      baseCount();
                    },
                    child: Text('$counter_1000'),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      // selectHand('✌');
                      add_500();
                      calc(startGames, endGames);
                      baseCount();
                    },
                    // child: Text('✌'),
                    child: Text('$counter_500'),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      add_200();
                      calc(startGames, endGames);
                      baseCount();
                    },
                    // child: Text('✋'),
                    child: Text('$counter_200'),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            reset();
          },
          child: const Text('clear'),
        )
    );
  }
}