import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/class_model.dart';
import '../../services/remotes/class_service.dart';
import '../../utils/common/constant.dart';

part 'all_class_event.dart';
part 'all_class_state.dart';

class AllClassBloc extends Bloc<AllClassEvent, AllClassState> {
  final ClassService classService;
  AllClassBloc(this.classService) : super(AllClassInitialState()) {
    on<GetAllClass>((event, emit) async {
      emit(AllClassLoading());
      try {
        const String descriptionDummy =
            """Sint tempor magna consectetur culpa sunt. Eiusmod aliqua esse sit elit dolor fugiat tempor proident nostrud sit cupidatat. Reprehenderit mollit magna Lorem reprehenderit voluptate veniam nulla ipsum. Elit culpa labore esse reprehenderit qui esse eiusmod et id esse cupidatat occaecat deserunt tempor. Fugiat non cillum in consectetur ut duis ex enim est. Dolor excepteur et magna id nulla enim. Ex cupidatat est ad officia laborum sit ad pariatur excepteur fugiat amet.

Irure Lorem velit sint culpa anim amet deserunt anim laborum sit aliqua tempor. Reprehenderit enim amet enim aliquip laborum nostrud magna aliquip aute nostrud deserunt. Reprehenderit est magna et id duis ipsum consectetur. Mollit pariatur Lorem adipisicing commodo incididunt pariatur consequat amet excepteur eu sunt labore.

Commodo eiusmod eu reprehenderit duis proident commodo minim ad ullamco labore velit aliquip tempor ea. Et culpa enim non nostrud occaecat aute duis mollit tempor exercitation Lorem. Occaecat aute proident aliquip commodo dolore sint culpa dolore eu nisi ipsum pariatur. Dolore occaecat ipsum elit ipsum minim magna est eiusmod ad adipisicing nisi veniam. Id nisi labore adipisicing dolor. Elit aliquip cupidatat quis amet et officia.

Duis sit consectetur duis occaecat id id. Ipsum tempor eu in nisi adipisicing nisi reprehenderit deserunt excepteur. Enim cupidatat sint dolore proident.

Sunt consequat exercitation officia ex aliquip ea sunt duis reprehenderit Lorem excepteur eiusmod et sit. Mollit ut consectetur Lorem non aute aliquip nisi culpa et et cupidatat ad aliqua. Aliqua adipisicing cillum laborum duis. Laboris exercitation non voluptate fugiat voluptate sunt quis pariatur voluptate incididunt tempor.

Esse deserunt elit eu sit officia ex velit quis ea fugiat. Et adipisicing consequat incididunt ut ea pariatur nulla. Esse voluptate cupidatat in nisi adipisicing id. Laboris ipsum nulla ipsum occaecat aliquip consectetur incididunt deserunt excepteur sit mollit commodo culpa laborum. Consequat esse pariatur id laborum excepteur. Cupidatat sunt anim minim labore eu est est duis irure nisi voluptate aliquip sit.

Id proident nostrud in deserunt aute minim mollit nostrud. Et et id nulla elit dolor minim nostrud nulla laboris aliqua. Magna Lorem in ea voluptate.

Do nostrud irure exercitation ut enim. Esse magna aliqua officia et exercitation ullamco nisi qui elit laboris cupidatat est et. Mollit qui do duis irure deserunt incididunt qui. Do laborum deserunt quis proident aliqua non. Commodo ad ipsum ut nulla sit aute pariatur voluptate. Consectetur tempor irure sunt non culpa elit culpa deserunt sit sunt est.

Qui labore nisi elit tempor cupidatat reprehenderit Lorem id deserunt est dolor. Mollit ipsum laboris commodo do ipsum ut. In non id nisi in laboris eu. Consectetur duis ipsum qui Lorem culpa commodo non. Sint nisi aliqua aute qui ea esse nulla elit cillum amet et aliquip labore.

Minim duis culpa reprehenderit magna eiusmod incididunt eu qui proident enim velit nisi. Excepteur labore nulla ea quis minim officia aliqua culpa laborum. Duis do irure ex labore commodo.
""";
        final List<Class> dummyData = [
          Class(
            id: 100,
            classname: 'Dummy Offline',
            capacity: 20,
            clastype: offlineClass,
            clock: '17:00',
            date: '06-07-2022',
            description: descriptionDummy,
            duration: 60,
            image: '',
            status: 'Available',
            trainer: 'Trainer',
            userBooked: 20,
          ),
          Class(
            id: 111,
            classname: 'Dummy Offline 2',
            capacity: 20,
            clastype: offlineClass,
            clock: '17:00',
            date: '10-07-2022',
            description: descriptionDummy,
            duration: 60,
            image: '',
            status: 'Available',
            trainer: 'Trainer',
            userBooked: 20,
          ),
          Class(
            id: 112,
            classname: 'Dummy Offline 3',
            capacity: 20,
            clastype: offlineClass,
            clock: '17:00',
            date: '07-07-2022',
            description: descriptionDummy,
            duration: 60,
            image: '',
            status: 'Available',
            trainer: 'Trainer',
            userBooked: 20,
          ),
          Class(
            id: 112,
            classname: 'Dummy Online ',
            capacity: 20,
            clastype: onlineClass,
            clock: '17:00',
            date: '12-07-2022',
            description: descriptionDummy,
            duration: 60,
            image: '',
            status: 'Available',
            trainer: 'Trainer',
            userBooked: 20,
          ),
          Class(
            id: 201,
            classname: 'Dummy Offline 4',
            capacity: 20,
            clastype: offlineClass,
            clock: '17:00',
            date: '12-07-2022',
            description: descriptionDummy,
            duration: 60,
            image: '',
            status: 'Available',
            trainer: 'Trainer',
            userBooked: 20,
          ),
          Class(
            id: 112,
            classname: 'Dummy Online 2',
            capacity: 20,
            clastype: onlineClass,
            clock: '17:00',
            date: '10-07-2022',
            description: descriptionDummy,
            duration: 60,
            image: '',
            status: 'Available',
            trainer: 'Trainer',
            userBooked: 20,
          ),
        ];
        ClassModel allClass = await classService.getAllClass();
        allClass.data!.addAll(dummyData);
        emit(AllClassLoaded(allClass));
      } catch (e) {
        emit(AllClassError(e.toString()));
      }
    });
    on<FilterClass>((event, emit) {
      final filter = event.filter;
      final allClass = event.allClass;
      final filteredClass = allClass.where(filter).toList();
      emit(FilteredClassLoaded(filteredClass));
    });
  }
}
