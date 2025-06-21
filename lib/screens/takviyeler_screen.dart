import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/bottom_menu.dart';
import 'package:go_router/go_router.dart';

class TakviyelerScreen extends StatelessWidget {
  const TakviyelerScreen({super.key});

  void _besinDetayGoster(BuildContext context, String baslik, String icerik) {
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
                  icon: const Icon(Icons.close),
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
    final takviyeler = [
      {
        'baslik': 'Protein Tozu',
        'icerik':
            'Protein tozu özellikle spor yapan kişilerin günlük protein ihtiyacını karşılamalarına yardımcı olan bir besin takviyesidir. Genellikle süt (whey ve casein) yumurta veya bitkisel kaynaklardan elde edilen bu tozlar, kas gelişimi ve toparlanma sürecinde vücuda destek sağlar. Spor sırasında kaslarda küçük yırtılmalar oluşur. Bu yırtıkların onarılması ve kasların güçlenmesi için vücut proteine ihtiyaç duyar. Eğer günlük beslenmeyle yeterli protein alınamıyorsa, protein tozu bu açığı kapatmak için pratik bir çözüm sunar.',
      },
      {
        'baslik': 'Kreatin',
        'icerik':
            'Kreatin vücutta özellikle kısa süreli, yüksek yoğunluklu egzersizlerde enerji üretimini destekleyen bir maddedir. Kaslarda fosfokreatin olarak depolanır ve ani güç patlamaları sırasında hızlı enerji sağlar. Kreatin takviyesi, kaslardaki kreatin depolarını artırarak egzersiz sırasında daha fazla tekrar yapabilmeye, daha ağır kaldırmaya ve genel olarak antrenman performansını artırmaya yardımcı olur.',
      },
      {
        'baslik': 'L-Karnitin',
        'icerik':
            'L-Karnitin vücutta yağ asitlerini hücrelerdeki enerji merkezlerine (mitokondri) taşıyarak yağın enerjiye dönüştürülmesini sağlayan bir maddedir. Ancak L-Karnitin’in etkili olabilmesi için mutlaka düzenli egzersiz ve sağlıklı beslenme ile birlikte kullanılması gerekir. Tek başına kullanıldığında fark edilir sonuçlar vermeyebilir.',
      },
      {
        'baslik': 'Amino Asitler',
        'icerik':
            'Amino asitler, vücudun proteinleri oluşturmak için kullandığı temel yapı taşlarıdır. Kas gelişimi, onarımı ve enerji üretimi için hayati öneme sahiptir. Özellikle yoğun spor yapanlar için önemlidir, çünkü antrenman sırasında kaslarda amino asit kullanımı artar. Doğru zamanda kullanıldığında, toparlanmayı hızlandırır ve kas gelişimini destekler.',
      },
      {
        'baslik': 'Vitaminler & Mineraller',
        'icerik':
            'Vitaminler ve mineraller vücudun sağlıklı çalışması için küçük ama hayati öneme sahip besin öğelerdir. Spor yapan bireylerde bu ihtiyaç daha da artar çünkü egzersiz sırasında vücut daha fazla enerji harcar, ter yoluyla bazı mineralleri kaybeder ve toparlanma süreci için ekstra desteğe ihtiyaç duyar. Doğrudan enerji vermezler ama vücudun enerjiyi doğru şekilde üretmesine, kullanmasına ve toparlanmasına yardımcı olurlar. Bu yüzden sporcular için sessiz ama güçlü yardımcılar olarak görülürler.',
      },
      {
        'baslik': 'Kütle Artırıcılar',
        'icerik':
            'Kütle artırıcılar, özellikle kilo almakta zorlanan veya kas kütlesini artırmak isteyen bireyler için hazırlanmış yüksek kalorili besin takviyeleridir. İçeriğinde genellikle yüksek miktarda karbonhidrat, orta düzeyde protein ve bazen sağlıklı yağlar bulunur. Bu ürünler, günlük alınması gereken kalori miktarını artırmakta zorlanan bireyler için pratik bir çözüm sunar. Özellikle çok hareketli, hızlı metabolizmaya sahip kişiler veya günlük öğünlerle yeterli kalori alamayan sporcular için uygundur.',
      },
      {
        'baslik': 'Kilo Verme İlaçları',
        'icerik':
            'Kilo verme ilaçları, genellikle iştahı azaltma, yağ emilimini engelleme ya da metabolizmayı hızlandırma gibi etkilerle kilo kaybını desteklemeyi amaçlayan ürünlerdir. Ancak bu ilaçlar genellikle tıbbi gözetim altında kullanılması gereken ürünlerdir. Kilo vermek için en sağlıklı ve kalıcı yöntem; düzenli egzersiz, dengeli beslenme ve sabırdır.',
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
          'Takviyeler',
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
        itemCount: takviyeler.length,
        itemBuilder: (context, index) {
          final item = takviyeler[index];
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
                  _besinDetayGoster(context, item['baslik']!, item['icerik']!),
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
