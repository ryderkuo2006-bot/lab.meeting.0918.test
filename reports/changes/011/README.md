# 011: GC ranking

[Back to change log](../../README.md)

## Request and code change

Rank unrounded GC proportions from largest to smallest, preserving ties.

- Added columns: `gc_rank`.
- [Original commit](https://github.com/ryderkuo2006-bot/lab.meeting.0918.test/commit/aa36b7d74f6e203dca0495a3ad7b450c2f14f098) · [Code at this version](https://github.com/ryderkuo2006-bot/lab.meeting.0918.test/blob/aa36b7d74f6e203dca0495a3ad7b450c2f14f098/analysis/calculate_gc.R).
- [Result snapshot](results.csv): the small final table from this exact commit.
- All existing columns and the six-row order are unchanged from the previous version.

## New results

| Sequence | gc_rank |
|---|---|
| genome_001 | 2 |
| genome_002 | 2 |
| genome_003 | 6 |
| genome_004 | 2 |
| genome_005 | 1 |
| genome_006 | 5 |

## Provenance and validation

This English report was consolidated during the directory reorganization. The linked commit and result snapshot retain the original analysis version; historical commits are not rewritten.

At the original run, all six new results were checked against independent Python calculations and earlier columns were compared for equality.
[Local artifact index](artifacts.csv) lists descriptions, sizes and SHA-256 values. The preserved files are under `work/gc_content/history/gc_rank/`, excluded from Git. Original snapshots retain their original language and paths to preserve their hashes.

## Reproduce this historical version

Use the linked original commit in a separate checkout/worktree, then run `Rscript analysis/calculate_gc.R` from that checkout root. The historical script expects the historical input paths. Running the current script instead includes later features.

These are descriptive measurements of six fictional short sequences, not biological conclusions.
