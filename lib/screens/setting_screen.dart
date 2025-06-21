import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_app/widgets/bottom_menu.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/core/themes.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  void _gosterBilgiKutusu(BuildContext context, String baslik, String icerik) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        contentPadding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: Theme.of(context).colorScheme.surface,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IntrinsicWidth(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          baslik,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ),
                      Container(
                        height: 2,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  color: Theme.of(context).colorScheme.onSurface,
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              icerik,
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTile(
    String title,
    IconData icon, {
    Color? iconColor,
    VoidCallback? onTap,
    Widget? trailing,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: iconColor ?? Theme.of(context).colorScheme.onSurface,
      ),
      title: Text(
        title,
        style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
      ),
      trailing:
          trailing ??
          Icon(
            Icons.chevron_right,
            color: Theme.of(context).colorScheme.onSurface,
          ),
      onTap: onTap,
    );
  }

  void _signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    context.go('/login');
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Hesap",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      body: ListView(
        children: [
          buildTile(
            "Premium",
            FontAwesomeIcons.crown,
            iconColor: Colors.orange,
            onTap: () => context.push('/premium'),
          ),
          buildTile("Uygulamayı puanla", FontAwesomeIcons.star),
          buildTile(
            "Topluluk",
            Icons.groups_outlined,
            onTap: () => _gosterBilgiKutusu(
              context,
              "Topluluk",
              "Uygulamamız henüz piyasaya çıkmamıştır.",
            ),
          ),
          buildTile(
            "Analitik",
            FontAwesomeIcons.chartBar,
            onTap: () => _gosterBilgiKutusu(
              context,
              "Analitik",
              "Analiz verileri anonimdir ve kişisel bilgilerinizi içermez.",
            ),
          ),
          buildTile(
            "Koyu Mod",
            FontAwesomeIcons.moon,
            trailing: Switch(
              value: themeProvider.isDark,
              onChanged: (value) {
                themeProvider.toggleTheme();
              },
            ),
          ),
          const Divider(),

          buildTile(
            "Gizlilik Sözleşmesi",
            FontAwesomeIcons.userSecret,
            onTap: () => _gosterBilgiKutusu(
              context,
              "Gizlilik Sözleşmesi",
              "Yeterince gizli ve deriniz :)",
            ),
          ),
          buildTile(
            "Kullanım Şartları",
            Icons.description,
            onTap: () => _gosterBilgiKutusu(
              context,
              "Kullanım Şartları",
              "Şartlarımız mı? İyi insan ol, uygulamayı temiz kullan.",
            ),
          ),
          buildTile(
            "Çerez Politikası",
            Icons.cookie,
            onTap: () => _gosterBilgiKutusu(
              context,
              "Çerez Politikası",
              "Burada kurabiye kırıntısı değil dijital çerez var.",
            ),
          ),

          const Divider(),

          buildTile(
            "Oturumu Kapat",
            FontAwesomeIcons.doorOpen,
            onTap: () => _signOut(context),
          ),
        ],
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}
