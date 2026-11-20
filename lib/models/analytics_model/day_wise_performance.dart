class DayWisePerformance {
  final DateTime date;
  final int completed;
  final int pending;
  final int expired;

  const DayWisePerformance({
    required this.date,
    required this.completed,
    required this.pending,
    required this.expired,
  });

  int get total {
    return completed + pending + expired;
  }

  int get percentage => total == 0 ? 0 : (completed / total * 100).round();
}