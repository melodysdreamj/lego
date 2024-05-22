import 'dart:io';

Future<bool> cloneAndRemoveGit(
    String repoUrl, String branchName, String targetDirectory) async {
  // Execute the command to clone the Git repository
  var result = await Process.run(
      'git', ['clone', '-b', branchName, repoUrl, targetDirectory]);
  if (result.exitCode != 0) {
    print('Failed to clone Git: ${result.stderr}');
    return false;
  } else {
    // print('Git clone succeeded: ${result.stdout}');
  }

  // Remove the .git folder from the cloned directory
  var dir = Directory('$targetDirectory/.git');
  if (await dir.exists()) {
    await dir.delete(recursive: true);
    // print('.git folder has been successfully removed.');
  } else {
    // print('The .git folder does not exist.');
  }
  return true;
}
