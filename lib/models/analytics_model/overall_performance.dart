class OverallPerformance {
  final int completed;
  final int pending;
  final int expired;

  const OverallPerformance({
    required this.completed,
    required this.pending,
    required this.expired,
  });

  int get total => completed + pending + expired;

  int get percentage => total == 0 ? 0 : (completed / total * 100).round();
}