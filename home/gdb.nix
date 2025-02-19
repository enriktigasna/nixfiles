{
  config,
  pkgs,
  ...
}: {
  home.file.".gdbinit".text = ''
    source ${pkgs.pwndbg}/share/pwndbg/gdbinit.py
  '';
}
