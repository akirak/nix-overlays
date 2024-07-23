{ lib, fetchFromGitHub, buildDunePackage, systemdLibs }:

buildDunePackage {
  pname = "systemd";
  version = "1.3";

  src = fetchFromGitHub {
    owner = "juergenhoetzel";
    repo = "ocaml-systemd";
    rev = "804656df894f239d3fdf67bf6253e351f0087976";
    sha256 = "sha256-/FV+mFhuB3mEZv34XZrA4gO6+QIYssXqurnvkNBTJ2o=";
  };

  propagatedBuildInputs = [  systemdLibs ];
}
