{
  lib,
  buildDunePackage,
  fetchFromGitHub,
  alcotest,
  astring,
  capnp,
  capnproto,
  eio,
  fmt,
  logs,
  stdint,
  uri,
}:

buildDunePackage (finalAttrs: {
  pname = "capnp-rpc";
  version = "2.1.2";

  minimalOCamlVersion = "5.2";

  src = fetchFromGitHub {
    owner = "mirage";
    repo = "capnp-rpc";
    rev = "v${finalAttrs.version}";
    hash = "sha256-QfOglNXEneuPbCpVE6vrqKCVCerIQ2boOy62WwqO4A0=";
  };

  nativeBuildInputs = [
    capnp
    capnproto
  ];

  propagatedBuildInputs = [
    astring
    capnp
    fmt
    logs
    eio
    stdint
    uri
  ];

  checkInputs = [
    alcotest
  ];

  doCheck = true;

  meta = {
    description = "Cap'n Proto RPC library for OCaml";
    homepage = "https://github.com/mirage/capnp-rpc";
    changelog = "https://github.com/mirage/capnp-rpc/blob/v${finalAttrs.version}/CHANGES.md";
    license = lib.licenses.asl20;
  };
})
