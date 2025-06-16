import '../../../../core/services/use_case.dart';

class CloseSessionEntity extends Param {
  String closeCash, closeNotes;
  int sessionId;

  CloseSessionEntity(
      {required super.loading,
      required this.sessionId,
      required this.closeCash,
      required this.closeNotes});
  Map<String, dynamic> toJson() {
    return {
      'close_cash': closeCash,
      'close_notes': closeNotes,
    };
  }
}
