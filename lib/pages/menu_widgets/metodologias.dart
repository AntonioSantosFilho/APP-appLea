import 'package:flutter/material.dart';

import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class Metodologias extends StatefulWidget {
  const Metodologias({super.key});

  @override
  _MetodologiasState createState() => _MetodologiasState();
}

class _MetodologiasState extends State<Metodologias> {
  final List<Section> _sections = [
    Section(
      header: 'MANUTENÇÃO DO LABORATÓRIO',
      items: ['CUIDADOS COM OS REAGENTES', 'LIMPEZA NO LABORATÓRIO'],
      isExpanded: false,
    ),
    Section(
      header: 'PROCEDIMENTOS DAS ANÁLISES FÍSICO-QUÍMICAS',
      items: [
        'DETERMINAÇÃO DE ALCALINIDADE TOTAL',
        'DETERMINAÇÃO DE CIANETO TOTAL E LIVRE',
        'DETERMINAÇÃO DE CIANETO TOTAL E LIVRE Adaptação LEA',
        'DETERMINAÇÃO DE CLORETOS',
        'DETERMINAÇÃO DE DUREZA',
        'DETERMINAÇÃO DE DQO Método Colorimétrico',
        'DETERMINAÇÃO DE DQO Método do Refluxo Aberto',
        'DETERMINAÇÃO DE DQO Método do Refluxo Fechado com Espectrofotômetro',
        'DETERMINAÇÃO DE DQO Método do Refluxo Fechado Titulométrico',
        'DETERMINAÇÃO DE DEMANDA BIOQUÍMICA DE OXIGÊNIO',
        'DETERMINAÇÃO DE OXIGÊNIO DISSOLVIDO',
        'RESÍDUOS',
        'SÓLIDOS TOTAIS EM AMOSTRAS DE LODO (GRAVIMETRIA)',
        'SÓLIDOS SUSPENSOS VOLÁTEIS EM LODOS (GRAVIMETRIA)',
        'DETERMINAÇÃO DE ÁCIDOS GRAXOS VOLÁTEIS (AGV)',
        'ÁCIDOS ORGÂNICOS VOLÁTEIS – AOV',
        'MICROSCOPIA ELETRÔNICA DE VARREDURA (MEV)',
        'DETERMINAÇÃO DE pH - LODO E ESGOTO',
        'DETERMINAÇÃO DE UMIDADE - LODO E ESGOTO',
        'ÓLEOS E GRAXAS – OG',
        'LIGNINA',
        'DETERMINAÇÃO DAS FRAÇÕES DE CLOROFILA E FEOFITINA DO FITOPLÂNCTON',
        'DETERMINAÇÃO DE CLOROFILA A Método Scor - UNESCO em Strickland & Parsons'
      ],
      isExpanded: false,
    ),
    Section(
      header: 'PROCEDIMENTOS DAS ANÁLISES DE NUTRIENTES',
      items: [
        'DETERMINAÇÃO DE Ca, Mg e K',
        'SÉRIE NITROGENADA',
        'NITROGÊNIO TOTAL (NTK) (NOrg + N-NH3 (ou NH+4))',
        'NITROGÊNIO AMONIACAL (N-NH3 (ou NH+4))',
        'NITROGÊNIO AMONIACAL (N-NH3 (ou NH+4)): AMÔNIA TOTAL OU NH3 - Método do Indofenol',
        'DETERMINAÇÃO DE FÓSFORO TOTAL Standard Methods – 1985',
        'DETERMINAÇÃO DE CARBOIDRATOS',
        'DETERMINAÇÃO DE AMIDO EM MANIPUEIRA',
        'DETERMINAÇÃO DE METAIS'
      ],
      isExpanded: false,
    ),
    Section(
      header: 'PROCEDIMENTOS DAS ANÁLISES MICROBIOLÓGICAS',
      items: [
        'BACTÉRIAS HETEROTRÓFICAS',
        'COLIFORMES TOTAIS - Membrana filtrante',
        'COLIFORMES TOTAIS - Método dos tubos múltiplos',
        'COLIFORMES TERMOTOLERANTES',
        'COLIFORMES FECAIS E. coli',
        'ATIVIDADE METANOGÊNICA ESPECÍFICA (AME)',
        'METODOLOGIA DE OVOS DE HELMINTOS',
        'ENUMERAÇÃO DOS OVOS DE HELMINTOS',
        'ANÁLISE DE ESPOROS DE BACTÉRIAS AERÓBIAS'
      ],
      isExpanded: false,
    ),
    Section(
      header: 'PREPARO DE MEIOS DE CULTURA',
      items: ['CALDO LACTOSE - CAT. M1003-500G', 'CALDO BILE VERDE BRILHANTE 2% - CAT. M121-500G', 'CALDO EC - CAT. M127-500G'],
      isExpanded: false,
    ),
    Section(
      header: 'CALIBRAÇÃO DE EQUIPAMENTOS',
      items: ['CALIBRAÇÃO DO AQUACOLOR', 'REFERÊNCIAS BIBLIOGRÁFICAS'],
      isExpanded: false,
    ),
  ];
  List<Section> _filteredSections = [];

//=~=~=~==~=~=~=~==~=~=~=~==~=~=~=~==~=~==~=~=~=~==~=~=~=~==~=~=~=~=~=~==~=~=LINKS~=~==~=~=~=~~=~==~=~===~=~=~=~==~=~=~=~==~=~=~=~==~=~=~=~==~=~=

