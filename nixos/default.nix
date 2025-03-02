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
    ghidra

    fastfetch
    cmatrix

    gcc
    clang
    cargo

    qemu
    docker
    pkgsi686Linux.gcc
    pkgsi686Linux.glibc

    (python3.withPackages (python-pkgs:
      with python-pkgs; [
        pycryptodome
        requests
        pwntools
        pillow
        sympy
        autopep8
        z3-solver
      ]))

    (pkgs.buildFHSUserEnv {
      name = "pwn-env";
      targetPkgs = pkgs:
        with pkgs; [
          (pkgs.pkgsi686Linux.glibc) # 32-bit glibc support
          (pkgs.pkgsi686Linux.gcc) # 32-bit compiler
        ];
      profile = ''
        export PS1="(pwn-env) \w \$ "
      '';
      runScript = "bash";
    })
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
  boot.binfmt.emulatedSystems = ["i686-linux"];
}
