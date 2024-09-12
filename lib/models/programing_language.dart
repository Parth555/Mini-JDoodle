class ProgrammingLanguage {
  final String name;
  final String languageCode;
  final List<Version> versions;

  ProgrammingLanguage({required this.name, required this.languageCode, required this.versions});

  factory ProgrammingLanguage.fromJson(Map<String, dynamic> json) {
    var versionsFromJson = json['versions'] as List;
    List<Version> versionList = versionsFromJson.map((versionJson) => Version.fromJson(versionJson)).toList();

    return ProgrammingLanguage(
      name: json['name'],
      languageCode: json['languageCode'],
      versions: versionList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'languageCode': languageCode,
      'versions': versions.map((version) => version.toJson()).toList(),
    };
  }
}

class Version {
  final String version;
  final int index;

  Version({required this.version, required this.index});

  factory Version.fromJson(Map<String, dynamic> json) {
    return Version(
      version: json['version'],
      index: json['index'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'version': version,
      'index': index,
    };
  }
}

List<ProgrammingLanguage> programmingLanguages = [
  ProgrammingLanguage(
    name: 'Java',
    languageCode: 'java',
    versions: [
      Version(version: 'JDK 1.8.0_66', index: 0),
      Version(version: 'JDK 9.0.1', index: 1),
      Version(version: 'JDK 10.0.1', index: 2),
      Version(version: 'JDK 11.0.4', index: 3),
      Version(version: 'JDK 17.0.1', index: 4),
      Version(version: 'JDK 21.0.1', index: 5),
    ],
  ),
  ProgrammingLanguage(
    name: 'AWK',
    languageCode: 'AWK',
    versions: [
      Version(version: 'NU Awk 5.1.1, API: 3.1', index: 0),
      Version(version: 'API: 5.3', index: 1),
    ],
  ),
  ProgrammingLanguage(
    name: 'Ada',
    languageCode: 'Ada',
    versions: [
      Version(version: 'GNATMAKE 6.1.1', index: 0),
      Version(version: 'GNATMAKE 7.2.0', index: 1),
      Version(version: 'GNATMAKE 8.1.0', index: 2),
      Version(version: 'GNATMAKE 9.1.0', index: 3),
      Version(version: 'GNATMAKE 11.1.0', index: 4),
      Version(version: 'GNATMAKE 13.2.1', index: 5),
    ],
  ),
  ProgrammingLanguage(
    name: 'Algol 68',
    languageCode: 'algol',
    versions: [
      Version(version: 'Genie 2.8.5', index: 0),
      Version(version: 'Genie 3.4.2', index: 1),
    ],
  ),
  ProgrammingLanguage(
    name: 'Apl',
    languageCode: 'apl',
    versions: [
      Version(version: '1.8', index: 0),
    ],
  ),
  ProgrammingLanguage(
    name: 'Assembler (FASM)',
    languageCode: 'fasm',
    versions: [
      Version(version: '1.73.27	', index: 0),
      Version(version: '1.73.31', index: 1),
    ],
  ),
  ProgrammingLanguage(
    name: 'Assembler (GCC)',
    languageCode: 'gccasm',
    versions: [
      Version(version: 'GCC 6.2.1', index: 0),
      Version(version: 'GCC 8.1.0', index: 1),
      Version(version: 'GCC 9.1.0', index: 2),
      Version(version: 'GCC 11.1.0', index: 3),
      Version(version: 'GCC 13.2.1', index: 4),
    ],
  ),
  ProgrammingLanguage(
    name: 'Assembler (NASM)',
    languageCode: 'nasm',
    versions: [
      Version(version: '2.11.08', index: 0),
      Version(version: '2.13.01', index: 1),
      Version(version: '2.13.03', index: 2),
      Version(version: '2.14.02', index: 3),
      Version(version: '2.15.05', index: 4),
      Version(version: '2.16.01', index: 5),
    ],
  ),
  ProgrammingLanguage(
    name: 'Assembler (Turbo)',
    languageCode: 'tasm',
    versions: [
      Version(version: '1.59.3120', index: 0),
    ],
  ),
  ProgrammingLanguage(
    name: 'Bash',
    languageCode: 'bash',
    versions: [
      Version(version: '4.3.42', index: 0),
      Version(version: '4.4.12', index: 1),
      Version(version: '4.4.19', index: 2),
      Version(version: '5.0.011', index: 3),
      Version(version: '5.1.12', index: 4),
      Version(version: '5.2.15', index: 5),
    ],
  ),
  ProgrammingLanguage(
    name: 'BC',
    languageCode: 'bc',
    versions: [
      Version(version: '1.06.95', index: 0),
      Version(version: '1.07.1', index: 1),
    ],
  ),
  ProgrammingLanguage(
    name: 'Befunge',
    languageCode: 'befunge',
    versions: [
      Version(version: 'cfunge 0.9.0', index: 0),
      Version(version: 'cfunge 0.9.0', index: 1),
    ],
  ),
  ProgrammingLanguage(
    name: 'Blockly',
    languageCode: 'Blockly',
    versions: [
      Version(version: 'Dart', index: 0),
      Version(version: 'Lua', index: 1),
      Version(version: 'PHP', index: 2),
      Version(version: 'Python 3', index: 3),
    ],
  ),
  ProgrammingLanguage(
    name: 'Brainf**k',
    languageCode: 'brainfuck',
    versions: [
      Version(version: 'bfc-0.1', index: 0),
    ],
  ),
  ProgrammingLanguage(
    name: 'C',
    languageCode: 'c',
    versions: [
      Version(version: 'GCC 5.3.0', index: 0),
      Version(version: 'Zapc 5.0.0', index: 1),
      Version(version: 'GCC 7.2.0', index: 2),
      Version(version: 'GCC 8.1.0', index: 3),
      Version(version: 'GCC 9.1.0', index: 4),
      Version(version: 'GCC 11.1.0', index: 5),
      Version(version: 'GCC 13.2.1', index: 6),
    ],
  ),
  ProgrammingLanguage(
    name: 'C#',
    languageCode: 'csharp',
    versions: [
      Version(version: 'mono 4.2.2', index: 0),
      Version(version: 'mono 5.0.0', index: 1),
      Version(version: 'mono 5.10.1', index: 2),
      Version(version: 'mono 6.0.0', index: 3),
      Version(version: 'mono-6.12.0', index: 4),
      Version(version: 'dotnet: 7.0.13', index: 5),
    ],
  ),
  ProgrammingLanguage(
    name: 'C++',
    languageCode: 'cpp',
    versions: [
      Version(version: 'GCC 5.3.0', index: 0),
      Version(version: 'Zapcc 5.0.0', index: 1),
      Version(version: 'GCC 7.2.0', index: 2),
      Version(version: 'GCC 8.1.0', index: 3),
      Version(version: 'GCC 9.1.0', index: 4),
      Version(version: 'GCC 11.1.0', index: 5),
      Version(version: 'GCC 13.2.1', index: 6),
    ],
  ),
  ProgrammingLanguage(
    name: 'C++ 14',
    languageCode: 'cpp14',
    versions: [
      Version(version: 'g++ 14 GCC 5.3.0', index: 0),
      Version(version: 'g++ 14 GCC 7.2.0', index: 1),
      Version(version: 'g++ 14 GCC 8.1.0', index: 2),
      Version(version: 'g++ 14 GCC 9.1.0', index: 3),
      Version(version: 'GCC 11.1.0', index: 4),
      Version(version: 'GCC 13.2.1', index: 5),
    ],
  ),
  ProgrammingLanguage(
    name: 'C++ 17',
    languageCode: 'cpp17',
    versions: [
      Version(version: 'g++ 17 GCC 9.1.0', index: 0),
      Version(version: 'g++ 17 11.1.0', index: 1),
      Version(version: 'g++ 17 13.2.1', index: 2),
    ],
  ),
  ProgrammingLanguage(
    name: 'C99',
    languageCode: 'c99',
    versions: [
      Version(version: 'GCC 5.3.0', index: 0),
      Version(version: 'GCC 7.2.0', index: 1),
      Version(version: 'GCC 8.1.0', index: 2),
      Version(version: 'GCC 9.1.0', index: 3),
      Version(version: 'GCC 11.1.0', index: 4),
      Version(version: 'GCC 13.2.1', index: 5),
    ],
  ),
  ProgrammingLanguage(
    name: 'Cow',
    languageCode: 'cow',
    versions: [
      Version(version: '1.0', index: 0),
    ],
  ),
  ProgrammingLanguage(
    name: 'CLISP',
    languageCode: 'clisp',
    versions: [
      Version(version: 'GNU CLISP 2.49 - GNU C 5.2.0', index: 0),
      Version(version: 'GNU CLISP 2.49 - GNU C 6.2.1', index: 1),
      Version(version: 'GNU CLISP 2.49.93 - GNU 8.1.0', index: 2),
      Version(version: 'GNU CLISP 2.49.93 - GNU 9.1.0', index: 3),
      Version(version: 'ecl 21.2.1', index: 4),
      Version(version: 'sbcl 2.1.9', index: 5),
      Version(version: 'ccl 1.12.1', index: 6),
      Version(version: 'abcl 1.8.0', index: 7),
      Version(version: 'ecl 23.9.9', index: 8),
      Version(version: 'sbcl 2.3.10', index: 9),
      Version(version: 'ccl 1.12.2', index: 10),
      Version(version: 'abcl 1.9.2', index: 11),
    ],
  ),
  ProgrammingLanguage(
    name: 'Cobol',
    languageCode: 'cobol',
    versions: [
      Version(version: 'GNU COBOL 2.0.0', index: 0),
      Version(version: 'GNU COBOL 2.2.0', index: 1),
      Version(version: 'GNU COBOL 3.0', index: 2),
      Version(version: 'GNU COBOL 3.1.2', index: 3),
      Version(version: 'GNU COBOL 3.2.0', index: 4),
    ],
  ),
  ProgrammingLanguage(
    name: 'Clojure',
    languageCode: 'clojure',
    versions: [
      Version(version: '1.8.0', index: 0),
      Version(version: '1.9.0', index: 1),
      Version(version: '1.10.1', index: 2),
      Version(version: '1.10.31', index: 3),
      Version(version: '1.11.1', index: 4),
    ],
  ),
  ProgrammingLanguage(
    name: 'CoffeeScript',
    languageCode: 'coffeescript',
    versions: [
      Version(version: '1.11.1', index: 0),
      Version(version: '2.0.0', index: 1),
      Version(version: '2.3.0', index: 2),
      Version(version: '2.4.1', index: 3),
      Version(version: '2.6.1', index: 4),
      Version(version: '2.7.0', index: 5),
    ],
  ),
  ProgrammingLanguage(
    name: 'D',
    languageCode: 'd',
    versions: [
      Version(version: 'DMD64 D Compiler v2.071.1', index: 0),
      Version(version: 'DMD64 D Compiler v2.088', index: 1),
      Version(version: 'DMD64 D Compiler v2.098', index: 2),
      Version(version: 'DMD64 D Compiler v2.105.2', index: 3),
    ],
  ),
  ProgrammingLanguage(
    name: 'Dart',
    languageCode: 'dart',
    versions: [
      Version(version: '1.18.0', index: 0),
      Version(version: '1.24.2', index: 1),
      Version(version: '1.24.3', index: 2),
      Version(version: '2.5.1', index: 3),
      Version(version: '2.14.4', index: 4),
      Version(version: '3.0.7', index: 5),
    ],
  ),
  ProgrammingLanguage(
    name: 'Deno',
    languageCode: 'deno',
    versions: [
      Version(version: '1.38.0', index: 0),
    ],
  ),
  ProgrammingLanguage(
    name: 'Erlang',
    languageCode: 'erlang',
    versions: [
      Version(version: '22.1', index: 0),
      Version(version: '24', index: 1),
      Version(version: '26.1.1', index: 2),
    ],
  ),
  ProgrammingLanguage(
    name: 'Elixir',
    languageCode: 'elixir',
    versions: [
      Version(version: '1.3.4', index: 0),
      Version(version: '1.5.2', index: 1),
      Version(version: '1.6.4', index: 2),
      Version(version: '1.9.1', index: 3),
      Version(version: '1.12.2', index: 4),
      Version(version: '1.15.7', index: 5),
    ],
  ),
  ProgrammingLanguage(
    name: 'F#',
    languageCode: 'fsharp',
    versions: [
      Version(version: '4.11', index: 0),
      Version(version: '4.5.0', index: 1),
      Version(version: '10.2.31', index: 2),
    ],
  ),
  ProgrammingLanguage(
    name: 'Falcon',
    languageCode: 'falcon',
    versions: [
      Version(version: '0.9.6.8 (Chimera)', index: 0),
    ],
  ),
  ProgrammingLanguage(
    name: 'Fantom',
    languageCode: 'fantom',
    versions: [
      Version(version: '1.0.69', index: 0),
    ],
  ),
  ProgrammingLanguage(
    name: 'Factor',
    languageCode: 'factor',
    versions: [
      Version(version: '8.25', index: 0),
      Version(version: '8.28', index: 1),
      Version(version: '8.29', index: 2),
      Version(version: '8.31', index: 3),
      Version(version: '9.4', index: 4),
    ],
  ),
  ProgrammingLanguage(
    name: 'Forth',
    languageCode: 'forth',
    versions: [
      Version(version: 'gforth 0.7.3', index: 0),
      Version(version: '4th 3.64', index: 1),
    ],
  ),
  ProgrammingLanguage(
    name: 'Fortran',
    languageCode: 'fortran',
    versions: [
      Version(version: 'GNU 5.3.0', index: 0),
      Version(version: 'GNU 7.2.0', index: 1),
      Version(version: 'GNU 8.1.0', index: 2),
      Version(version: 'GNU 9.1.0', index: 3),
      Version(version: 'GNU 11.1.0', index: 4),
      Version(version: 'GNU 13.2.1', index: 5),
    ],
  ),
  ProgrammingLanguage(
    name: 'Free Basic',
    languageCode: 'freebasic',
    versions: [
      Version(version: '1.05.0', index: 0),
      Version(version: '1.07.0', index: 1),
      Version(version: '1.08.0', index: 2),
      Version(version: '1.10.0', index: 3),
    ],
  ),
  ProgrammingLanguage(
    name: 'Go',
    languageCode: 'go',
    versions: [
      Version(version: '1.5.2', index: 0),
      Version(version: '1.9.2', index: 1),
      Version(version: '1.10.2', index: 2),
      Version(version: '1.13.1', index: 3),
      Version(version: '1.17.3', index: 4),
      Version(version: '1.21.4', index: 5),
    ],
  ),
  ProgrammingLanguage(
    name: 'Groovy',
    languageCode: 'groovy',
    versions: [
      Version(version: '2.4.6 JVM: 1.7.0_99', index: 0),
      Version(version: '2.4.12 JVM: 9.0.1', index: 1),
      Version(version: '2.4.15 JVM: 10.0.1', index: 2),
      Version(version: '2.5.8 JVM: 11.0.4', index: 3),
      Version(version: '3.0.9 JVM: 17.0.1', index: 4),
      Version(version: '4.0.15 JVM: 21', index: 5),
    ],
  ),
  ProgrammingLanguage(
    name: 'Hack',
    languageCode: 'hack',
    versions: [
      Version(version: 'HipHop VM 3.13.0', index: 0),
      Version(version: 'HipHop VM 4.99.0', index: 1),
      Version(version: 'HipHop VM 4.99.1', index: 2),
    ],
  ),
  ProgrammingLanguage(
    name: 'Haskell',
    languageCode: 'haskell',
    versions: [
      Version(version: 'ghc 7.10.3', index: 0),
      Version(version: 'ghc 8.0.2', index: 1),
      Version(version: 'ghc 8.2.2', index: 2),
      Version(version: 'ghc 8.6.5', index: 3),
      Version(version: 'ghc 9.0.1', index: 4),
      Version(version: 'ahe 902', index: 5),
    ],
  ),ProgrammingLanguage(
    name: 'Haxe',
    languageCode: 'haxe',
    versions: [
      Version(version: '4.2.4', index: 0),
    ],
  ),ProgrammingLanguage(
    name: 'Haxe',
    languageCode: 'haxe',
    versions: [
      Version(version: '4.2.4', index: 0),
    ],
  ),
  ProgrammingLanguage(
    name: 'Icon',
    languageCode: 'icon',
    versions: [
      Version(version: '9.4.3', index: 0),
      Version(version: '9.5.1', index: 1),
      Version(version: '9.5.23', index: 2),
    ],
  ),ProgrammingLanguage(
    name: 'Intercal',
    languageCode: 'intercal',
    versions: [
      Version(version: '0.30', index: 0),
      Version(version: '0.31', index: 1),
    ],
  ),ProgrammingLanguage(
    name: 'J Language',
    languageCode: 'J Language',
    versions: [
      Version(version: '9.01.10	', index: 0),
    ],
  ),

  ProgrammingLanguage(
    name: 'Java (Advanced)',
    languageCode: 'java',
    versions: [
      Version(version: 'JDK 1.8.0_66', index: 0),
      Version(version: 'JDK 9.0.1', index: 1),
      Version(version: 'JDK 10.0.1', index: 2),
      Version(version: 'JDK 11.0.4', index: 3),
      Version(version: 'JDK 17.0.1', index: 4),
      Version(version: 'JDK 21.0.0', index: 5),
    ],
  ),ProgrammingLanguage(
    name: 'JBang',
    languageCode: 'jbang',
    versions: [
      Version(version: '0.83.1', index: 0),
    ],
  ),ProgrammingLanguage(
    name: 'Jelly',
    languageCode: 'Jelly',
    versions: [
      Version(version: '1.0', index: 0),
    ],
  ),ProgrammingLanguage(
    name: 'Julia',
    languageCode: 'julia',
    versions: [
      Version(version: '1.9.3', index: 0),
    ],
  ),
  ProgrammingLanguage(
    name: 'Kotlin',
    languageCode: 'kotlin',
    versions: [
      Version(version: '1.1.51 (JRE 9.0.1+11)', index: 0),
      Version(version: '1.2.40 (JRE 10.0.1)', index: 1),
      Version(version: '1.3.50 (JRE 11.0.4)', index: 2),
      Version(version: '1.6.0 (JRE 17.0.1+12)', index: 3),
      Version(version: '1.9.10 (JRE 17.0.1+12)', index: 4),
    ],
  ), ProgrammingLanguage(
    name: 'LOLCODE',
    languageCode: 'lolcode',
    versions: [
      Version(version: '0.10.5', index: 0),
    ],
  ),
  ProgrammingLanguage(
    name: 'Lua',
    languageCode: 'lua',
    versions: [
      Version(version: '5.3.2', index: 0),
      Version(version: '5.3.4', index: 1),
      Version(version: '5.3.5', index: 2),
      Version(version: '5.4.3', index: 3),
      Version(version: '5.4.6', index: 4),
    ],
  ),ProgrammingLanguage(
    name: 'MATLAB/Octave',
    languageCode: 'octave',
    versions: [
      Version(version: 'GNU 4.0.0', index: 0),
      Version(version: 'GNU 4.2.1', index: 1),
      Version(version: 'GNU 4.4.0', index: 2),
      Version(version: 'GNU 5.1.0', index: 3),
      Version(version: 'GNU 6.4.0', index: 4),
      Version(version: 'GNU 8.4.0', index: 5),
    ],
  ),ProgrammingLanguage(
    name: 'Moonscript',
    languageCode: 'moonscript',
    versions: [
      Version(version: '0.5.0', index: 0),
    ],
  ),ProgrammingLanguage(
    name: 'MySQL',
    languageCode: 'mysql',
    versions: [
      Version(version: '5.7', index: 0),
    ],
  ),ProgrammingLanguage(
    name: 'Nemerle',
    languageCode: 'Nemerle',
    versions: [
      Version(version: '1.2.0.507', index: 0),
      Version(version: '1.2.507.0', index: 1),
    ],
  ),
  ProgrammingLanguage(
    name: 'Nim',
    languageCode: 'nim',
    versions: [
      Version(version: '0.15.0', index: 0),
      Version(version: '0.17.2', index: 1),
      Version(version: '0.18.0', index: 2),
      Version(version: '1.4.8', index: 3),
      Version(version: '2.0.0', index: 4),
    ],
  ),ProgrammingLanguage(
    name: 'NodeJS',
    languageCode: 'nodejs',
    versions: [
      Version(version: '6.3.1', index: 0),
      Version(version: '9.2.0', index: 1),
      Version(version: '10.1.0', index: 2),
      Version(version: '12.11.1', index: 3),
      Version(version: '17.1.0', index: 4),
      Version(version: '20.9.0', index: 5),
      Version(version: '21.2.0', index: 6),
    ],
  ),ProgrammingLanguage(
    name: 'Objective-C',
    languageCode: 'objc',
    versions: [
      Version(version: 'GCC 5.3.0', index: 0),
      Version(version: 'GCC 7.2.0', index: 1),
      Version(version: 'GCC 8.1.0', index: 2),
      Version(version: 'GCC 9.1.0', index: 3),
      Version(version: 'GCC 11.1.0', index: 4),
      Version(version: 'GCC 13.2.1', index: 5),
    ],
  ),ProgrammingLanguage(
    name: 'Ocaml',
    languageCode: 'ocaml',
    versions: [
      Version(version: '4.03.0', index: 0),
      Version(version: '4.08.1', index: 1),
      Version(version: '4.12.0', index: 2),
      Version(version: '5.0.0', index: 3),
    ],
  ),ProgrammingLanguage(
    name: 'OZ Mozart',
    languageCode: 'mozart',
    versions: [
      Version(version: '2.0.0 (OZ 3)', index: 0),
    ],
  ),
  ProgrammingLanguage(
    name: 'Pascal',
    languageCode: 'pascal',
    versions: [
      Version(version: 'fpc 3.0.0', index: 0),
      Version(version: 'fpc-3.0.2', index: 1),
      Version(version: 'fpc-3.0.4', index: 2),
      Version(version: 'fpc-3.2.2', index: 3),
    ],
  ), ProgrammingLanguage(
    name: 'Picolisp',
    languageCode: 'picolisp',
    versions: [
      Version(version: '3.1.11.1', index: 0),
      Version(version: '17.11.14', index: 1),
      Version(version: '18.5.11', index: 2),
      Version(version: '18.9.5', index: 3),
      Version(version: '21.6.30', index: 4),
      Version(version: '23.9.29', index: 5),
    ],
  ), ProgrammingLanguage(
    name: 'Pike',
    languageCode: 'pike',
    versions: [
      Version(version: 'v8.0', index: 0),
      Version(version: 'v8.0.702', index: 1),
    ],
  ),ProgrammingLanguage(
    name: 'Prolog',
    languageCode: 'prolog',
    versions: [
      Version(version: 'GNU Prolog 1.4.4', index: 0),
      Version(version: 'GNU Prolog 1.4.5', index: 1),
      Version(version: 'GNU Prolog 1.5.0', index: 2),
    ],
  ),
  ProgrammingLanguage(
    name: 'PHP',
    languageCode: 'php',
    versions: [
      Version(version: '5.6.16', index: 0),
      Version(version: '7.1.11', index: 1),
      Version(version: '7.2.5', index: 2),
      Version(version: '7.3.10', index: 3),
      Version(version: '8.0.13', index: 4),
      Version(version: '8.2.12', index: 5),
    ],
  ),ProgrammingLanguage(
    name: 'Perl',
    languageCode: 'perl',
    versions: [
      Version(version: '5.22.0', index: 0),
      Version(version: '5.26.1', index: 1),
      Version(version: '5.26.2', index: 2),
      Version(version: '5.30.0', index: 3),
      Version(version: '5.34.0', index: 4),
      Version(version: '5.38.0', index: 5),
    ],
  ),ProgrammingLanguage(
    name: 'Python 2',
    languageCode: 'python2',
    versions: [
      Version(version: '2.7.11', index: 0),
      Version(version: '2.7.15', index: 1),
      Version(version: '2.7.16', index: 2),
      Version(version: '2.7.18', index: 3),
    ],
  ),ProgrammingLanguage(
    name: 'Python 3',
    languageCode: 'python3',
    versions: [
      Version(version: '3.5.1', index: 0),
      Version(version: '3.6.3', index: 1),
      Version(version: '3.6.5', index: 2),
      Version(version: '3.7.4', index: 3),
      Version(version: '3.9.9', index: 4),
      Version(version: '3.11.5', index: 5),
    ],
  ),ProgrammingLanguage(
    name: 'R Language',
    languageCode: 'r',
    versions: [
      Version(version: '3.3.1', index: 0),
      Version(version: '3.4.2', index: 1),
      Version(version: '3.5.0', index: 2),
      Version(version: '3.6.1', index: 3),
      Version(version: '4.1.2', index: 4),
      Version(version: '4.3.2', index: 5),
    ],
  ),ProgrammingLanguage(
    name: 'Racket',
    languageCode: 'racket',
    versions: [
      Version(version: '6.11', index: 0),
      Version(version: '6.12', index: 1),
      Version(version: '7.4', index: 2),
      Version(version: '8.3', index: 3),
    ],
  ),ProgrammingLanguage(
    name: 'Raku',
    languageCode: 'raku',
    versions: [
      Version(version: '2023.1', index: 0),
    ],
  ),ProgrammingLanguage(
    name: 'Rhino JS',
    languageCode: 'rhino',
    versions: [
      Version(version: '1.7.7.1', index: 0),
      Version(version: '1.7.7.2', index: 1),
      Version(version: '1.7.13', index: 2),
      Version(version: '1.7.14', index: 3),
    ],
  ),ProgrammingLanguage(
    name: 'Ruby',
    languageCode: 'ruby',
    versions: [
      Version(version: '2.2.4', index: 0),
      Version(version: '2.4.2p198', index: 1),
      Version(version: '2.5.1p57', index: 2),
      Version(version: '2.6.5', index: 3),
      Version(version: '3.0.2', index: 4),
      Version(version: '3.0.6', index: 5),
    ],
  ),ProgrammingLanguage(
    name: 'Rust',
    languageCode: 'rust',
    versions: [
      Version(version: '1.10.0', index: 0),
      Version(version: '1.21.0', index: 1),
      Version(version: '1.25.0', index: 2),
      Version(version: '1.38.0', index: 3),
      Version(version: '1.56.1', index: 4),
      Version(version: '1.73.0', index: 5),
    ],
  ),ProgrammingLanguage(
    name: 'Scala',
    languageCode: 'scala',
    versions: [
      Version(version: '2.12.0', index: 0),
      Version(version: '2.12.4', index: 1),
      Version(version: '2.12.5', index: 2),
      Version(version: '2.13.0', index: 3),
      Version(version: '2.13.6', index: 4),
      Version(version: '2.13.12', index: 5),
    ],
  ),ProgrammingLanguage(
    name: 'Scheme',
    languageCode: 'scheme',
    versions: [
      Version(version: 'Gauche 0.9.4', index: 0),
      Version(version: 'Gauche 0.9.5', index: 1),
      Version(version: 'Gauche 0.9.8', index: 2),
      Version(version: 'Gauche 0.9.10', index: 3),
      Version(version: 'Gauche 0.9.13', index: 4),
    ],
  ),ProgrammingLanguage(
    name: 'SmallTalk',
    languageCode: 'smalltalk',
    versions: [
      Version(version: 'GNU SmallTalk 3.2.92', index: 0),
    ],
  ),
  ProgrammingLanguage(
    name: 'SpiderMonkey',
    languageCode: 'spidermonkey',
    versions: [
      Version(version: '38', index: 0),
      Version(version: '45.0.2', index: 1),
      Version(version: '91', index: 2),
    ],
  ),
  ProgrammingLanguage(
    name: 'SQL',
    languageCode: 'sql',
    versions: [
      Version(version: 'SQLite 3.9.2', index: 0),
      Version(version: 'SQLite 3.21.0', index: 1),
      Version(version: 'SQLite 3.23.1', index: 2),
      Version(version: 'SQLite 3.29.0', index: 3),
      Version(version: 'SQLite 3.37.0', index: 4),
      Version(version: 'SQLite 3.44.0', index: 5),
    ],
  ),ProgrammingLanguage(
    name: 'Swift',
    languageCode: 'swift',
    versions: [
      Version(version: '2.2', index: 0),
      Version(version: '3.1.1', index: 1),
      Version(version: '4.1', index: 2),
      Version(version: '5.1', index: 3),
      Version(version: '5.5', index: 4),
      Version(version: '5.9.1', index: 5),
    ],
  ),ProgrammingLanguage(
    name: 'TCL',
    languageCode: 'tcl',
    versions: [
      Version(version: '8.6', index: 0),
      Version(version: '8.6.7', index: 1),
      Version(version: '8.6.8', index: 2),
      Version(version: '8.6.9', index: 3),
      Version(version: '8.6.12', index: 4),
      Version(version: '8.6.13', index: 5),
    ],
  ),ProgrammingLanguage(
    name: 'TypeScript',
    languageCode: 'typescript',
    versions: [
      Version(version: '5.2.2', index: 0),
    ],
  ),ProgrammingLanguage(
    name: 'Unlambda',
    languageCode: 'unlambda',
    versions: [
      Version(version: '0.1.3', index: 0),
      Version(version: '0.1.4.2', index: 1),
    ],
  ),
  ProgrammingLanguage(
    name: 'VB. Net',
    languageCode: 'vbn',
    versions: [
      Version(version: 'mono 4.0.1', index: 0),
      Version(version: 'mono 4.6', index: 1),
      Version(version: 'mono 5.10.1', index: 2),
      Version(version: 'mono 6.0.0', index: 3),
      Version(version: 'mono 6.12.0', index: 4),
      Version(version: 'dotnet: 7.0.13', index: 5),
    ],
  ),ProgrammingLanguage(
    name: 'VERILOG',
    languageCode: 'verilog',
    versions: [
      Version(version: '10.1', index: 0),
      Version(version: '10.2', index: 1),
      Version(version: '10.3', index: 2),
      Version(version: '11', index: 3),
      Version(version: '12', index: 4),
    ],
  ),ProgrammingLanguage(
    name: 'Whitespace',
    languageCode: 'whitespace',
    versions: [
      Version(version: '0.3', index: 0),
    ],
  ),ProgrammingLanguage(
    name: 'YaBasic',
    languageCode: 'yabasic',
    versions: [
      Version(version: '2.769', index: 0),
      Version(version: '2.84.11', index: 1),
      Version(version: '2.90.4', index: 2),
    ],
  ),
];
