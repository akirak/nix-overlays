{ buildDunePackage
, cppo
, cmdliner
, dune-build-info
, fetchFromGitHub
, jq
, lib
, makeWrapper
, menhir
, menhirLib
, merlin
, nodejs_latest
, ocaml
, ounit2
, ppxlib
, reason
, tree
}:

buildDunePackage {
  pname = "melange";
  version = "3.0.0";
  duneVersion = "3";

  src =
    if (lib.versionOlder "5.1" ocaml.version) then
      (builtins.fetchurl {
        url = https://github.com/melange-re/melange/releases/download/3.0.0-51/melange-3.0.0-51.tbz;
        sha256 = "0iz9bx0i3w4gk67zzyb88z3akyrpbap954gkw509zsncjnfg5g0y";
      })
    else
      builtins.fetchurl {
        url = https://github.com/melange-re/melange/releases/download/3.0.0-414/melange-3.0.0-414.tbz;
        sha256 = "1gsn3941c47y22gl4b16mvhf09s3fgladg1jj9rgn9026vhrfkqj";
      };

  doCheck = lib.versionOlder "5.1" ocaml.version;

  nativeCheckInputs = [ nodejs_latest reason tree merlin jq ];
  checkInputs = [ ounit2 ];
  nativeBuildInputs = [ cppo menhir makeWrapper ];
  propagatedBuildInputs = [ cmdliner dune-build-info ppxlib menhirLib ];

  postInstall = ''
    wrapProgram "$out/bin/melc" \
      --set MELANGELIB "$OCAMLFIND_DESTDIR/melange/melange:$OCAMLFIND_DESTDIR/melange/js/melange"
  '';

  meta.mainProgram = "melc";
}
