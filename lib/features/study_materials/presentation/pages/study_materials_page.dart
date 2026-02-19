import 'package:flutter/material.dart';

class StudyMaterialsPage extends StatefulWidget {
  const StudyMaterialsPage({super.key});

  @override
  State<StudyMaterialsPage> createState() => _StudyMaterialsPageState();
}

class _StudyMaterialsPageState extends State<StudyMaterialsPage> {
  String selectedBoard = 'ICSE';
  String selectedClass = 'Class 7';
  String selectedDifficulty = 'Difficult';
  String selectedTab = 'Videos';
  String selectedSubject = 'Science';

  final List<String> subjects = [
    'Math',
    'Science',
    'History',
    'Civics',
    'Geography',
    'English Literature',
    'English Grammar',
    'Hindi Sah',
  ];

  final List<String> tabs = ['Videos', 'Practice', 'Tests', 'Notes'];

  final List<String> chapters = [
    'Matter',
    'Physical Quantities & Measurement',
    'Physical Changes',
    'Least Count',
    'Errors',
  ];

  final List<String> coreTopics = [
    'States',
    'Interconversion',
    'Physical Changes',
    'Least Count',
    'Errors',
  ];

  final List<String> boards = ['ICSE', 'CBSE', 'State'];
  final List<String> classes = [
    'Class 6',
    'Class 7',
    'Class 8',
    'Class 9',
    'Class 10',
  ];
  final List<String> difficulties = ['Easy', 'Medium', 'Difficult'];

  // Brand colors
  static const Color kYellow = Color(0xFFFFCC00);
  static const Color kOrange = Color(0xFFFF6B35);
  static const Color kDark = Color(0xFF1A202C);
  static const Color kDarkMid = Color(0xFF2D3748);
  static const Color kGrey = Color(0xFF718096);
  static const Color kBorder = Color(0xFFE2E8F0);
  static const Color kBg = Color(0xFFF7F7F7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeroBanner(),
              _buildSubjectTabs(),
              _buildContentTabs(),
              _buildMainContent(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      drawer: _buildDrawer(),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: kDark),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Moksha',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'Path',
                        style: TextStyle(
                          color: kYellow,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Guided Path to True Learning',
                  style: TextStyle(color: Colors.white54, fontSize: 12),
                ),
              ],
            ),
          ),
          for (final item in [
            'About us',
            'Vidya Kosh',
            'Success Stories',
            'Institutional Access',
            'Request a Demo',
            'Help Center FAQs',
            'Support',
          ])
            ListTile(
              title: Text(
                item,
                style: const TextStyle(fontSize: 14, color: kDarkMid),
              ),
              onTap: () => Navigator.pop(context),
            ),
        ],
      ),
    );
  }

  Widget _buildHeroBanner() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kDark,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          // Vidya Kosh header row
          Container(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: Row(
              children: [
                // Avatar circle
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kOrange,
                    border: Border.all(color: kYellow, width: 3),
                  ),
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 42,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'Vidya ',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: 'Kosh',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                                color: kYellow,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        'Knowledge Hub',
                        style: TextStyle(fontSize: 11, color: Colors.white54),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Learn through ',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: 'Videos',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: kYellow,
                        ),
                      ),
                      TextSpan(
                        text: ', ',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: 'Notes',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: kOrange,
                        ),
                      ),
                      TextSpan(
                        text: ', and ',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: 'Structured Resources',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: kYellow,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Access high-quality video lessons, learning materials, and notes — organised by subject, chapter, and difficulty level.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white60,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),

          // Filters
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.07),
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Choose your filters',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.white54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: _buildDropdown(
                        'Board',
                        selectedBoard,
                        boards,
                        (v) => setState(() => selectedBoard = v!),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildDropdown(
                        'Class',
                        selectedClass,
                        classes,
                        (v) => setState(() => selectedClass = v!),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildDropdown(
                        'Level',
                        selectedDifficulty,
                        difficulties,
                        (v) => setState(() => selectedDifficulty = v!),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown(
    String label,
    String value,
    List<String> items,
    ValueChanged<String?> onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 10, color: Colors.white54),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButton<String>(
            value: value,
            isExpanded: true,
            underline: const SizedBox(),
            style: const TextStyle(fontSize: 11, color: kDarkMid),
            dropdownColor: Colors.white,
            items: items
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e,
                      style: const TextStyle(fontSize: 11, color: kDarkMid),
                    ),
                  ),
                )
                .toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  Widget _buildSubjectTabs() {
    return Container(
      height: 44,
      margin: const EdgeInsets.only(bottom: 2),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: subjects.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (_, i) {
          final isSelected = subjects[i] == selectedSubject;
          return GestureDetector(
            onTap: () => setState(() => selectedSubject = subjects[i]),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? kYellow : Colors.white,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: isSelected ? kYellow : kBorder),
              ),
              child: Text(
                subjects[i],
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? kDark : kGrey,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContentTabs() {
    return Container(
      height: 48,
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: tabs.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (_, i) {
          final isSelected = tabs[i] == selectedTab;
          return GestureDetector(
            onTap: () => setState(() => selectedTab = tabs[i]),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: isSelected ? kOrange : Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: isSelected ? kOrange : const Color(0xFFCBD5E0),
                ),
              ),
              child: Text(
                tabs[i],
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: isSelected ? Colors.white : kGrey,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMainContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sidebar
          SizedBox(
            width: 130,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSidebarSection('Chapters', chapters, kOrange),
                const SizedBox(height: 16),
                _buildSidebarSection('Core Topics', coreTopics, kYellow),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Main area
          Expanded(child: _buildVideosEmptyState()),
        ],
      ),
    );
  }

  Widget _buildSidebarSection(
    String title,
    List<String> items,
    Color activeColor,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w800,
                color: kDarkMid,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'Show All',
                style: TextStyle(fontSize: 9, color: kGrey),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ...items.asMap().entries.map((entry) {
          final isActive = entry.key == 1;
          final activeBg = activeColor == kYellow ? kYellow : kOrange;
          final activeTextColor = activeColor == kYellow ? kDark : Colors.white;
          return Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 6),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            decoration: BoxDecoration(
              color: isActive ? activeBg : Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: isActive ? activeBg : kBorder),
            ),
            child: Text(
              entry.value,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: isActive ? activeTextColor : const Color(0xFF4A5568),
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildVideosEmptyState() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: kBorder),
      ),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: const BoxDecoration(
              color: kYellow,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.play_circle_outlined,
              color: kDark,
              size: 36,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Select a Chapter',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: kDark,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Choose a chapter from the sidebar to browse available videos for that topic.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 11, color: kGrey, height: 1.5),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: kDark,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Browse All',
              style: TextStyle(
                color: kYellow,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
