import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SidebarPage(),
    );
  }
}

class SidebarPage extends StatefulWidget {
  const SidebarPage({super.key});

  @override
  State<SidebarPage> createState() => _SidebarPageState();
}

class _SidebarPageState extends State<SidebarPage> {
  // Use a state variable to track the selected project index.
  // The first project is selected by default (index 0).
  int selectedProjectIndex = 0;

  final List<Map<String, dynamic>> projects = [
    {"name": "AppFlow", "icon": Icons.apps},
    {"name": "LoopTest", "icon": Icons.repeat},
    {"name": "AutoDeploy", "icon": Icons.shield},
    {"name": "MobileGauge", "icon": Icons.view_in_ar},
  ];

  final List<Map<String, dynamic>> members = [
    {
      "name": "Ethan Carter",
      "status": "last seen recently",
      "color": Colors.grey,
    },
    {
      "name": "Lena Dawson",
      "status": "online",
      "color": Colors.green,
    },
    {
      "name": "Oliver Brooks",
      "status": "last seen at 10:45",
      "color": Colors.grey,
    },
    {
      "name": "Mike Clarke",
      "status": "last seen just now",
      "color": Colors.grey,
    },
    {
      "name": "Sophie Bennett",
      "status": "online",
      "color": Colors.green,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Projects
              const Text("Projects",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87)),
              const SizedBox(height: 10),
              ...projects.asMap().entries.map((entry) {
                final int index = entry.key;
                final Map<String, dynamic> p = entry.value;
                final bool isSelected = index == selectedProjectIndex;

                return GestureDetector(
                  onTap: () {
                    // Update state when a project is tapped
                    setState(() {
                      selectedProjectIndex = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue.shade50 : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      leading: Icon(p["icon"], color: Colors.blue),
                      title: Text(
                        p["name"],
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: isSelected ? Colors.blue : Colors.black87),
                      ),
                      trailing: const Icon(Icons.more_vert, size: 18),
                    ),
                  ),
                );
              }),
              const SizedBox(height: 20),

              // Team Members
              const Text("Team members",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87)),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: members.length,
                  itemBuilder: (context, index) {
                    final m = members[index];
                    return ListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                      leading: Stack(
                        children: [
                          CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.blue.shade200,
                            child: const Icon(Icons.person,
                                color: Colors.white, size: 22),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              radius: 6,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 5,
                                backgroundColor: m["color"],
                              ),
                            ),
                          )
                        ],
                      ),
                      title: Text(
                        m["name"],
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                      subtitle: Text(
                        m["status"],
                        style: TextStyle(
                            fontSize: 12,
                            color: m["status"] == "online"
                                ? Colors.green
                                : Colors.black54),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}