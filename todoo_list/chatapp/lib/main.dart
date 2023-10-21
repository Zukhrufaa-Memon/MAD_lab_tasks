import 'package:flutter/material.dart';
import 'palette.dart';



class Chat {
  final String sender;
  final String message;
  final DateTime timestamp;
  final String profileImg;
  final bool isDelivered;
  final bool isRead;

  Chat({ required this.sender, required this.message,
        required this.timestamp,required this.profileImg,
        required this.isDelivered,required this.isRead});
}


void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Palette.kToDark,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


 MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
 //var orientation, size,height,width;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this); // Replace 3 with the number of tabs you want
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

 final List<Chat> chats = [
    Chat(sender: "Aiman", message: "Hello!", timestamp: DateTime.now(),profileImg: 'assets/images/girl.png', isDelivered: true, isRead: true),
    Chat(sender: "Faizi", message: "Hi there!", timestamp: DateTime.now(),profileImg: 'assets/images/man.png',  isDelivered: false, isRead: false),
    Chat(sender: "hanan", message: "Flutter is awesome!", timestamp: DateTime.now(),profileImg: 'assets/images/woman.png',  isDelivered: true, isRead: false),
    Chat(sender: "sho", message: "Hello!", timestamp: DateTime.now(),profileImg: 'assets/images/girl.png',  isDelivered: true, isRead: true),
    Chat(sender: "Aisha", message: "Hi there!", timestamp: DateTime.now(),profileImg: 'assets/images/girl.png',  isDelivered: false, isRead: false),
    Chat(sender: "abu", message: "Flutter is awesome!", timestamp: DateTime.now(),profileImg: 'assets/images/man.png',  isDelivered: true, isRead: false),
    Chat(sender: "rayan", message: "Hello!", timestamp: DateTime.now(),profileImg: 'assets/images/woman.png',  isDelivered: true, isRead: true),
    Chat(sender: "Alice", message: "Hi there!", timestamp: DateTime.now(),profileImg: 'assets/images/woman1.png',  isDelivered: false, isRead: false),
    Chat(sender: "zee", message: "Flutter is awesome!", timestamp: DateTime.now(),profileImg: 'assets/images/girl.png',  isDelivered: true, isRead: false),
    Chat(sender: "John", message: "Hello!", timestamp: DateTime.now(),profileImg: 'assets/images/woman.png',  isDelivered: true, isRead: true),
    Chat(sender: "barber", message: "Hi there!", timestamp: DateTime.now(),profileImg: 'assets/images/woman.png',  isDelivered: false, isRead: false),
    Chat(sender: "aunt", message: "Flutter is awesome!", timestamp: DateTime.now(),profileImg: 'assets/images/woman1.png',  isDelivered: true, isRead: false),
    Chat(sender: "sarah", message: "Hello!", timestamp: DateTime.now(),profileImg: 'assets/images/girl.png',  isDelivered: true, isRead: true),
    Chat(sender: "bee", message: "Hi there!", timestamp: DateTime.now(), profileImg: 'assets/images/woman1.png', isDelivered: false, isRead: false),
    Chat(sender: "fajr", message: "Flutter is awesome!", timestamp: DateTime.now(),profileImg: 'assets/images/woman1.png',  isDelivered: true, isRead: false)];

  @override
  Widget build(BuildContext context) {
   

    // orientation = MediaQuery.of(context).orientation;
    // size = MediaQuery.of(context).size;
    // height = size.height;
    // width = size.width;

    return Scaffold(
      floatingActionButtonLocation: 
      FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
      //  centerTitle: true,
      
     //   leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.camera_alt_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_outlined)),
        ],
        title: const Text(
          'Whatsapp',
          ),
        bottom:   TabBar(
          controller: _tabController,
          tabs:  const [ Tab(
          icon: Icon(Icons.groups),
         ),
          Tab(
          text: 'Chats' ,
         ),
         Tab(
          text: 'Status' ,
         ),
         Tab(
          text: 'Calls' ,
         ),
        ]),
      ),
      
      drawer: Drawer(
        child: ListView(
          children: const [

         UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text(
              'Z',
              style: TextStyle(fontSize: 24),),),

          accountName: Text('Zukhrufa Memon'), 
          accountEmail: Text("Zukhrufam@gmail.com"),

          ),
          ListTile(
            title: Text("Home"),
            leading: Icon(Icons.home_filled),
          ),
           ListTile(
            title: Text("Account"),
            leading: Icon(Icons.account_circle_rounded),
          ),
           ListTile(
            title: Text("Settings"),
            leading: Icon(Icons.settings),
          ),
           ListTile(
            title: Text("Contact us"),
            leading: Icon(Icons.contact_phone),
          )
          ],
        ),
      ),
      body:  Center(
        child: TabBarView(
          controller: _tabController,
          children: [
             Text("abc"),
           ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, index) {
              final chat = chats[index];
              return ListTile(
              leading: CircleAvatar(
               backgroundImage: AssetImage(chat.profileImg),
               // backgroundColor: Colors.purple,
               // child: Text(chat.sender[0],
               // style: const TextStyle(color: Colors.black),), // Just using the first letter for demo
              ),
              title: Text(chat.sender),
              subtitle: Row(
                children: [
                  if(chat.isRead)
                  const Icon(
                      Icons.done_all,
                      size: 16,
                      color: Colors.blue,
                    )
                  else if (chat.isDelivered)
                    const Icon(
                      Icons.done_all,
                      size: 16,
                      color: Colors.grey,
                    )
                  else
                    const SizedBox.shrink(),
                    SizedBox(width: 2,),
                  Text(chat.message),
                ],
              ),
              trailing: Text(
                "${chat.timestamp.hour}:${chat.timestamp.minute}",
              ),
            );
            }, ),
            Text("abc"),
            Text("abc")]
        )
        
      ),
         floatingActionButton: FloatingActionButton(
          backgroundColor: Color( 0xff239c62),
          hoverColor: Colors.greenAccent,
          tooltip: "Chat",
          child: Icon(Icons.chat_rounded),
          onPressed: ()
          {
            ScaffoldMessenger.of(context)
            .showSnackBar( 
            SnackBar(
            content: Text("Aiman pagal"),
            duration: Duration(milliseconds: 8000),
            action: SnackBarAction(
              label: "Undo",
              textColor: Colors.white,
              onPressed: (){}))
            );
          }),
    );
  }
}