import 'function.dart';

main() async {
  await cloneAndRemoveGit(
      'https://github.com/melodysdreamj/lego.git', 'lego_template', 'exampleRepo');
}
