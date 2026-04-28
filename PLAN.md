# SIOD88 Modernization Plan

## Done

- **C17 port**: Clean compile with `-std=c17 -pedantic-errors -Wall -Wextra` (0 errors, 0 warnings)
- **Bug fixes**: `assq` type compare fix, `FILE*` UB fix (added union member), `process_cla` index fix
- **Heap**: Bumped to 200000 cells for headroom
- **Test suite**: `test.scm` exercises 18 feature categories

## Tasks (complexity ascending)

| # | Task | Teaches |
|---|------|---------|
| 1 | **Non-recursive parser** | Explicit stacks, lexer/parser separation |
| 2 | **Fixnum type** (`tc_fixnum`) | Tagged dispatch, numeric tower, reader changes |
| 3 | **Float fixes** (epsilon, `%g`→`%.17g`, NaN/Inf) | IEEE 754 edge cases |
| 4 | **Heap serialization** | Object graph walking, relocation, symbol table |
| 5 | **Heap deserialization (reload)** | Binary parsing, pointer fixup, SUBR resolution |
| 6 | **Incremental GC** (auto-GC in `cons()`) | Read/write barriers, root scanning mid-eval |
| 7 | **Error handling** (stack traces) | Source location, backtrace from env frames |
| 8 | **Tail-call audit** | Verify/extend TCO via `goto loop` in `leval` |

## SIOD Notes

- No `;` comment support — reader treats everything as code
- No `#f`/`#t` — uses `()` for false, non-`()` for true
- GC only runs at REPL prompt (not during `vload`)
- No `apply` built-in
- Depends on `siod.scm` for `defun-macro`, `list`, `cadr`, `replace`, streams

## Missing in siod.scm (add if needed)

- `cddr` — needed for macros manipulating `(form args ...)`
