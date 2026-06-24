// import 'package:flutter/material.dart';

// class FunctionalSearchScreen extends StatefulWidget {
//   const FunctionalSearchScreen({super.key});

//   @override
//   State<FunctionalSearchScreen> createState() => _FunctionalSearchScreenState();
// }

// class _FunctionalSearchScreenState extends State<FunctionalSearchScreen> {
//   // 1. Controller to read text input
//   final TextEditingController _searchController = TextEditingController();

//   // 2. Your master data source (never modified directly)
//   final List<String> _allFoodItems = [
//     'Space Truffle Burger',
//     'Stellar Fries',
//     'Cosmic Cheese Pizza',
//     'Galactic Milkshake',
//     'Asteroid Onion Rings',
//     'Nebula Nuggets',
//   ];

//   // 3. The list that actually gets displayed on the screen
//   List<String> _filteredItems = [];

//   @override
//   void initState() {
//     super.initState();
//     // At first, the filtered list shows everything
//     _filteredItems = _allFoodItems;
//   }

//   // 4. The search function core logic
//   void _runSearch(String enteredKeyword) {
//     List<String> results = [];

//     if (enteredKeyword.isEmpty) {
//       // If the search bar is empty, show all items
//       results = _allFoodItems;
//     } else {
//       // Filter items checking if the title contains the search keyword
//       // We use .toLowerCase() so the search isn't strict about capital letters
//       results = _allFoodItems
//           .where(
//             (item) => item.toLowerCase().contains(enteredKeyword.toLowerCase()),
//           )
//           .toList();
//     }

//     // Refresh the UI with the filtered items
//     setState(() {
//       _filteredItems = results;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Menu Search')),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               // --- THE SEARCH BAR ---
//               TextField(
//                 controller: _searchController,
//                 onChanged: (value) =>
//                     _runSearch(value), // Calls logic on every keystroke
//                 decoration: InputDecoration(
//                   labelText: 'Search Food',
//                   suffixIcon: _searchController.text.isNotEmpty
//                       ? IconButton(
//                           icon: const Icon(Icons.clear),
//                           onPressed: () {
//                             _searchController.clear(); // Clears text input
//                             _runSearch(''); // Resets list
//                           },
//                         )
//                       : const Icon(Icons.search),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // --- THE RESULTS LIST ---
//               Expanded(
//                 child: _filteredItems.isNotEmpty
//                     ? ListView.builder(
//                         shrinkWrap: true,
//                         physics: const NeverScrollableScrollPhysics(),
//                         itemCount: _filteredItems.length,
//                         itemBuilder: (context, index) {
//                           return Card(
//                             margin: const EdgeInsets.symmetric(vertical: 5),
//                             child: ListTile(
//                               title: Text(_filteredItems[index]),
//                               trailing: const Icon(
//                                 Icons.arrow_forward_ios,
//                                 size: 16,
//                               ),
//                             ),
//                           );
//                         },
//                       )
//                     : const Center(
//                         child: Text(
//                           'No results found',
//                           style: TextStyle(fontSize: 18, color: Colors.grey),
//                         ),
//                       ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
