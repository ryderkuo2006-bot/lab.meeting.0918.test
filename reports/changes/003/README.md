# 003: G/C balance

[Back to change log](../../README.md)

## Request and code change

Count G and C separately and calculate (G - C) / (G + C).

- Added columns: `g_count`, `c_count`, `gc_skew`.
- [Original commit](https://github.com/ryderkuo2006-bot/lab.meeting.0918.test/commit/eccb3c8fc7a3c70d0d5d8f60da9df9ea5bc86093) · [Code at this version](https://github.com/ryderkuo2006-bot/lab.meeting.0918.test/blob/eccb3c8fc7a3c70d0d5d8f60da9df9ea5bc86093/analysis/calculate_gc.R).
- [Result snapshot](results.csv): the small final table from this exact commit.
- All existing columns and the six-row order are unchanged from the previous version.

## New results

| Sequence | g_count | c_count | gc_skew |
|---|---|---|---|
| genome_001 | 22 | 22 | 0 |
| genome_002 | 22 | 22 | 0 |
| genome_003 | 22 | 21 | 0.0233 |
| genome_004 | 23 | 21 | 0.0455 |
| genome_005 | 23 | 22 | 0.0222 |
| genome_006 | 22 | 22 | 0 |

## Provenance and validation

This English report was consolidated during the directory reorganization. The linked commit and result snapshot retain the original analysis version; historical commits are not rewritten.

At the original run, all six new results were checked against independent Python calculations and earlier columns were compared for equality.
[Local artifact index](artifacts.csv) lists descriptions, sizes and SHA-256 values. The preserved files are under `work/gc_content/history/gc_skew/`, excluded from Git. Original snapshots retain their original language and paths to preserve their hashes.

## Reproduce this historical version

Use the linked original commit in a separate checkout/worktree, then run `Rscript analysis/calculate_gc.R` from that checkout root. The historical script expects the historical input paths. Running the current script instead includes later features.

These are descriptive measurements of six fictional short sequences, not biological conclusions.
