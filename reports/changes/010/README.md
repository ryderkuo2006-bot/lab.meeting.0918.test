# 010: Length ranking

[Back to change log](../../README.md)

## Request and code change

Rank lengths from largest to smallest; ties share the minimum rank.

- Added columns: `length_rank`.
- [Original commit](https://github.com/ryderkuo2006-bot/lab.meeting.0918.test/commit/b269101e0e13430937d85d595e78d0bec2a30aa0) · [Code at this version](https://github.com/ryderkuo2006-bot/lab.meeting.0918.test/blob/b269101e0e13430937d85d595e78d0bec2a30aa0/analysis/calculate_gc.R).
- [Result snapshot](results.csv): the small final table from this exact commit.
- All existing columns and the six-row order are unchanged from the previous version.

## New results

| Sequence | length_rank |
|---|---|
| genome_001 | 3 |
| genome_002 | 3 |
| genome_003 | 3 |
| genome_004 | 3 |
| genome_005 | 1 |
| genome_006 | 1 |

## Provenance and validation

This English report was consolidated during the directory reorganization. The linked commit and result snapshot retain the original analysis version; historical commits are not rewritten.

At the original run, all six new results were checked against independent Python calculations and earlier columns were compared for equality.
[Local artifact index](artifacts.csv) lists descriptions, sizes and SHA-256 values. The preserved files are under `work/gc_content/history/length_rank/`, excluded from Git. Original snapshots retain their original language and paths to preserve their hashes.

## Reproduce this historical version

Use the linked original commit in a separate checkout/worktree, then run `Rscript analysis/calculate_gc.R` from that checkout root. The historical script expects the historical input paths. Running the current script instead includes later features.

These are descriptive measurements of six fictional short sequences, not biological conclusions.
