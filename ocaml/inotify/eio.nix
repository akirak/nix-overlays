{fetchFromGitHub, buildDunePackage, eio, iomux, inotify}:
buildDunePackage {
  pname = "inotify-eio";
  inherit (inotify) src version;
  propagatedBuildInputs = [ inotify eio iomux ];
  duneVersion = "3";
}
