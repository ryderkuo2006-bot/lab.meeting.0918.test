# 013: Most frequent bases

[Back to change log](../../README.md)

## Request and code change

List all most frequent bases, including ties, in A/C/G/T order.

- Added columns: `dominant_bases`.
- [Original commit](https://github.com/ryderkuo2006-bot/lab.meeting.0918.test/commit/6fd5ed2ecd4f109704b5258a8435c3759006c456) · [Code at this version](https://github.com/ryderkuo2006-bot/lab.meeting.0918.test/blob/6fd5ed2ecd4f109704b5258a8435c3759006c456/analysis/calculate_gc.R).
- [Result snapshot](results.csv): the small final table from this exact commit.
- All existing columns and the six-row order are unchanged from the previous version.

## New results

| Sequence | dominant_bases |
|---|---|
| genome_001 | A |
| genome_002 | A |
| genome_003 | A |
| genome_004 | A/G |
| genome_005 | A |
| genome_006 | A |

## Provenance and validation

This English report was consolidated during the directory reorganization. The linked commit and result snapshot retain the original analysis version; historical commits are not rewritten.

At the original run, all six new results were checked against independent Python calculations and earlier columns were compared for equality.
[Local artifact index](artifacts.csv) lists descriptions, sizes and SHA-256 values. The preserved files are under `work/gc_content/history/dominant_bases/`, excluded from Git. Original snapshots retain their original language and paths to preserve their hashes.

## Reproduce this historical version

Use the linked original commit in a separate checkout/worktree, then run `Rscript analysis/calculate_gc.R` from that checkout root. The historical script expects the historical input paths. Running the current script instead includes later features.

These are descriptive measurements of six fictional short sequences, not biological conclusions.
