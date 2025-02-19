{
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    home-manager
    alejandra
    direnv
    nil
    ripgrep # Move some stuff from here to home

    binutils
    patchelf
    libseccomp
    zlib
    xxd
    sage
    pwninit
    gdb
    pwndbg

    fastfetch
    cmatrix

    gcc
    clang
    cargo

    (python3.withPackages (python-pkgs:
      with python-pkgs; [
        pycryptodome
        requests
        pwntools
        pillow
        sympy
        autopep8
      ]))
  ];

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    glibc
    glibc.dev
    glibc.static
    patchelf
    zlib
    libffi
    libunwind
    libgcc
    libstdcxx5
    ncurses
    openssl
    libxml2
    libxslt
    xz
    bzip2
    gmp
    mpfr
    mpc
  ];

  boot.kernel.sysctl = {
    "kernel.yama.ptrace_scope" = 0;
  };
}
