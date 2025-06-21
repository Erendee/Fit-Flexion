import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/bottom_menu.dart';
import 'package:go_router/go_router.dart';

class FarmakolojiScreen extends StatelessWidget {
  const FarmakolojiScreen({super.key});

  void _detayGoster(BuildContext context, String baslik, String icerik) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).dialogBackgroundColor,
        insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        contentPadding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
                            color: Theme.of(
                              context,
                            ).textTheme.titleLarge?.color,
                          ),
                        ),
                      ),
                      Container(
                        height: 2,
                        color: Theme.of(context).dividerColor,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  color: Theme.of(context).iconTheme.color,
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              icerik,
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).textTheme.bodySmall?.color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ilaclar = [
      {
        'baslik': 'Büyüme Hormonu',
        'icerik':
            'Büyüme hormonu, hipofiz bezinden salgılanan ve vücudun büyüme, onarım ve metabolizmasında kritik rol oynayan bir hormondur. Kas kütlesini artırmak, yağ yakımını hızlandırmak ve toparlanma süreçlerini iyileştirmek için kullanımı yaygındır. Ancak kontrolsüz kullanımı ciddi sağlık risklerine ve hormonal dengesizliklere yol açabilir.',
      },
      {
        'baslik': 'Peptitler',
        'icerik':
            'Peptitler, amino asitlerden oluşan kısa protein zincirleridir ve vücutta çeşitli biyolojik aktiviteleri tetikleyebilirler. Kas onarımı, yağ yakımı ve dayanıklılık artışı gibi amaçlarla farklı peptit türlerini kullanabilirler. Ancak etik ve sağlık açısından riskleri vardır, kullanımı dikkatle yapılmalıdır.',
      },
      {
        'baslik': 'Enjeksiyonlar',
        'icerik':
            'Spor dünyasında enjeksiyon yoluyla alınan çeşitli performans artırıcı maddeler bulunmaktadır. Enjeksiyonlar hızlı emilim sağlar ve etkili olabilir ama enjeksiyonun steril olmaması, yanlış uygulama ve aşırı kullanım ciddi sağlık sorunlarına sebep olabilir.',
      },
      {
        'baslik': 'Ağız Yolu ile Alınanlar',
        'icerik':
            'Farmakolojik ürünler arasında ağız yoluyla alınanlar genellikle hap, kapsül veya sıvı formundadır. Ağızdan alınan ürünler karaciğer tarafından işlenir ve etkisi enjeksiyonlara göre daha yavaş başlayabilir. Yan etkileri ve dozaj takibi önemlidir.',
      },
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).iconTheme.color,
          ),
          onPressed: () => context.go('/book'),
        ),
        centerTitle: true,
        title: Text(
          'Farmakoloji',
          style: TextStyle(
            color: Theme.of(context).textTheme.titleLarge?.color,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: ilaclar.length,
        itemBuilder: (context, index) {
          final item = ilaclar[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).cardColor,
                foregroundColor: Theme.of(context).textTheme.bodyLarge?.color,
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
              ),
              onPressed: () =>
                  _detayGoster(context, item['baslik']!, item['icerik']!),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  item['baslik']!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}
