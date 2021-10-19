import 'package:flutter/cupertino.dart';
import 'package:gym_app/screen/EditProgramBodyBuilding/edit_program_body_building.dart';
import 'package:gym_app/screen/EditProgramDiet/edit_program_diet_page.dart';
import 'package:gym_app/screen/EditProgramOtherSports/edit_program_other_sports_page.dart';
import 'package:gym_app/screen/ObserveProgramDiet/observe_program_diet_page.dart';
import 'package:gym_app/screen/observeProgramBody/observe_program_body_page.dart';
import 'package:gym_app/screen/observeProgramOtherSports/observe_other_sports_page.dart';

class SetSelectedRoute {
  void setSelectedRoute(BuildContext context, int? planType, int? planTypeId) {
    // plantype for body is 1
    // plantype for other sports is 2
    // plantype for diet is 3

    switch (planType) {
      case 1:
        Navigator.of(context).pushNamed(EditProgramBodyBuilding.routeName,
            arguments: planTypeId);
        break;
      case 2:
        Navigator.of(context)
            .pushNamed(EditProgramDietPage.routeName, arguments: planTypeId);
        break;
      default:
        Navigator.of(context).pushNamed(EditProgramOtherSportsPage.routeName,
            arguments: planTypeId);
    }
  }

  void setSelectedRouteObserveProgram(
      BuildContext context, int? planType, int? planTypeId) {
    // plantype for body is 1
    // plantype for other sports is 2
    // plantype for diet is 3

    switch (planType) {
      case 1:
        Navigator.of(context)
            .pushNamed(ObserveProgramBody.routeName, arguments: planTypeId);
        break;
      case 2:
        Navigator.of(context)
            .pushNamed(ObserveProgramDietPage.routeName, arguments: planTypeId);
        break;
      default:
        Navigator.of(context)
            .pushNamed(ObserveOtherSportsPage.routeName, arguments: planTypeId);
    }
  }
}
