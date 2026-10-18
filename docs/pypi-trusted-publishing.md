# PyPI Trusted Publishing (satvox)

satvox publishes to PyPI via **Trusted Publishing (OIDC)** — the workflow holds
no API tokens and no repository secrets are required.

## One-time setup (repo owner, manual, on pypi.org)

PyPI must know about the publisher before the first publish can succeed:

1. Log in to https://pypi.org and go to *Account settings → Publishing*.
2. Click **Add a new "pending" publisher** and fill in:
   - **PyPI project name:** `satvox`
   - **Owner:** `OneByJorah`
   - **Repository:** `satvox`
   - **Workflow filename:** `publish-pypi.yml`
   - **Environment:** *(leave blank — the workflow does not use one)*
3. Save. That registers the pending publisher; the first publish from the
   workflow will claim the `satvox` project name.

## How publishing works

- `.github/workflows/publish-pypi.yml` runs on **release published** or
  **workflow_dispatch** only.
- It builds the sdist + wheel with `python -m build` and uploads via
  `pypa/gh-action-pypi-publish@release/v1`, authenticating with the
  OIDC token (`permissions: id-token: write`).
- Regular CI (`.github/workflows/ci.yml`) has a `build` job that runs
  `python -m build` + `twine check` on every push/PR, so packaging stays
  verified without ever touching PyPI.

## Honest packaging status

satvox is an **installable app** (hub + Raspberry Pi satellite services,
deployed via Docker or `install.sh`), not an importable library: the
repository has no `satvox/` Python package, so the wheel ships metadata
only. Metadata is kept accurate and buildable; `pip install satvox` will not
provide runnable modules until the code is restructured for library use.
