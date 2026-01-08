{ stdenvNoCC, fetchurl }: stdenvNoCC.mkDerivation {
  name = "comic-mono";
  version = "0.1.1";
  src = fetchurl {
    url = "https://dtinth.github.io/comic-mono-font/ComicMono.ttf";
    sha256 = "sha256-O8FCXpIqFqvw7HZ+/+TQJoQ5tMDc6YQy4H0V9drVcZY=";
  };
  dontUnpack = true;
  installPhase = ''
    cp -R $src $out
  '';
}
