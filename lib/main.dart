import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

final player=AudioPlayer()..setReleaseMode(ReleaseMode.loop);

void main()=>runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final tabs=[
    screen1(),
    screen2(),
    screen3(),
    screen4(),
  ];

  int previousIndex=0;
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    if (currentIndex==0) player.play(AssetSource("1.mp3"));
    return MaterialApp(
      title: '我的自傳',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                       useMaterial3: true,),
      home: Scaffold(
        appBar: AppBar(title: Text('我的自傳'),),
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          selectedFontSize: 18,
          unselectedFontSize: 14,
          iconSize: 30,
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.account_box), label:'自我介紹',),
            BottomNavigationBarItem(icon: Icon(Icons.school), label:'學習歷程',),
            BottomNavigationBarItem(icon: Icon(Icons.schedule_outlined), label:'學習計畫',),
            BottomNavigationBarItem(icon: Icon(Icons.engineering), label:'專業領域',),
          ],
          onTap: (index) {
            setState(() {
              previousIndex=currentIndex;
              currentIndex=index;
              if (index==0) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('1.mp3'));
              }
              if (index==1) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('2.mp3'));
              }
              if (index==2) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('3.mp3'));
              }
              if (index==3) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('4.mp3'));
              }
            });
          },
        ),
      ),
    );
  }
}

class screen1 extends StatelessWidget {

  final String s1='我的家庭平凡、美滿，父親與母親都任職於服務業，祖父已經退休，而我與妹妹都還在求學階段。父母的管教方式開明，鼓勵我們要獨立自主、盡力自主學習，當遇到困難時，他們仍會適時的給我支持與建議。'
                  '父母親對於我們的期待只有保持健康與努力課業，因為健康是人生道路上最重要的資本，如果少了健康，便無法探索與嘗試這個世界上的許多美好事物。對於課業表現，必須持之以恆，學習專業技能，除了未來能夠自食其力外，還有機會造福這個社會。'
                  '我在國小階段有著強烈的好奇心，經常在遴選時毛遂自薦，擔任過多次的班級或學校單位的幹部，擁有豐富的事情處理經驗，當然課內表現也有兼顧，成績位居班級的中上。'
                  '國小畢業後，我就讀一所公立國中，因為是熱門學校，競爭的環境與嚴格的風氣，讓好奇的我趨於沉穩，即便如此，我學會了更多的知識與待人處世的道理，課業方面依舊維持優良。'
                  '進入高中後，新的環境充滿更多挑戰。不僅要學習理論知識，還要將透過實際操作驗證理論。當我適應了這樣的教學模式後，反而感到課程融入實習能夠讓我更有效率的吸收知識，因此課業方面，我都能保持在原來的水平，還有充足的時間參加學校的足球社團，強健體魄。眾多科目中，由於我對於電腦很有興趣，所以我很享受程式設計課程，因為撰寫程式可以讓電腦幫我做許多繁複的工作，而且過程中可以鍛鍊邏輯能力。'
                  '高中畢業，為了繼續鑽研更深廣的知識，我考上了國立科大的資工系，有了高中的基礎知識，讓我在程式的學習上更能得心應手，而且大學的校風自由，因此我能夠選擇我想鑽研領域的相關課程，彈性安排我的課表。我在課業的表現依舊滿意，因為我總是會將不懂的問題向教授發問，或是同學之間組成讀書會，集思廣益，一起研究問題的解決方法。'
                  '未來，我將繼續前行，積極考取國立大學研究所，希望在學習的道路上發展自己的專業知識，有朝一日可以產出知識，帶著我的信念，將我所學轉化為畢生的價值。';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //放標題
          Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text('Who am I?', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          ),
          //自傳部份
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width:3),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(color: Colors.lightGreen, offset: Offset(6, 6)),
              ],
            ),
            child: Text(s1, style: TextStyle(fontSize: 20)),
          ),
          
          SizedBox(height: 10,),
          //放一張照片
          Container(
            color: Colors.redAccent,
            child:Image.asset('images/f2.jpg'),
            height: 350,
            width: 200,
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

class screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('學習歷程'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            children: [
              LearningHistoryItem(
                year: '大一：建構程式基礎',
                content: '學習微積分、程式設計(C語言)、組合語言、互動式網頁(PHP)、計算機結構。',
              ),
              LearningHistoryItem(
                year: '大二：接觸各個領域',
                content: '學習離散數學、線性代數、資料結構、物件導向程式設計(Java)、計算機網路。',
              ),
              LearningHistoryItem(
                year: '大三：製作專題成品',
                content: '學習資料庫語言(SQL)、演算法、作業系統(OS)、準備專題。',
              ),
              LearningHistoryItem(
                year: '大四：實習與未來規劃',
                content: '積極參與校外實習、研究所備考或工作就業計畫。',
              ),
              SizedBox(height: 10.0,),
              Container(
                color: Colors.redAccent,
                child:Image.asset('images/f3.jpg'),
                height: 250,
                width: 200,
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class LearningHistoryItem extends StatelessWidget {
  final String year;
  final String content;

  LearningHistoryItem({required this.year, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          year,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(content),
      ),
    );
  }
}

class screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '學習計畫',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0,),
              Text(
                '大一時期',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                height: 100,
                width: 400,
                child: ListView(
                  children: [
                    AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText('1. 增進英文能力  '
                                          '2. 打好程式基礎  '
                                          '3. 認識其他同學', textStyle: TextStyle(fontSize: 16)),
                      ],
                      repeatForever: true,
                    ),
                  ],
                ),
              ),
              //SizedBox(height: 10.0),
              Text(
                '大二時期',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                height: 100,
                width: 400,
                child: ListView(
                  children: [
                    AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText('1. 接觸其他語言  '
                                          '2. 學習電腦應用  '
                                          '3. 考取資訊證照', textStyle: TextStyle(fontSize: 16)),
                      ],
                      repeatForever: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                '大三時期',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                height: 100,
                width: 400,
                child: ListView(
                  children: [
                    AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText('1. 加深專業課程  '
                                          '2. 參加多益考試  '
                                          '3. 準備實務專題', textStyle: TextStyle(fontSize: 16)),
                      ],
                      repeatForever: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                '大四時期',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 100,
                width: 400,
                child: ListView(
                  children: [
                    AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText('1. 寫研究所考古  '
                                          '2. 參與校外實習  '
                                          '3. 規畫升學就業', textStyle: TextStyle(fontSize: 16)),
                      ],
                      repeatForever: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0,),
              Container(
                alignment: Alignment.center,
                color: Colors.blueAccent,
                child:Image.asset('images/f4.jpg'),
                height: 250,
                width: 170,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('專業領域'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            children: [
              SpecializationItem(
                title: '網頁設計',
                description: '瀏覽器(browser)、使用者介面設計(前端)、伺服器連線與資料庫串接(後端)。',
              ),
              SpecializationItem(
                title: '資料科學',
                description: '機器學習、人工智慧、資料探勘等相關技術。',
              ),
              SpecializationItem(
                title: '資訊安全',
                description: '網路安全、系統防護、資料加密等研究與應用。',
              ),
              SizedBox(height: 10.0,),
              Container(
                color: Colors.greenAccent,
                child:Image.asset('images/f5.jpg'),
                height: 500,
                width: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SpecializationItem extends StatelessWidget {
  final String title;
  final String description;

  SpecializationItem({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(description),
      ),
    );
  }
}