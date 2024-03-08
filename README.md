# Reproducing Nix+GHC issues related to double-conversion + Darwin

A mini repro for 
- https://github.com/NixOS/nixpkgs/issues/149692

https://github.com/srid/double-conversion-ex/actions/runs/8197011786/job/22418284148

```
Linking /private/var/lib/github-runners/.github-runner/double-conversion-ex-1/_work/double-conversion-ex/double-conversion-ex/dist-newstyle/build/aarch64-osx/ghc-9.2.7/double-conversion-ex-0.1.0.0/x/example/build/example/example ...
Undefined symbols for architecture arm64:
  "___cxa_begin_catch", referenced from:
      ___clang_call_terminate in libHSdouble-conversion-2.0.4.2-GjOigQe6iqxJxqQ5FifvH6.a(hs-double-conversion.o)
  "___gxx_personality_v0", referenced from:
      __hs_ToShortest in libHSdouble-conversion-2.0.4.2-GjOigQe6iqxJxqQ5FifvH6.a(hs-double-conversion.o)
      double_conversion::StringBuilder::~StringBuilder() in libHSdouble-conversion-2.0.4.2-GjOigQe6iqxJxqQ5FifvH6.a(hs-double-conversion.o)
      __hs_ToShortestFloat in libHSdouble-conversion-2.0.4.2-GjOigQe6iqxJxqQ5FifvH6.a(hs-double-conversion.o)
      __hs_ToFixed in libHSdouble-conversion-2.0.4.2-GjOigQe6iqxJxqQ5FifvH6.a(hs-double-conversion.o)
      __hs_ToFixedFloat in libHSdouble-conversion-2.0.4.2-GjOigQe6iqxJxqQ5FifvH6.a(hs-double-conversion.o)
      __hs_ToExponential in libHSdouble-conversion-2.0.4.2-GjOigQe6iqxJxqQ5FifvH6.a(hs-double-conversion.o)
      __hs_ToExponentialFloat in libHSdouble-conversion-2.0.4.2-GjOigQe6iqxJxqQ5FifvH6.a(hs-double-conversion.o)
      ...
ld: symbol(s) not found for architecture arm64
clang-16: error: linker command failed with exit code 1 (use -v to see invocation)
`cc' failed in phase `Linker'. (Exit code: 1)
```

and for https://github.com/NixOS/nixpkgs/issues/149937 

https://github.com/srid/double-conversion-ex/actions/runs/8197440798/job/22419423662

```
error: builder for '/nix/store/4nfhcfmgnfmclrqsfn2x1vy28ivyx2b9-double-conversion-ex-0.1.0.0.drv' failed with exit code 1;
       last 10 log lines:
       > /nix/store/ivklia9w69144iys517bvbc0d8paj2ai-gnutar-1.35/bin/tar
       > No uhc found
       > Running phase: buildPhase
       > Preprocessing executable 'example' for double-conversion-ex-0.1.0.0..
       > Building executable 'example' for double-conversion-ex-0.1.0.0..
       > [1 of 1] Compiling Main             ( src/Main.hs, dist/build/example/example-tmp/Main.o, dist/build/example/example-tmp/Main.dyn_o )
       > ghc: loadArchive: Neither an archive, nor a fat archive: `/nix/store/k687y4hiraslz65qz8pli1wb5wmcabvn-clang-wrapper-16.0.6/bin/clang++'
       >
       > <no location info>: error:
       >     loadArchive "/nix/store/k687y4hiraslz65qz8pli1wb5wmcabvn-clang-wrapper-16.0.6/bin/clang++": failed
```

