import 'package:jdoodle/database/models/program.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../objectbox.g.dart';

class ObjectBox {
  /// The Store of this app.
  late final Store _store;

  /// A Box of notes.
  late final Box<Program> _programBox;

  ObjectBox._create(this._store) {
    _programBox = Box<Program>(_store);
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBox> create() async {
    // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
    final store =
        await openStore(directory: p.join((await getApplicationDocumentsDirectory()).path, "obx-demo"), macosApplicationGroup: "objectbox.demo");
    return ObjectBox._create(store);
  }

  Stream<List<Program>> getPrograms() {
    // Query for all notes, sorted by their date.
    // https://docs.objectbox.io/queries
    final builder = _programBox.query().order(Program_.date, flags: Order.descending);
    // Build and watch the query,
    // set triggerImmediately to emit the query immediately on listen.
    return builder
        .watch(triggerImmediately: true)
        // Map it to a list of notes to be used by a StreamBuilder.
        .map((query) => query.find());
  }

  Future<void> addPrograms(Program product) => _programBox.putAsync(Program(
        code: product.code,
        output: product.output,
        language: product.language,
        languageCode: product.languageCode,
        languageCodeIndex: product.languageCodeIndex,
      ));
  updateProgramItems(Program program, int id)  {
    print('program.id  :${program.id}');
    print('program.id  :${id}');

    final builder =
    _programBox.query(Program_.id.equals(id)).order(Program_.date, flags: Order.descending);
    List<Program> itemList =  builder.build().find();
    print('item  :${itemList.length}');
    for(var item in itemList){
      print('item  :${item.id}');
      var programItem = _programBox.get(item.id)!;      // Read
      programItem.code= program.code;
      programItem.output= program.output;
      programItem.language= program.language;
      programItem.languageCode= program.languageCode;
      programItem.languageCodeIndex= program.languageCodeIndex;
      _programBox.put(programItem);            // Update
    }
  }
  /// Add a note.
  ///
  /// To avoid frame drops, run ObjectBox operations that take longer than a
  /// few milliseconds, e.g. putting many objects, asynchronously.
  /// For this example only a single object is put which would also be fine if
  /// done using [Box.put].
  // Future<void> addNote(String text) => _cartBox.putAsync(CartItem(text));

  Future<void> removeProgram(int id) => _programBox.removeAsync(id);
}
