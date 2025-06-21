import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/bottom_menu.dart';
import 'package:go_router/go_router.dart';

class AnsiklopediScreen extends StatelessWidget {
  const AnsiklopediScreen({super.key});

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
    final konular = [
      {
        'baslik': 'Obezite',
        'icerik':
            'Vücutta aşırı yağ birikimi sonucu oluşan, sağlık açısından risk taşıyan bir durumdur. Obezite; kalp hastalıkları, diyabet, yüksek tansiyon gibi birçok kronik hastalığın gelişme riskini artırır. Düzenli egzersiz ve sağlıklı beslenme ile kontrol altına alınabilir.',
      },
      {
        'baslik': 'Metabolizma',
        'icerik':
            'Vücudun besinleri enerjiye dönüştürme, kullanma ve atık maddeleri atma süreçlerinin tümüdür. Metabolizma hızı yaş, cinsiyet, kas kütlesi gibi faktörlere bağlı olarak değişir. Egzersiz metabolizmayı hızlandırarak kilo kontrolüne yardımcı olur.',
      },
      {
        'baslik': 'Hipoksi',
        'icerik':
            'Dokuların yeterli oksijen alamaması durumudur ve genellikle yüksek irtifa ya da solunum hastalıklarında görülür. Hipoksi, fiziksel performansı olumsuz etkiler ve kasların toparlanmasını geciktirebilir. Sporcularda dayanıklılık antrenmanlarında dikkat edilmesi gereken bir durumdur.',
      },
      {
        'baslik': 'Osteopati',
        'icerik':
            'Kas-iskelet sistemi sorunlarının tanı ve tedavisinde manuel terapi tekniklerini kullanan bir sağlık disiplinidir. Sporcularda kas ağrılarının giderilmesinde ve hareket kabiliyetinin artırılmasında faydalıdır. Bütüncül yaklaşımla vücudun doğal iyileşme süreçlerini destekler.',
      },
      {
        'baslik': 'Selülit',
        'icerik':
            'Cilt altında yağ dokusunun düzensiz birikmesiyle oluşan, portakal kabuğu görünümüne neden olan estetik bir sorundur. Hormonal değişiklikler ve genetik faktörler selüliti etkiler. Düzenli egzersiz ve doğru beslenme ile azaltılabilir.',
      },
      {
        'baslik': 'Vücut Kitle İndeksi',
        'icerik':
            'Boy ve kilo oranına göre kişinin ideal kilosunu değerlendiren standart bir ölçüttür. VKİ, obezite ve zayıflık durumlarını hızlıca belirlemeye yarar ancak kas kütlesi gibi faktörleri dikkate almadığı için tek başına sağlık göstergesi değildir.',
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
          'Ansiklopedi',
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
        itemCount: konular.length,
        itemBuilder: (context, index) {
          final item = konular[index];
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
