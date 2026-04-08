import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Index of the currently visible section (0=Home,1=About,2=Skills,3=Projects,4=Contact)
final activeSectionProvider = StateProvider<int>((ref) => 0);
