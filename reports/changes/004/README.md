# 004: A count

[Back to change log](../../README.md)

## Request and code change

Count A bases separately.

- Added columns: `a_count`.
- [Original commit](https://github.com/ryderkuo2006-bot/lab.meeting.0918.test/commit/4f0771eaea0fdad3c5634ecfe4a274da828b15ed) · [Code at this version](https://github.com/ryderkuo2006-bot/lab.meeting.0918.test/blob/4f0771eaea0fdad3c5634ecfe4a274da828b15ed/analysis/calculate_gc.R).
- [Result snapshot](results.csv): the small final table from this exact commit.
- All existing columns and the six-row order are unchanged from the previous version.

## New results

| Sequence | a_count |
|---|---|
| genome_001 | 23 |
| genome_002 | 23 |
| genome_003 | 23 |
| genome_004 | 23 |
| genome_005 | 24 |
| genome_006 | 23 |

## Provenance and validation

This English report was consolidated during the directory reorganization. The linked commit and result snapshot retain the original analysis version; historical commits are not rewritten.

At the original run, all six new results were checked against independent Python calculations and earlier columns were compared for equality.
[Local artifact index](artifacts.csv) lists descriptions, sizes and SHA-256 values. The preserved files are under `work/gc_content/history/a_count/`, excluded from Git. Original snapshots retain their original language and paths to preserve their hashes.

## Reproduce this historical version

Use the linked original commit in a separate checkout/worktree, then run `Rscript analysis/calculate_gc.R` from that checkout root. The historical script expects the historical input paths. Running the current script instead includes later features.

These are descriptive measurements of six fictional short sequences, not biological conclusions.
