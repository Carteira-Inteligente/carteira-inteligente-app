// // Exemplo de uma classe de registro
// import 'package:flutter/material.dart';

// class Registro {
//   final String descricao;
//   final DateTime data;

//   Registro({required this.descricao, required this.data});
// }

// class MonthFilterContainer extends StatefulWidget {
//   const MonthFilterContainer({super.key});

//   @override
//   State<MonthFilterContainer> createState() => _MonthFilterContainerState();
// }

// class _MonthFilterContainerState extends State<MonthFilterContainer> {
//   int _selectedMonth =
//       DateTime.now().month; // Inicializa o mês selecionado com o mês atual

//   List<Registro> _registros = [
//     Registro(descricao: 'Registro 1', data: DateTime(2022, 1, 5)),
//     Registro(descricao: 'Registro 2', data: DateTime(2022, 2, 15)),
//     Registro(descricao: 'Registro 3', data: DateTime(2022, 3, 20)),
//     // Adicione mais registros aqui
//   ];

//   List<Registro> _getRegistrosDoMes(int mes) {
//     return _registros.where((registro) => registro.data.month == mes).toList();
//   }

//   void _incrementMonth() {
//     setState(() {
//       _selectedMonth = (_selectedMonth + 1) % 13;
//       if (_selectedMonth == 0) _selectedMonth = 1;
//     });
//   }

//   void _decrementMonth() {
//     setState(() {
//       _selectedMonth = (_selectedMonth - 1) % 13;
//       if (_selectedMonth == 0) _selectedMonth = 12;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Filtra os registros de acordo com o mês selecionado
//     List<Registro> registrosDoMes = _getRegistrosDoMes(_selectedMonth);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Filtro de Meses'),
//       ),
//       body: Column(
//         children: [
//           MonthFilter(
//             selectedMonth: _selectedMonth,
//             onIncrementMonth: _incrementMonth,
//             onDecrementMonth: _decrementMonth,
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: registrosDoMes.length,
//               itemBuilder: (context, index) {
//                 Registro registro = registrosDoMes[index];
//                 return ListTile(
//                   title: Text(registro.descricao),
//                   subtitle: Text(
//                       'Data: ${registro.data.day}/${registro.data.month}/${registro.data.year}'),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
