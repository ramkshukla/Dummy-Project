import 'package:flutter/material.dart';

class AjioAppBar extends StatefulWidget {
  const AjioAppBar({super.key});

  @override
  State<AjioAppBar> createState() => _AjioAppBarState();
}

class _AjioAppBarState extends State<AjioAppBar> with TickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 56,
              child: TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.grey.withOpacity(0.1),
                  filled: true,
                  prefixIcon: AnimatedIcon(
                      icon: AnimatedIcons.search_ellipsis,
                      progress: controller),
                  hintText: "Search by product,brand..",
                  suffixIcon: const Icon(Icons.camera_alt_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.notifications_outlined),
          const SizedBox(width: 8),
          const Icon(Icons.favorite_outline),
          const SizedBox(width: 8),
          const Icon(Icons.backpack_outlined)
        ],
      ),
    );
  }
}
