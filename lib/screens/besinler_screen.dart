import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/bottom_menu.dart';
import 'package:go_router/go_router.dart';

class BesinlerScreen extends StatelessWidget {
  const BesinlerScreen({super.key});

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
    final besinler = [
      {
        'baslik': 'Kırmızı Et',
        'icerik':
            'Kırmızı et, sporcular için yüksek kaliteli protein, demir ve B12 vitamini gibi önemli besin maddeleri açısından zengin bir gıdadır. Spor yapan bireyler için güçlü ve besleyici bir protein kaynağıdır. Ancak kırmızı etin doymuş yağ oranı da dikkate alınmalıdır. Bu yüzden tüketim sıklığına ve porsiyon boyutuna dikkat edilmelidir.',
      },
      {
        'baslik': 'Balık',
        'icerik':
            'Balık, hem yüksek kaliteli protein hem de sağlıklı yağlar (özellikle Omega-3) içeren önemli bir besin kaynağıdır. Omega-3, vücutta üretilemeyen ve dışarıdan alınması gereken çoklu doymamış yağ asitleridir. Omega-3 alımını artırmak isteyen ancak yeterince balık tüketemeyenler, doktor onayıyla Omega-3 takviyesi de kullanabilir.',
      },
      {
        'baslik': 'Tavuk',
        'icerik':
            'Tavuk, özellikle göğüs kısmı düşük yağ oranı ve yüksek protein içeriği ile sporcuların diyetinde en çok tercih edilen et türlerinden biridir. Kas gelişimi için gerekli temel amino asitleri içerir ve aynı zamanda uzun süre tokluk sağlar. Ayrıca B vitamini, fosfor ve selenyum gibi kas ve sinir sistemi için önemli mikro besinler de içerir.',
      },
      {
        'baslik': 'Meyveler & Sebzeler',
        'icerik':
            'Doğal vitamin, mineral, lif ve antioksidan kaynaklarıdır. Spor yaparken vücudun ihtiyaç duyduğu mikro besin öğelerinin çoğu bu gruptan gelir. Bağışıklık sisteminin güçlenmesine, sindirimin düzenlenmesine ve vücudun zararlı maddelerden arınmasına yardımcı olurlar. Antrenman sonrası enerji için ideal bir doğal şeker kaynağıdır.',
      },
      {
        'baslik': 'Kuruyemişler',
        'icerik':
            'Kuruyemişler (badem, ceviz, fındık, kaju vb.), sağlıklı yağlar, protein, lif ve antioksidanlar açısından oldukça zengin besinlerdir. Sporcular için özellikle ara öğünlerde enerji sağlar, tokluk hissini artırır ve kas onarım sürecine destek olur. Kalori değerleri yüksek olduğu için günde bir avuç kadar tüketilmesi yeterlidir.',
      },
      {
        'baslik': 'Yağlar',
        'icerik':
            'Yağlar, vücudun temel enerji kaynaklarından biridir ve birçok hormonun üretimi için gereklidir. Sağlıklı yağlar (zeytinyağı, avokado yağı, fındık yağı, hindistancevizi yağı) vücudu desteklerken, doymuş ve trans yağlardan (margarin, işlenmiş hazır ürünler) uzak durulmalıdır. Spor yapan bireyler yağdan tamamen kaçmamalı, aksine sağlıklı yağları ölçülü şekilde beslenmelerine dahil etmelidir.',
      },
      {
        'baslik': 'Tahıllar',
        'icerik':
            'Tahıllar, vücudun enerji deposudur. Özellikle uzun süren antrenmanlar ve günlük hareketlilik için gerekli olan karbonhidratları sağlar. Yulaf, esmer pirinç, bulgur ve tam buğday gibi tahıllar sindirimi yavaşlatan lif açısından zengindir. Bu sayede daha uzun süre tok kalınmasını sağlar, kan şekeri dengesini korur ve ani enerji düşüşlerinin önüne geçer.',
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
          onPressed: () {
            context.go('/book');
          },
        ),
        centerTitle: true,
        title: Text(
          'Besinler',
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
        itemCount: besinler.length,
        itemBuilder: (context, index) {
          final item = besinler[index];
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
