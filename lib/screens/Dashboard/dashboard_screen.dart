import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../constants/colors.dart';
import '../../models/entry.dart';
import '../../services/entry_service.dart';
import '../../utils/calculate_value.dart';
import '../../widgets/Cards/dashboard_cards.dart';
import '../../widgets/Containers/progress_containers.dart';
import '../../widgets/Labels/dashboard_card_label.dart';
import '../../widgets/Labels/subtitle_labels.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Entry> _entries = [];
  bool _isLoading = false;

  Future<List<Entry>> _fetchEntries() async {
    setState(() {
      _isLoading = true;
    });

    _entries.clear();

    final entries = await EntryService.findAll();

    setState(() {
      _isLoading = false;
      _entries = entries;
    });

    return entries;
  }

  @override
  void initState() {
    super.initState();
    _fetchEntries();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _isLoading
            ? ProgressIndicatorContainer(
                visible: _isLoading,
              )
            : RefreshIndicator(
                onRefresh: _fetchEntries,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: const <Widget>[
                        BoldSubtitleLabel(
                          padding: EdgeInsets.all(8.0),
                          label: "Resumo",
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        DashboardSmallCard(
                          cardTitle: "A pagar",
                          child: Column(
                            children: <Widget>[
                              DashboardCardLabel(
                                cardSubtitle: "Total previsto",
                                value: calculateToPayValue(_entries),
                                valueColor: cBlue,
                              ),
                              DashboardCardLabel(
                                cardSubtitle: "Total em atraso",
                                value: calculateOverdueValue(_entries),
                                valueColor: cRed,
                              ),
                            ],
                          ),
                        ),
                        DashboardSmallCard(
                          cardTitle: "Pagos",
                          child: DashboardCardLabel(
                            cardSubtitle: "Total pago",
                            value: calculatePaidValue(_entries),
                            valueColor: cGreen,
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    Row(
                      children: const <Widget>[
                        BoldSubtitleLabel(
                          padding: EdgeInsets.all(8.0),
                          label: "Anual",
                        ),
                      ],
                    ),
                    DashboardLargeCard(
                      cardTitle: "Gráfico de evolução mensal",
                      chart: SfCartesianChart(
                        primaryXAxis: CategoryAxis(),
                        series: <ColumnSeries<Entry, String>>[
                          ColumnSeries<Entry, String>(
                            color: cBlue.shade800,
                            dataSource: _entries,
                            xValueMapper: (Entry entry, _) =>
                                DateFormat("MM/yyyy").format(entry.dueDate),
                            yValueMapper: (Entry entry, _) => entry.paidValue,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}
