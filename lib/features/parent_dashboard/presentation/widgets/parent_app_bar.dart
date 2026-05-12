import 'package:flutter/material.dart';
import '../../../../core/theme/raeya_colors.dart';

class ParentAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final String? avatarUrl;
  final VoidCallback? onSettingsPressed;
  final VoidCallback? onLogout;

  const ParentAppBar({
    super.key,
    required this.userName,
    this.avatarUrl,
    this.onSettingsPressed,
    this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: RaeyaColors.lightBlueFill,
              backgroundImage: avatarUrl != null ? AssetImage(avatarUrl!) : null,
              child: avatarUrl == null 
                  ? const Icon(Icons.person, color: RaeyaColors.primary) 
                  : null,
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Welcome,',
                  style: TextStyle(
                    fontSize: 12,
                    color: RaeyaColors.textSecondary,
                  ),
                ),
                Text(
                  userName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: RaeyaColors.textPrimary,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: PopupMenuButton<String>(
                icon: const Icon(Icons.settings_outlined, color: RaeyaColors.textPrimary),
                onSelected: (value) {
                  if (value == 'logout') {
                    onLogout?.call();
                  } else if (value == 'settings') {
                    onSettingsPressed?.call();
                  }
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'settings',
                    child: Row(
                      children: [
                        Icon(Icons.settings_outlined, size: 20),
                        SizedBox(width: 12),
                        Text('Settings'),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'logout',
                    child: Row(
                      children: [
                        Icon(Icons.logout, size: 20, color: RaeyaColors.error),
                        SizedBox(width: 12),
                        Text('Log Out', style: TextStyle(color: RaeyaColors.error)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
