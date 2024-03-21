enum ActionType { create, edit, add, verify, delete }

enum RouteType { push }

class ActionData {
  final ActionType actionType;
  final String comingFrom;
  final RouteType routeType;
  final String currentPage;
  final int pageIndex;

  ActionData({
    this.actionType = ActionType.add,
    this.comingFrom = "",
    this.currentPage = "",
    this.routeType = RouteType.push,
    this.pageIndex = 0,
  });

  ActionData copyWith({
    ActionType? actionType,
    String? comingFrom,
    RouteType? routeType,
    String? currentPage,
    int? pageIndex,
  }) {
    return ActionData(
      actionType: actionType ?? this.actionType,
      routeType: routeType ?? this.routeType,
      comingFrom: comingFrom ?? this.comingFrom,
      currentPage: currentPage ?? this.currentPage,
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }

  @override
  String toString() {
    return "ActionData(actionType: $actionType, comingFrom: $comingFrom, routeType: $routeType, currentPage: $currentPage, pageIndex: $pageIndex)";
  }
}
