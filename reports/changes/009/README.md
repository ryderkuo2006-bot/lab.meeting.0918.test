# 009: GC deviation

[Back to change log](../../README.md)

## Request and code change

Report GC percentage minus 50, in percentage points.

- Added columns: `gc_deviation_pp`.
- [Original commit](https://github.com/ryderkuo2006-bot/lab.meeting.0918.test/commit/aaf010756e3291d0bdd09f462a70dfe60f2f24c6) · [Code at this version](https://github.com/ryderkuo2006-bot/lab.meeting.0918.test/blob/aaf010756e3291d0bdd09f462a70dfe60f2f24c6/analysis/calculate_gc.R).
- [Result snapshot](results.csv): the small final table from this exact commit.
- All existing columns and the six-row order are unchanged from the previous version.

## New results

| Sequence | gc_deviation_pp |
|---|---|
| genome_001 | 0 |
| genome_002 | 0 |
| genome_003 | -1.14 |
| genome_004 | 0 |
| genome_005 | 0.56 |
| genome_006 | -0.56 |

## Provenance and validation

This English report was consolidated during the directory reorganization. The linked commit and result snapshot retain the original analysis version; historical commits are not rewritten.

At the original run, all six new results were checked against independent Python calculations and earlier columns were compared for equality.
[Local artifact index](artifacts.csv) lists descriptions, sizes and SHA-256 values. The preserved files are under `work/gc_content/history/gc_deviation_pp/`, excluded from Git. Original snapshots retain their original language and paths to preserve their hashes.

## Reproduce this historical version

Use the linked original commit in a separate checkout/worktree, then run `Rscript analysis/calculate_gc.R` from that checkout root. The historical script expects the historical input paths. Running the current script instead includes later features.

These are descriptive measurements of six fictional short sequences, not biological conclusions.
