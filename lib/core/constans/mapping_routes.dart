
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/base/base_view.dart';
import '../../presentation/professions/professions_view.dart';

class RouteConstants {
  static const login = '/login';
  static const home = '/home';
  static const professions = '/professions';
  // static const signUp = '/sign_up';
  // static const forgotPassword = '/forgot_password';
  // static const home = '/home';
  // static const newPassword = '/new_password';
  // static const trainingList = '/training_list';
  // static const myPatent = '/my_patent';
  // static const trainingDetail = '/training_detail';
  // static const adminView = '/admin';
  // static const adminExercise = '/admin/exercise';
  // static const adminExerciseForm = '/admin/exercise/form';
  // static const adminTraining = '/admin/training';
  // static const adminTrainingForm = '/admin/training/form';
  // static const adminTrainingExerciseLink = '/admin/training/link';

  static String removeSlash(String s) => s.replaceAll("/", "");

  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        pageBuilder: (_, __) => const MaterialPage(
          child: BaseView(),
        ),
        routes: [
          GoRoute(
            path: removeSlash(home),
            pageBuilder: (_, __) => const MaterialPage(child: BaseView())
          ),
          GoRoute(
            path: removeSlash(professions),
            pageBuilder: (_, __) => const MaterialPage(child: ProfessionsView())
          ),
          // GoRoute(
          //   path: removeSlash(newPassword),
          //   pageBuilder: (_, __) => const MaterialPage(child: CreateNewPasswordView())
          // ),
          // GoRoute(
          //   path: removeSlash(trainingList),
          //   pageBuilder: (_, __) => const MaterialPage(child: TrainingListView())
          // ),
          // GoRoute(
          //   path: removeSlash(myPatent),
          //   pageBuilder: (_, state) => MaterialPage(child: MyPatentView(currentArmyRank: state.extra as ArmyRank))
          // ),
          // GoRoute(
          //   path: removeSlash(trainingDetail),
          //   pageBuilder: (_, __) => const MaterialPage(child: TrainingDetailView())
          // ),
          // GoRoute(
          //   path: removeSlash(adminView),
          //   pageBuilder: (_, __) => const MaterialPage(child: AdminView()),
          //   routes: [
          //     GoRoute(
          //       path: "exercise",
          //       pageBuilder: (_, state) =>  MaterialPage(child: AdminExerciseView(onlySelection: state.extra as bool)),
          //       routes: [
          //         GoRoute(
          //           path: "form",
          //           pageBuilder: (_, state) => MaterialPage(child: AdminExerciseFormView(item: state.extra as ExerciseItem?))
          //         ),
          //       ]
          //     ),
          //     GoRoute(
          //       path: "training",
          //       pageBuilder: (_, __) => const MaterialPage(child: AdminTrainingView()),
          //       routes: [
          //         GoRoute(
          //           path: "form",
          //           pageBuilder: (_, state) => MaterialPage(child: AdminTrainingFormView(item: state.extra as TrainingItem?))
          //         ),
          //         GoRoute(
          //           path: "link",
          //           pageBuilder: (_, state) => MaterialPage(
          //             child: AdminTrainingExerciseLinkView(
          //               training: (state.extra as Map<String,dynamic>)["training"] as Training,
          //               trainingIntensity: (state.extra as Map<String,dynamic>)["trainingIntensity"] as TrainingIntensity)
          //             )
          //         ),
          //       ]
          //     ),
          //   ]
          // ),
          // GoRoute(
          //   path: removeSlash(forgotPassword),
          //   pageBuilder: (_, __) => MaterialPage(child: LoginView())
          // ),
          // GoRoute(
          //   path: removeSlash(login),
          //   pageBuilder: (_, __) => MaterialPage(child: LoginView())
          // ),
          // GoRoute(
          //   path: removeSlash(signUp),
          //   pageBuilder: (_, __) => const MaterialPage(child: SignUpView())
          // ),
        ]
      ),
    ]
  );
}