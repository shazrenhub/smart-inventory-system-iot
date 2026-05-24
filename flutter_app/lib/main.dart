import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const SmartInventoryApp());
}

class SmartInventoryApp extends StatelessWidget {
  const SmartInventoryApp({super.key});

  static const Color accentGreen = Color(0xFF2E7D6B);
  static const Color cardGray = Color(0xFF4E5652);
  static const Color bgGray = Color(0xFFF4F6F5);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Inventory',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: bgGray,
        primaryColor: accentGreen,
        colorScheme: ColorScheme.fromSeed(seedColor: accentGreen),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black87,
          elevation: 0,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'Smart Inventory',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 2),
            Text(
              'Z.A.Smart',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black54,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: SmartInventoryApp.cardGray,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Z.A.Smart',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Smart Weighing & Inventory System',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Monitor real-time inventory data and weigh items efficiently with Z.A.Smart.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _HomeButtonCard(
              icon: Icons.inventory_2,
              title: 'Live Inventory',
              subtitle: 'Monitor real-time inventory data with Z.A.Smart',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ItemSelectionScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 14),
            _HomeButtonCard(
              icon: Icons.calculate,
              title: 'Calculator Count',
              subtitle: 'Estimate item quantity using Z.A.Smart logic',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const UnitCalculatorScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 14),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                border: Border.all(color: Colors.black12),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.lightbulb_outline,
                    color: SmartInventoryApp.accentGreen,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Tip: Use Live Inventory for real-time monitoring and Calculator Count for quick manual quantity checking.',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                border: Border.all(color: Colors.black12),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.upcoming,
                    color: SmartInventoryApp.accentGreen,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'More items will be added soon.',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
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
}

class ItemSelectionScreen extends StatelessWidget {
  const ItemSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'Available Items',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 2),
            Text(
              'Z.A.Smart',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black54,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: SmartInventoryApp.cardGray,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select an Item',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Choose an available item to view its live inventory page.',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            _HomeButtonCard(
              icon: Icons.calculate_outlined,
              title: 'Calculator',
              subtitle: 'Open live inventory for calculator item',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const InventoryDashboard(),
                  ),
                );
              },
            ),
            const SizedBox(height: 14),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                border: Border.all(color: Colors.black12),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.upcoming,
                    color: SmartInventoryApp.accentGreen,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'More items will be added soon.',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
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
}

class InventoryDashboard extends StatefulWidget {
  const InventoryDashboard({super.key});

  @override
  State<InventoryDashboard> createState() => _InventoryDashboardState();
}

class _InventoryDashboardState extends State<InventoryDashboard> {
  final String blynkToken = 'iQ5yHTT7Jghg4Y1aU9mr_ICYREFaHS6R';

  double weight = 0.0;
  int itemCount = 0;
  String itemStatus = '--';

  final int lowStockThreshold = 1;
  bool _hasShownLowStockPopup = false;

  Timer? timer;

  Future<String> _getPinValue(String pin) async {
    final url = Uri.parse(
      'https://blynk.cloud/external/api/get?token=$blynkToken&$pin',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return response.body.trim();
    } else {
      throw Exception('Failed to fetch $pin');
    }
  }

