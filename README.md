# GHC Nix `ld: symbol(s) not found for architecture arm64` on macOS

A mini repro:

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

## Related issues

- https://github.com/NixOS/nixpkgs/issues/149692
