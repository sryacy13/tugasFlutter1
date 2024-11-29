import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio App',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.purple,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.purple,
      ),
      themeMode: ThemeMode.system,
      home: const PortfolioScreen(),
    );
  }
}

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi Logout'),
          content: const Text('Apakah Anda ingin keluar?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('Ya'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      endDrawer: Drawer(
        child: Container(
          color: const Color.fromARGB(255, 252, 232, 191),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const UserAccountsDrawerHeader(
                accountName: Text(
                  'Asri',
                  style: TextStyle(color: Colors.black),
                ),
                accountEmail: Text(
                  'asri@example.com',
                  style: TextStyle(color: Colors.black),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/profile.jpg'),
                ),
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 125, 236, 222)),
              ),
              ListTile(
                leading: const Icon(Icons.home, color: Colors.black),
                title:
                    const Text('Home', style: TextStyle(color: Colors.black)),
                onTap: () {},
              ),
              ListTile(
                leading: Image.asset(
                  'assets/icons/instagram.png',
                  width: 24,
                  height: 24,
                ),
                title: const Text('Instagram',
                    style: TextStyle(color: Colors.black)),
                onTap: () {
                  _launchURL("https://www.instagram.com");
                },
              ),
              ListTile(
                leading: Image.asset(
                  'assets/icons/tik-tok.png',
                  width: 24,
                  height: 24,
                ),
                title:
                    const Text('TikTok', style: TextStyle(color: Colors.black)),
                onTap: () {
                  _launchURL("https://www.tiktok.com/login");
                },
              ),
              ListTile(
                leading: Image.asset(
                  'assets/icons/facebook.png',
                  width: 24,
                  height: 24,
                ),
                title: const Text('Facebook',
                    style: TextStyle(color: Colors.black)),
                onTap: () {
                  _launchURL("https://www.facebook.com/login");
                },
              ),
              const Divider(
                  color: Color.fromARGB(255, 124, 119, 119),
                  height: 1,
                  thickness: 1),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.black),
                title:
                    const Text('Logout', style: TextStyle(color: Colors.black)),
                onTap: () {
                  _showLogoutDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/profile.jpg'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Asri',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(height: 5),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.purple[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Mobile Application Engineer',
                  style: TextStyle(fontSize: 14, color: Colors.purple),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Tentang Saya',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(height: 10),
              const Text(
                'Saya adalah seorang pengembang aplikasi mobile yang berdedikasi untuk menciptakan aplikasi yang inovatif dan efisien. Saya memiliki pengalaman dalam pengembangan aplikasi berbasis Flutter dan selalu berusaha untuk belajar hal baru.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InfoCard(
                    icon: Icons.work_outline,
                    title: 'Experience',
                    value: '3+ Years',
                    cardColor: Colors.orangeAccent,
                  ),
                  InfoCard(
                    icon: Icons.task_alt,
                    title: 'Projects',
                    value: '20+',
                    cardColor: Colors.tealAccent,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InfoCard(
                    icon: Icons.school_outlined,
                    title: 'Education',
                    value: 'B.S. in Computer Science',
                    cardColor: Colors.blueAccent,
                  ),
                  InfoCard(
                    icon: Icons.card_membership,
                    title: 'Certifications',
                    value: 'Certified Flutter Developer',
                    cardColor: Colors.greenAccent,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const SkillCard(),
              const SizedBox(height: 30),
              const ProjectsCard(), // Added ProjectsCard widget
            ],
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 247, 237, 206),
    );
  }
}

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color cardColor;

  const InfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: cardColor,
      child: Container(
        padding: const EdgeInsets.all(24.0),
        width: 160,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            const SizedBox(height: 10),
            Text(title,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const SizedBox(height: 5),
            Text(value,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

class SkillCard extends StatelessWidget {
  const SkillCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orangeAccent,
      child: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Skill Set',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('• Flutter & Dart'),
            Text('• Firebase'),
            Text('• RESTful API'),
            Text('• Git & GitHub'),
          ],
        ),
      ),
    );
  }
}

class ProjectsCard extends StatelessWidget {
  const ProjectsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      color: Colors.purple[105],
      child: Container(
        padding: const EdgeInsets.all(24),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Projects',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 152, 234, 255)),
            ),
            const SizedBox(height: 14),
            ProjectItem(
              image: 'assets/project1.jpeg',
              title: 'E-commerce App',
            ),
            ProjectItem(
              image: 'assets/project2.jpeg',
              title: 'Weather App',
            ),
            ProjectItem(
              image: 'assets/project3.png',
              title: 'Task Manager App',
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectItem extends StatelessWidget {
  final String image;
  final String title;

  const ProjectItem({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image,
            height: 120, // Ukuran gambar dikurangi
            width: double.infinity,
            fit: BoxFit.cover),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 178, 233, 255)),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