  Future<void> fetchBlynkData() async {
    try {
      final weightValue = await _getPinValue('V0');
      final piecesValue = await _getPinValue('V1');
      final statusValue = await _getPinValue('V2');

      setState(() {
        weight = double.tryParse(weightValue) ?? 0.0;
        itemCount = int.tryParse(piecesValue) ?? 0;
        itemStatus = statusValue;
      });
    } catch (e) {
      debugPrint('Blynk fetch error: $e');
      setState(() {
        itemStatus = 'Connection error';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchBlynkData();
    timer = Timer.periodic(const Duration(seconds: 2), (_) {
      fetchBlynkData();
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  bool get isStockAvailable {
    return itemStatus.toLowerCase().contains('stock available');
  }

  bool get isNoItem {
    return !isStockAvailable &&
        (itemCount == 0 || itemStatus.toLowerCase().contains('no item'));
  }

  bool get isLowStock {
    return !isNoItem && !isStockAvailable && itemCount <= lowStockThreshold;
  }

  String get calculatorUnitsValue {
    return isStockAvailable ? '4+' : '$itemCount';
  }

  String get calculatorUnitsSubtitle {
    if (isStockAvailable) return 'Stock available';
    if (isNoItem) return 'No calculators detected';
    if (isLowStock) return 'Restock recommended';
    return 'Inventory level is stable';
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if ((isLowStock || isNoItem) && !_hasShownLowStockPopup) {
        _hasShownLowStockPopup = true;

        final message = isNoItem
            ? "⚠️ No calculators detected. Please restock now."
            : "⚠️ Low stock! Please restock calculators soon.";

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            duration: const Duration(seconds: 2),
          ),
        );
      }

      if (!isLowStock && !isNoItem) {
        _hasShownLowStockPopup = false;
      }
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'Live Inventory',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 2),
            Text(
              'Calculator',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black54,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if (isLowStock || isNoItem) ...[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: isNoItem
                      ? const Color(0xFFEDEDED)
                      : const Color(0xFFFFE5E5),
                  border: Border.all(
                    color: isNoItem
                        ? const Color(0xFF757575)
                        : const Color(0xFFD32F2F),
                    width: 1.5,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      isNoItem ? Icons.remove_shopping_cart : Icons.warning,
                      color: isNoItem
                          ? const Color(0xFF616161)
                          : const Color(0xFFD32F2F),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        isNoItem
                            ? "NO CALCULATORS DETECTED. Please restock now."
                            : "LOW STOCK! Please restock calculators soon.",
                        style: TextStyle(
                          color: isNoItem
                              ? const Color(0xFF616161)
                              : const Color(0xFFD32F2F),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
            ],
            _BigCard(
              isLow: isLowStock,
              title: "Calculator Units",
              value: calculatorUnitsValue,
              subtitle: calculatorUnitsSubtitle,
              trailing: _StatusPill(
                isLow: isLowStock,
                isNoItem: isNoItem,
                isStockAvailable: isStockAvailable,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _SmallCard(
                    title: "Total Weight",
                    value: weight.toStringAsFixed(1),
                    unit: "g",
                    icon: Icons.scale,
                    iconColor: SmartInventoryApp.accentGreen,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _SmallCard(
                    title: "Status",
                    value: itemStatus,
                    unit: "",
                    icon: _statusIcon(itemStatus),
                    iconColor: _statusColor(itemStatus),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  IconData _statusIcon(String status) {
    final s = status.toLowerCase();

    if (s.contains('no item')) return Icons.remove_shopping_cart;
    if (s.contains('stock available')) return Icons.inventory_2;
    if (s.contains('unit')) return Icons.check_circle;
    return Icons.info;
  }

  Color _statusColor(String status) {
    final s = status.toLowerCase();

    if (s.contains('no item')) return Colors.grey;
    if (s.contains('stock available')) return SmartInventoryApp.accentGreen;
    if (s.contains('unit')) return const Color(0xFFD32F2F);
    return Colors.blueGrey;
  }
}

class UnitCalculatorScreen extends StatefulWidget {
  const UnitCalculatorScreen({super.key});

  @override
  State<UnitCalculatorScreen> createState() => _UnitCalculatorScreenState();
}

class _UnitCalculatorScreenState extends State<UnitCalculatorScreen> {
  final TextEditingController weightController = TextEditingController();

  String resultText = 'Enter a weight to calculate quantity';
  String statusText = '--';

  void calculateUnits() {
    final double? weight = double.tryParse(weightController.text);

    if (weight == null) {
      setState(() {
        resultText = 'Please enter a valid number';
        statusText = 'Invalid input';
      });
      return;
    }

    int units = 0;
    String status = '';
    String result = '';

    if (weight < 20) {
      units = 0;
      status = 'No item';
      result = '0 unit';
    } else if (weight >= 150 && weight < 340) {
      units = 1;
      status = '1 unit';
      result = '$units unit(s)';
    } else if (weight >= 340 && weight < 500) {
      units = 2;
      status = '2 units';
      result = '$units unit(s)';
    } else if (weight >= 500 && weight < 600) {
      units = 3;
      status = '3 units';
      result = '$units unit(s)';
    } else if (weight >= 600) {
      status = 'Stock Available';
      result = '4+ units';
    } else {
      units = 0;
      status = 'No item';
      result = '0 unit';
    }

    setState(() {
      resultText = result;
      statusText = status;
    });
  }

  @override
  void dispose() {
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'Calculator Count',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 2),
            Text(
              'Z.A.Smart',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black54,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: SmartInventoryApp.cardGray,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Z.A.Smart Quantity Estimator',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Enter the measured weight and let Z.A.Smart estimate the item quantity.',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            TextField(
              controller: weightController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Enter weight (g)',
                hintText: 'Example: 355',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: calculateUnits,
                icon: const Icon(Icons.calculate),
                label: const Text('Calculate'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: SmartInventoryApp.accentGreen,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
            _ResultCard(
              title: 'Estimated Quantity',
              value: resultText,
              icon: Icons.inventory_2,
            ),
            const SizedBox(height: 12),
            _ResultCard(
              title: 'Status',
              value: statusText,
              icon: Icons.info_outline,
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                border: Border.all(color: Colors.black12),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Current Range Reference',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('< 20 g  →  No item'),
                  Text('150 - 339 g  →  1 unit'),
                  Text('340 - 499 g  →  2 units'),
                  Text('500 - 599 g  →  3 units'),
                  Text('≥ 600 g  →  4+ units'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeButtonCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _HomeButtonCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: SmartInventoryApp.cardGray,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icon, color: Colors.white, size: 28),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white70,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ResultCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _ResultCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: SmartInventoryApp.cardGray,
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 28),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 6),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BigCard extends StatelessWidget {
  final bool isLow;
  final String title;
  final String value;
  final String subtitle;
  final Widget trailing;

  const _BigCard({
    required this.isLow,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: SmartInventoryApp.cardGray,
        border: Border.all(
          color: isLow ? const Color(0xFFD32F2F) : Colors.transparent,
          width: 2,
        ),
        boxShadow: [
          if (isLow)
            BoxShadow(
              color: const Color(0xFFD32F2F).withValues(alpha: 0.25),
              blurRadius: 18,
              spreadRadius: 2,
            ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 14, color: Colors.white70),
                ),
                const SizedBox(height: 8),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 44,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}

class _SmallCard extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final IconData icon;
  final Color iconColor;

  const _SmallCard({
    required this.title,
    required this.value,
    required this.unit,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: SmartInventoryApp.cardGray,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, size: 22, color: iconColor),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 14, color: Colors.white70),
              ),
              const SizedBox(height: 6),
              Text(
                value,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              if (unit.isNotEmpty) ...[
                const SizedBox(height: 4),
                Text(
                  unit,
                  style: const TextStyle(color: Colors.white70),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  final bool isLow;
  final bool isNoItem;
  final bool isStockAvailable;

  const _StatusPill({
    required this.isLow,
    required this.isNoItem,
    required this.isStockAvailable,
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color fgColor;
    IconData icon;
    String text;

    if (isStockAvailable) {
      bgColor = const Color(0xFFDFF3EC);
      fgColor = SmartInventoryApp.accentGreen;
      icon = Icons.inventory_2;
      text = "4+";
    } else if (isNoItem) {
      bgColor = Colors.grey.shade300;
      fgColor = Colors.grey.shade800;
      icon = Icons.remove_shopping_cart;
      text = "EMPTY";
    } else if (isLow) {
      bgColor = const Color(0xFFFFE5E5);
      fgColor = const Color(0xFFD32F2F);
      icon = Icons.warning;
      text = "LOW";
    } else {
      bgColor = const Color(0xFFDFF3EC);
      fgColor = SmartInventoryApp.accentGreen;
      icon = Icons.check_circle;
      text = "OK";
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        color: bgColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: fgColor),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: fgColor,
            ),
          ),
        ],
      ),
    );
  }
}