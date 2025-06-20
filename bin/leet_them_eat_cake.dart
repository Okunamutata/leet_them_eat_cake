import 'package:args/args.dart';

import 'problem_set/all_problems.dart';
import 'utils.dart';

const String version = '0.0.1';

ArgParser buildParser() {
  final ArgParser argParser =
      ArgParser()
        // ..addFlag(
        //   '2sum',
        //   abbr: '2',
        //   negatable: false,
        //   help: 'Show additional command output.',
        // )
        ..addFlag(
          'help',
          abbr: 'h',
          negatable: false,
          help: 'Print this usage information.',
        )
        ..addFlag(
          'verbose',
          abbr: 'v',
          negatable: false,
          help: 'Show additional command output.',
        )
        ..addFlag('version', negatable: false, help: 'Print the tool version.');
  for (final Problem problem in Problem.values) {
    argParser.addFlag(
      problem.flag,
      abbr: problem.abbr,
      negatable: false,
      help: problem.help,
    );
  }
  return argParser;
}

void printUsage(ArgParser argParser) {
  print('Usage: dart leet_them_eat_cake.dart <flags> [arguments]');
  print(argParser.usage);
}

void main(List<String> arguments) {
  final ArgParser argParser = buildParser();
  try {
    final ArgResults results = argParser.parse(arguments);
    bool verbose = false;
    printUsage(argParser);

    handleFlag(results);

    // Process the parsed arguments.
    if (results.flag('help')) {
      printUsage(argParser);
      return;
    }
    if (results.flag('version')) {
      print('leet_them_eat_cake version: $version');
      return;
    }
    if (results.flag('verbose')) {
      verbose = true;
    }

    // if (results.flag('2sum')) {
    //   await twoSum(numbers: [3, 2, 4], target: 6);
    // }

    if (results.command != null) {
      print('here');
    }

    // Act on the arguments provided.
    if (verbose) {
      print('Positional arguments: ${results.rest}');
      print('[VERBOSE] All arguments: ${results.arguments}');
    }
  } on FormatException catch (e) {
    // Print usage information if an invalid argument was provided.
    print(e.message);
    print('');
    printUsage(argParser);
  }
}
