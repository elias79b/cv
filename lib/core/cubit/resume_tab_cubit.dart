import 'package:flutter_bloc/flutter_bloc.dart';

enum ResumeTab {
  home, // Hero + Contact
  experience,
  projects,
}

class ResumeTabCubit extends Cubit<ResumeTab> {
  ResumeTabCubit() : super(ResumeTab.home);

  void changeTab(ResumeTab tab) => emit(tab);
}
