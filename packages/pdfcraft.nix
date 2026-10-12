{
  lib,
  appimageTools,
  fetchurl,
}:

let
  pname = "pdfcraft";
  version = "2026.10.09-a300702";

  src = fetchurl {
    url = "https://github.com/PDFCraftTool/pdfcraft/releases/download/v2026.10.09-a300702/PDFCraft_0.1.0_amd64.AppImage";
    hash = "sha256-S/4sJ5yHdDJT7a2i1W+scNcGUmjQO/jL1GjFb9RUn14=";
  };
in
appimageTools.wrapType2 {
  inherit pname version src;

  # The AppImage contains its own application files.
  # Add extra runtime libraries here only if required.
  extraPkgs = pkgs: [ ];

  meta = {
    description = "PDFCraft desktop application";
    homepage = "https://github.com/PDFCraftTool/pdfcraft";
    license = lib.licenses.agpl3Only;
    platforms = [ "x86_64-linux" ];
    mainProgram = "pdfcraft";
  };
}
