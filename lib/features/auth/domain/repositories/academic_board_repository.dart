import 'package:moksha_path/features/auth/domain/entities/academicBoard.dart';

abstract class AcademicBoardRepository {
  Future<List<AcademicBoard>> getAcademicBoards();
}