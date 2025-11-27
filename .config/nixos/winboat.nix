{
  appimageTools,
  fetchurl,
}:
let
  pname = "winboat";
  version = "0.8.7";

  src = fetchurl {
    url = "https://github.com/TibixDev/${pname}/releases/download/v0.8.7/${pname}-${version}-x86_64.AppImage";
    sha256 = "fDKmuKoMsC0arWCTMq7dN7s0oa1SUQU0lHdTWIBmn80=";
  };
in
appimageTools.wrapType2 { inherit pname version src; }
