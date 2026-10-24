# Inside an open source project: pandas

Repository: [pandas-dev/pandas](https://github.com/pandas-dev/pandas)

## 1. Licence
The [LICENSE](https://github.com/pandas-dev/pandas/blob/main/LICENSE) file names the **BSD 3-Clause License**. It is a **permissive** licence: I may use, change and share the code, also in projects under a different licence.

If I copy code from pandas into my own project, I must:
- keep the copyright notice, the list of conditions and the disclaimer,
- not use the names of pandas or its contributors to promote my project without permission.

## 2. What machines see
The GitHub API shows the licence as `spdx_id`:

| Repository | `spdx_id` | What it means |
|---|---|---|
| [pandas-dev/pandas](https://api.github.com/repos/pandas-dev/pandas) | `BSD-3-Clause` | GitHub recognises the licence file as the BSD 3-Clause License. |
| [chaymaeloukili/data-integration-labs](https://api.github.com/repos/chaymaeloukili/data-integration-labs) | `MIT` | GitHub recognises my LICENSE file as the MIT License. |
| [owid/co2-data](https://api.github.com/repos/owid/co2-data) | `null` | GitHub found no licence file it could read, so machines see no licence, even if the licence is stated somewhere else, e.g. in the README. |

## 3. Community files
pandas has all four files, according to [Insights → Community standards](https://github.com/pandas-dev/pandas/community):

| File | Available |
|---|---|
| README | ✓ |
| LICENSE | ✓ |
| CONTRIBUTING | ✓ |
| CODE_OF_CONDUCT | ✓ |

It also has a security policy, issue templates and a pull request template. Only "Repository admins accept content reports" is not enabled.

## 4. People
pandas has **3,876 contributors** (shown on the [repository page](https://github.com/pandas-dev/pandas), as of 24.10.2026).

**Who decides what gets merged:**
- Anyone can contribute and review pull requests, but **only members of the Core Team can merge them** ([pandas maintenance](https://pandas.pydata.org/docs/development/maintaining.html)).
- Decisions are made **by consensus** among the Core Team, with input from the community. A pull request with a `-1` vote from a core maintainer or an open discussion should not be merged; larger changes should get a `+1` from at least two Core Team members.
- According to the [governance document](https://pandas.pydata.org/about/governance.html), the project also has a **BDFL** ("Benevolent Dictator for Life", currently Wes McKinney) with final authority, but he usually leaves decisions to the Core Team.

## 5. Money
pandas is funded by a mix of sources, according to its [sponsors page](https://pandas.pydata.org/about/sponsors.html):

- **Foundation:** pandas is a Sponsored Project of [NumFOCUS](https://numfocus.org/), a US non-profit. NumFOCUS gives fiscal, legal and administrative support and manages donations.
- **Donations:** anyone can donate through NumFOCUS.
- **Companies:** Tidelift and Bodo fund pandas; Nvidia employs a contributor who works on pandas (institutional partner); Indeed designed the logo (in-kind sponsor).
- **Volunteers:** many of the 3,876 contributors work on pandas in their free time.
- **Sponsor button:** the repository has a Sponsor button on GitHub.

## 6. Activity
pandas is very active (checked on 24.10.2026 on the [repository page](https://github.com/pandas-dev/pandas)):

| | |
|---|---|
| Latest release | [pandas 3.1.0](https://github.com/pandas-dev/pandas/releases), about 22.10.2026 (125 releases in total) |
| Open issues | about 1,800 |
| Open pull requests | 294 |
| Latest commits | 16 hours ago |

## 7. Your way in
According to the [contributing guide](https://pandas.pydata.org/docs/development/contributing.html), a change gets into pandas like this:

1. Find an issue in the [issues tab](https://github.com/pandas-dev/pandas/issues) and claim it by commenting `/take`. Issues labelled `Needs Triage`, `Needs Discussion`, `Needs Info` or `Closing Candidate` are not available. You can work on at most two issues at a time.
2. Fork the repository, clone it and create a new branch.
3. Make the change, commit it and push it to your fork.
4. Open a pull request with a prefix in the title (e.g. `BUG`, `DOC`, `ENH`) and link the issue (e.g. `closes #1234`).
5. The automated tests (CI) must pass, and a Core Team member reviews and merges the pull request.

**Newcomer labels:** pandas does not use a *good first issue* label: a [label search](https://github.com/pandas-dev/pandas/labels?q=good+first+issue) on 24.10.2026 found none. Instead, the guide tells newcomers to search the issues for something that interests them, and links to an article called "Don't start with good first issues".