  final Map<String, String> itemUrls = {
    'CUIDADOS COM OS REAGENTES': '',
    'LIMPEZA NO LABORATÓRIO': '',
    'DETERMINAÇÃO DE ALCALINIDADE TOTAL': '',
    'DETERMINAÇÃO DE CIANETO TOTAL E LIVRE': '',
    'DETERMINAÇÃO DE CIANETO TOTAL E LIVRE Adaptação LEA': '',
    'DETERMINAÇÃO DE CLORETOS': '',
    'DETERMINAÇÃO DE DUREZA': '',
    'DETERMINAÇÃO DE DQO Método Colorimétrico': '',
    'DETERMINAÇÃO DE DQO Método do Refluxo Aberto': '',
    'DETERMINAÇÃO DE DQO Método do Refluxo Fechado com Espectrofotômetro': '',
    'DETERMINAÇÃO DE DQO Método do Refluxo Fechado Titulométrico': '',
    'DETERMINAÇÃO DE DEMANDA BIOQUÍMICA DE OXIGÊNIO': '',
    'DETERMINAÇÃO DE OXIGÊNIO DISSOLVIDO': '',
    'RESÍDUOS': '',
    'SÓLIDOS TOTAIS EM AMOSTRAS DE LODO (GRAVIMETRIA)': '',
    'SÓLIDOS SUSPENSOS VOLÁTEIS EM LODOS (GRAVIMETRIA)': '',
    'DETERMINAÇÃO DE ÁCIDOS GRAXOS VOLÁTEIS (AGV)': '',
    'ÁCIDOS ORGÂNICOS VOLÁTEIS – AOV': '',
    'MICROSCOPIA ELETRÔNICA DE VARREDURA (MEV)': '',
    'DETERMINAÇÃO DE pH - LODO E ESGOTO': '',
    'DETERMINAÇÃO DE UMIDADE - LODO E ESGOTO': '',
    'ÓLEOS E GRAXAS – OG': '',
    'LIGNINA': '',
    'DETERMINAÇÃO DAS FRAÇÕES DE CLOROFILA E FEOFITINA DO FITOPLÂNCTON': '',
    'DETERMINAÇÃO DE CLOROFILA A Método Scor - UNESCO em Strickland & Parsons': '',
    'DETERMINAÇÃO DE Ca, Mg e K': '',
    'SÉRIE NITROGENADA': '',
    'NITROGÊNIO TOTAL (NTK) (NOrg + N-NH3 (ou NH+4))': '',
    'NITROGÊNIO AMONIACAL (N-NH3 (ou NH+4))': '',
    'NITROGÊNIO AMONIACAL (N-NH3 (ou NH+4)): AMÔNIA TOTAL OU NH3 - Método do Indofenol': '',
    'DETERMINAÇÃO DE FÓSFORO TOTAL Standard Methods – 1985': '',
    'DETERMINAÇÃO DE CARBOIDRATOS': '',
    'DETERMINAÇÃO DE AMIDO EM MANIPUEIRA': '',
    'DETERMINAÇÃO DE METAIS': '',
    'BACTÉRIAS HETEROTRÓFICAS': '',
    'COLIFORMES TOTAIS - Membrana filtrante': '',
    'COLIFORMES TOTAIS - Método dos tubos múltiplos': '',
    'COLIFORMES TERMOTOLERANTES': '',
    'COLIFORMES FECAIS E. coli': '',
    'ATIVIDADE METANOGÊNICA ESPECÍFICA (AME)': '',
    'METODOLOGIA DE OVOS DE HELMINTOS': '',
    'ENUMERAÇÃO DOS OVOS DE HELMINTOS': '',
    'ANÁLISE DE ESPOROS DE BACTÉRIAS AERÓBIAS': '',
    'CALDO LACTOSE - CAT. M1003-500G': '',
    'CALDO BILE VERDE BRILHANTE 2% - CAT. M121-500G': '',
    'CALDO EC - CAT. M127-500G': '',
    'CALIBRAÇÃO DO AQUACOLOR': '',
    'REFERÊNCIAS BIBLIOGRÁFICAS': '',
  };

