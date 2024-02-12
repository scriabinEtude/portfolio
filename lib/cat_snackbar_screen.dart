import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CatSnackBarScreen extends StatefulWidget {
  const CatSnackBarScreen({super.key});

  @override
  State<CatSnackBarScreen> createState() => _CatSnackBarScreenState();
}

class _CatSnackBarScreenState extends State<CatSnackBarScreen> {
  final jc = TextEditingController();

  bool get validation =>
      int.tryParse(jc.text) != null && c0 != null && c1 != null && c2 != null;

  bool submit = false;
  int available = 0;

  _Costume? c0;
  _Costume? c1;
  _Costume? c2;

  @override
  void dispose() {
    jc.dispose();
    super.dispose();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  int getAvailable() => int.tryParse(jc.text) ?? 0;

  final List<_Costume> c = [
    _Costume(_Grade.yellow01),
    _Costume(_Grade.yellow),
    _Costume(_Grade.purple02),
  ];

  void auto() {
    c0 = _Costume(c0!.grade);
    c1 = _Costume(c1!.grade);
    c2 = _Costume(c2!.grade);

    available = getAvailable();
    while (_upgradeMostVPC()) {}
    setState(() {
      submit = true;
    });
  }

  void autoOne() {
    _upgradeMostVPC();
    setState(() {});
  }

  bool _upgradeMostVPC() {
    final co = [c0!, c1!, c2!];
    co.sort((a, b) => -a.valuePerCost.compareTo(b.valuePerCost));
    for (var c in co) {
      if (c.canUpgrade(available)) {
        available = c.upgrade(available);
        return true;
      }
    }
    return false;
  }

  void _setC(int index, _Grade? g) {
    if (g == null) return;
    submit = false;
    setState(() {
      if (index == 0) {
        c0 = _Costume(g);
      } else if (index == 1) {
        c1 = _Costume(g);
      } else {
        c2 = _Costume(g);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              TextField(
                controller: jc,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("보유한 보석"),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (v) => setState(() {
                  submit = false;
                }),
              ),
              const SizedBox(height: 20),
              // Text(available.toString()),
              // Text(valueAll.toString()),
              // Column(
              //   children: [c1, c2, c3]
              //       .map((e) => InkWell(
              //             onTap: () {
              //               setState(() {
              //                 if (e.canUpgrade(available)) {
              //                   available = e.upgrade(available);
              //                 }
              //               });
              //             },
              //             child: Card(
              //               child: Padding(
              //                 padding: EdgeInsets.all(16),
              //                 child: Text(
              //                   '${e.grade}'
              //                   '\nlevel: ${e.level}'
              //                   '\nvalue: ${e.value}'
              //                   '\ncostAll: ${e.costAll}'
              //                   '\nvaluePerCost: ${e.valuePerCost}'
              //                   '\nvalueIncrease: ${e.grade.valueIncrease}'
              //                   '\ncostNext: ${e.costNext}',
              //                 ),
              //               ),
              //             ),
              //           ))
              //       .toList(),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _Selector(
                    "모자",
                    c0?.grade,
                    (g) => _setC(0, g),
                  ),
                  _Selector(
                    "상의",
                    c1?.grade,
                    (g) => _setC(1, g),
                  ),
                  _Selector(
                    "도구",
                    c2?.grade,
                    (g) => _setC(2, g),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              if (!submit)
                ElevatedButton(
                  onPressed: validation ? auto : null,
                  child: const Text("계산하기"),
                )
              else
                Column(
                  children: [
                    Text("남은 보석: $available"),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _ResultWidget(c0!),
                        _ResultWidget(c1!),
                        _ResultWidget(c2!),
                      ],
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ResultWidget extends StatelessWidget {
  const _ResultWidget(this.c);

  final _Costume c;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      child: Column(
        children: [
          const Text("레벨"),
          Text(
            c.level.toString(),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 5),
          Text(
            "수익 증가량\n${c.value}",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          Text(
            "사용 보석\n${c.costAll}",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _Selector extends StatelessWidget {
  const _Selector(
    this.label,
    this.selected,
    this.onChanged,
  );

  final String label;
  final _Grade? selected;
  final void Function(_Grade?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label),
        Text(
          selected?.label ?? "없음",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 20),
        Column(
          children: _Grade.values
              .map((e) => InkWell(
                    onTap: () => onChanged?.call(e),
                    child: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          Radio<_Grade>(
                            value: e,
                            groupValue: selected,
                            onChanged: onChanged,
                          ),
                          Text(e.label),
                        ],
                      ),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class _Costume {
  final _Grade grade;
  int level = 1;
  int costAll = 0;
  int value;
  int get costNext => grade.costIncrease * level;
  double get valuePerCost => grade.valueIncrease / costNext;

  _Costume(this.grade) : value = grade.valueFirst;

  bool canUpgrade(int available) {
    if (level >= grade.maxLevel) return false;
    if (available < costNext) return false;
    return true;
  }

  int upgrade(int available) {
    if (!canUpgrade(available)) throw Exception("can not upgrade");

    var costCurrent = costNext;

    level++;
    costAll += costCurrent;
    value += grade.valueIncrease;

    return available - costCurrent;
  }
}

enum _Grade {
  white("일반", 3, 1, 10, 3),
  green("매직", 9, 3, 15, 5),
  blue("레어", 27, 9, 20, 10),
  purple("에픽", 81, 27, 25, 15),
  purple01("에픽+1", 162, 54, 30, 20),
  purple02("에픽+2", 324, 108, 35, 25),
  yellow("레전드", 648, 216, 40, 30),
  yellow01("레전드+1", 1296, 432, 45, 35);

  final String label;
  final int valueFirst;
  final int valueIncrease;
  final int maxLevel;
  final int costIncrease;

  const _Grade(this.label, this.valueFirst, this.valueIncrease, this.maxLevel,
      this.costIncrease);
}
