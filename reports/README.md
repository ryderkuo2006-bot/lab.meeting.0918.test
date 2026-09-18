# Analysis change log

Use this table to find what changed. Each numbered directory holds one report, its small final result snapshot, and an artifact index when available.
Numbers belong to documentation only: active data, code and results stay in fixed directories.

| Change | Description | Result change | Details | Original commit |
|---|---|---|---|---|
| 001 | GC content | Add sequence_length_bp, gc_count, gc_percent | [Open](changes/001/README.md) | [5c2c5e6](https://github.com/ryderkuo2006-bot/lab.meeting.0918.test/commit/5c2c5e6) |
| 002 | AT content | Add at_count, at_percent | [Open](changes/002/README.md) | [8860aeb](https://github.com/ryderkuo2006-bot/lab.meeting.0918.test/commit/8860aeb) |
| 003 | G/C balance | Add g_count, c_count, gc_skew | [Open](changes/003/README.md) | [eccb3c8](https://github.com/ryderkuo2006-bot/lab.meeting.0918.test/commit/eccb3c8) |
| 004 | A count | Add a_count | [Open](changes/004/README.md) | [4f0771e](https://github.com/ryderkuo2006-bot/lab.meeting.0918.test/commit/4f0771e) |
| 005 | T count | Add t_count | [Open](changes/005/README.md) | [6e29eb3](https://github.com/ryderkuo2006-bot/lab.meeting.0918.test/commit/6e29eb3) |
| 006 | A percentage | Add a_percent | [Open](changes/006/README.md) | [2f8622f](https://github.com/ryderkuo2006-bot/lab.meeting.0918.test/commit/2f8622f) |
| 007 | T percentage | Add t_percent | [Open](changes/007/README.md) | [876bde4](https://github.com/ryderkuo2006-bot/lab.meeting.0918.test/commit/876bde4) |
| 008 | A/T balance | Add at_skew | [Open](changes/008/README.md) | [0dbb20a](https://github.com/ryderkuo2006-bot/lab.meeting.0918.test/commit/0dbb20a) |
| 009 | GC deviation | Add gc_deviation_pp | [Open](changes/009/README.md) | [aaf0107](https://github.com/ryderkuo2006-bot/lab.meeting.0918.test/commit/aaf0107) |
| 010 | Length ranking | Add length_rank | [Open](changes/010/README.md) | [b269101](https://github.com/ryderkuo2006-bot/lab.meeting.0918.test/commit/b269101) |
| 011 | GC ranking | Add gc_rank | [Open](changes/011/README.md) | [aa36b7d](https://github.com/ryderkuo2006-bot/lab.meeting.0918.test/commit/aa36b7d) |
| 012 | Longest repeated base run | Add longest_run_bp | [Open](changes/012/README.md) | [c098156](https://github.com/ryderkuo2006-bot/lab.meeting.0918.test/commit/c098156) |
| 013 | Most frequent bases | Add dominant_bases | [Open](changes/013/README.md) | [6fd5ed2](https://github.com/ryderkuo2006-bot/lab.meeting.0918.test/commit/6fd5ed2) |

## How to use this structure

- `changes/001/README.md`: request, implementation, result difference and validation.
- `changes/001/results.csv`: a small final result snapshot, not intermediate data.
- `changes/003/artifacts.csv`: local artifact paths, descriptions, sizes and hashes. Records 001 and 002 predate artifact archiving.
- `work/gc_content/current/`: the working files from the latest execution; local only, overwritten on rerun.
- `work/gc_content/history/`: previously recorded local snapshots, grouped by feature name; local only.

Changes 004–013 were ten simulated requests, each implemented, run and committed separately, then pushed together. They added columns without changing prior results.
Changes 001–002 are retrospective reports reconstructed from Git. Original commits retain their original messages and language.

For future analysis changes, add a numbered directory here, add one row above, and commit the script, small results and report together. Do not create another numbered copy of the active data or code directories.
