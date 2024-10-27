import 'package:flutter/material.dart';

class Siderbar extends StatelessWidget {
  const Siderbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFFF5F5F5), // Light grey background for the drawer
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // Profile Header
            Container(
              padding: const EdgeInsets.all(16),
              color: const Color(0xFFE0E0E0), // Slightly darker grey for header
              child: Row(
                children: [
                  // Profile Image
                  CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        const AssetImage('asset/images/logoGR.png'),
                  ),
                  const SizedBox(width: 16),
                  // Profile Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'GOT RYU',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'gotryu.contact@gmail.com',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Settings Icon
                  IconButton(
                    icon: const Icon(
                      Icons.settings,
                      color: Color(0xFF6D9B6A), // Softer green
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            // Menu Items
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildMenuItem(Icons.calendar_today, 'ปฏิทินทั้งหมด'),
                  _buildMenuItem(Icons.announcement, 'ประกาศ'),
                  _buildMenuItem(Icons.help_outline, 'วิธีการใช้งาน'),
                ],
              ),
            ),

            // List Items
            const ListTile(
              leading: Icon(Icons.person, color: Color(0xFF6D9B6A)),
              title: Text('ส่วนตัว', style: TextStyle(color: Colors.black87)),
              trailing: Icon(Icons.chevron_right, color: Colors.black54),
            ),
            const ListTile(
              leading: Icon(Icons.group, color: Color(0xFF6D9B6A)),
              title: Text('ครอบครัว', style: TextStyle(color: Colors.black87)),
              trailing: Icon(Icons.chevron_right, color: Colors.black54),
            ),
            const ListTile(
              leading: Icon(Icons.work, color: Color(0xFF6D9B6A)),
              title: Text('ตารางงาน', style: TextStyle(color: Colors.black87)),
              trailing: Icon(Icons.chevron_right, color: Colors.black54),
            ),
            const ListTile(
              leading: Icon(Icons.school, color: Color(0xFF6D9B6A)),
              title: Text('ชั้นเรียน', style: TextStyle(color: Colors.black87)),
              trailing: Icon(Icons.chevron_right, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String label) {
    return Column(
      children: [
        Icon(
          icon,
          color: const Color(0xFF6D9B6A), // Softer green for icons
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.black87, // Darker grey for text
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