  @override
  void initState() {
    super.initState();
    _filteredSections = List.from(_sections);
  }

  void filterList(String query) {
    List<Section> filteredList = [];
    if (query.isNotEmpty) {
      filteredList.addAll(_sections.where((section) {
        bool sectionContainsQuery = section.header.toLowerCase().contains(query.toLowerCase());
        bool sectionContainsMatchingItems = section.items.any((item) => item.toLowerCase().contains(query.toLowerCase()));
        return sectionContainsQuery || sectionContainsMatchingItems;
      }));
    } else {
      filteredList = List.from(_sections);
    }
    setState(() {
      _filteredSections = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 249, 252),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: filterList,
              decoration: const InputDecoration(
                labelText: 'Buscar',
                hintText: 'Insira a metodologia desejada',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredSections.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Container(
                      color: Colors.grey[300], // Adiciona cor de fundo para separar as seções
                      height: 1, // Define a altura da linha divisória
                      margin: const EdgeInsets.symmetric(vertical: 10), // Adiciona espaçamento vertical
                    ),
                    ExpansionPanelList(
                      expansionCallback: (int sectionIndex, bool isExpanded) {
                        setState(() {
                          _filteredSections[index].isExpanded = !isExpanded;
                        });
                      },
                      children: [
                        ExpansionPanel(
                          headerBuilder: (BuildContext context, bool isExpanded) {
                            return Container(
                              color: const Color.fromARGB(255, 81, 173, 249),
                              child: ListTile(
                                title: Text(
                                  _filteredSections[index].header,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                          },
                          body: Container(
                            color: Colors.lightBlue[100],
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              itemCount: _filteredSections[index].items.length,
                              itemBuilder: (BuildContext context, int itemIndex) {
                                return GestureDetector(
                                  onTap: () {
                                    if (itemUrls.containsKey(_filteredSections[index].items[itemIndex])) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute<dynamic>(
                                          builder: (_) => PDFViewerCachedFromUrl(
                                            url: itemUrls[_filteredSections[index].items[itemIndex]]!,
                                            name: _filteredSections[index].items[itemIndex],
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  child: Container(
                                    color: Colors.lightBlue[50],
                                    margin: const EdgeInsets.symmetric(vertical: 2),
                                    child: ListTile(
                                      title: Text(
                                        _filteredSections[index].items[itemIndex],
                                        style: const TextStyle(
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          isExpanded: _filteredSections[index].isExpanded,
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Section {
  Section({
    required this.header,
    required this.items,
    required this.isExpanded,
  });

  String header;
  List<String> items;
  bool isExpanded;
}

class PDFViewerCachedFromUrl extends StatelessWidget {
  const PDFViewerCachedFromUrl({Key? key, required this.url, required this.name}) : super(key: key);

  final String url;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: const PDF().cachedFromUrl(
        url,
        placeholder: (double progress) => Center(child: Text('$progress %')),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
      ),
    );
  }
}
