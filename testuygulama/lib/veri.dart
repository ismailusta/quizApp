import 'soru.dart';

class Veri {
  int _mevcutsoru = 0;
  final List<Soru> _tumSorular = [
    Soru("Türkiye'nin başkenti Giresun mudur?", true),
    Soru("Dünya'nın en yüksek dağı Everest midir?", true),
    Soru("Su, oda sıcaklığında genellikle sıvı halde midir?", true),
    Soru("İnsan vücudu genellikle  olarak 37 derece sıcaklığında mıdır?", true),
    Soru("Ay, Dünya'nın ikinci doğal uydusu mudur?", false),
    Soru("Demir, oksijenle temas ettiğinde paslanır mı?", true),
    Soru("Elektrik, normalde bir akım yolu üzerinde hareket eder mi?", true),
    Soru("İstanbul, Türkiye'nin en kalabalık şehri midir?", true),
    Soru("DNA, canlı organizmaların genetik materyali midir?", true),
    Soru("Güneş, bir ay mıdır?", false),
  ];

  String getMetinGetir() {
    return _tumSorular[_mevcutsoru].soruMetni;
  }

  bool getYanitGetir() {
    return _tumSorular[_mevcutsoru].soruYaniti;
  }

  void updateState() {
    if (_mevcutsoru < _tumSorular.length - 1) {
      _mevcutsoru++;
    }
  }

  bool sonSorumu() {
    if (_mevcutsoru + 1 >= _tumSorular.length) {
      return true;
    } else {
      return false;
    }
  }

  void indexsifirla() {
    _mevcutsoru = 0;
  }
}
