import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  Widget buildTile(String title, IconData icon, {Color? iconColor}) {
    return ListTile(
      leading: Icon(icon, color: iconColor ?? Colors.black),
      title: Text(title, style: const TextStyle(color: Colors.black)),
      trailing: const Icon(Icons.chevron_right, color: Colors.black),
      onTap: () {}, // Tıklama işlemi buraya
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        title: const Text("Hesap", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFFC5CAE9),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        children: [
          buildTile(
            "Premium",
            FontAwesomeIcons.crown,
            iconColor: Colors.orange,
          ),
          buildTile("Topluluk", Icons.groups_outlined),
          buildTile("Hedeflerim", FontAwesomeIcons.arrowUp),
          buildTile("Analitikler", Icons.bar_chart_outlined),
          buildTile("Geçmiş", Icons.flag),
          buildTile("Ölçümler", Icons.straighten),
          buildTile("Koyu Mod", FontAwesomeIcons.moon),
          const Divider(color: Colors.grey),
          buildTile("Destek ekibine yaz", Icons.headset_mic_outlined),
          buildTile("Bir arkadaşını davet et", Icons.share_outlined),
          buildTile("Uygulamayı puanla", Icons.star_border),
          buildTile("Oturumu Kapat", FontAwesomeIcons.rightFromBracket),
        ],
      ),
    );
  }
}
