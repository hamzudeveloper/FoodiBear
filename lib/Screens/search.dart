import 'package:flutter/material.dart';

class ExploreSearchScreen extends StatefulWidget {
  const ExploreSearchScreen({Key? key}) : super(key: key);

  @override
  State<ExploreSearchScreen> createState() => _ExploreSearchScreenState();
}

class _ExploreSearchScreenState extends State<ExploreSearchScreen> {
  // --- STATE MANAGEMENT ---
  // A dynamic list tracking the user's active history chips
  List<String> _recentSearches = [
    'Truffle Pasta',
    'Sushi',
    'Burgers',
    'Poke Bowl',
  ];

  final TextEditingController _searchController = TextEditingController();

  // --- HANDLER FUNCTIONS ---
  // Erases all items from the list array simultaneously and triggers UI update
  void _clearAllSearches() {
    setState(() {
      _recentSearches.clear();
    });
  }

  // Deletes an individual tag element if a user taps it or removes it
  void _removeSearchTag(String tag) {
    setState(() {
      _recentSearches.remove(tag);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFF0B121F,
      ), // Matching dark background canvas
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              // {/* --- APP BAR HEADER CONTROLS --- */}
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // Menu Hamburger Drawer Trigger Button
                      IconButton(
                        onPressed: () {},
                        constraints: const BoxConstraints(),
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.menu,
                          color: Color(0xFFFF9F43),
                          size: 26,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Text(
                        'Explore',
                        style: TextStyle(
                          color: Color(
                            0xFFFFB8A6,
                          ), // Muted peach/orange text title
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  // User Profile Mini Portrait Avatar
                  const CircleAvatar(
                    radius: 18,
                    backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1560250097-0b93528c311a?q=80&w=100',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // {/* --- DECORATED SEARCH TEXTFIELD CONTAINER --- */}
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF161F30), // Dark card surface tint
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.white.withValues(alpha: .02)),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.search,
                      color: Color(0xFFFF7A00),
                      size: 22,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Search restaurants, food, dr...',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          border: InputBorder.none,
                          isDense: true,
                        ),
                      ),
                    ),
                    // Standard inline filter adjustment toggle icon
                    IconButton(
                      onPressed: () {},
                      constraints: const BoxConstraints(),
                      padding: EdgeInsets.zero,
                      icon: const Icon(
                        Icons.tune,
                        color: Color(0xFFFF9F43),
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // {/* --- SECTION LABEL ROW --- */}
              if (_recentSearches.isNotEmpty) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //  alignment :Alignment.center,
                  children: [
                    const Text(
                      'Recent Searches',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: _clearAllSearches,
                      child: const Text(
                        'Clear All',
                        style: TextStyle(
                          color: Color(0xFFFF7A00),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // {/* --- CHIP WRAP VIEW --- */}
                // Wrap handles auto-breaking elements to new rows safely without horizontal layout breaks
                Wrap(
                  spacing: 10.0, // Horizontal distance between layout chips
                  runSpacing: 12.0, // Vertical distance between wrapped rows
                  children: _recentSearches.map((tag) {
                    return GestureDetector(
                      onTap: () {
                        _searchController.text = tag;
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF161F30),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          tag,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ] else ...[
                // Center screen state display fall-back placeholder alternative
                const Expanded(
                  child: Center(
                    child: Text(
                      'No recent searches found.',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
