# IN-CORE Developer Setup

This guide covers getting a local development environment running, and running the tests, for every repository in the IN-CORE platform. It is the mechanical companion to [CONTRIBUTING.md](CONTRIBUTING.md), which covers the process side ([GitFlow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow), branch naming, PR review, CLA).

Each repository section has the same five parts:

1. **Prerequisites**: runtimes and services you need before you start
2. **Setup**: from a clean clone
3. **Run it**: how to start the component locally
4. **Test it**: how to run the test suite
5. **After a dependency change**: what to regenerate, and what to commit

## Contents

- [Getting the source](#getting-the-source)
- [Shared prerequisites](#shared-prerequisites)
- [IN-CORE account and tokens](#in-core-account-and-tokens)
- Python libraries: [pyincore](#pyincore) · [pyincore-viz](#pyincore-viz) · [pyincore-data](#pyincore-data) · [pyincore-incubator](#pyincore-incubator)
- Python based services: [incore-auth](#incore-auth) · [plotting-service](#plotting-service) · [maestro-service](#maestro-service)
- Java based services: [incore-services](#incore-services)
- JavaScript/TypeScript based user interface: [incore-ui](#incore-ui) · [incore-studio](#incore-studio)
- Docs and infrastructure: [incore-docs](#incore-docs) · [incore-helm](#incore-helm) · [incore-lab](#incore-lab)

---

## Getting the source

This repository is a superproject that tracks several of the component repositories as git submodules. 

```bash
git clone --recurse-submodules https://github.com/IN-CORE/IN-CORE.git
```

If you already cloned without `--recurse-submodules`:

```bash
git submodule update --init --recursive
```

12 repositories are tracked here as submodules: `incore-auth`, `incore-docs`, `incore-helm`, `incore-lab`, `incore-services`, `incore-studio`, `incore-ui`, `plotting-service`, `pyincore`, `pyincore-data`, `pyincore-incubator`, `pyincore-viz`. 

`maestro-service` is part of the platform but is **not** a submodule of this repository, and must be cloned separately:

```bash
git clone https://github.com/IN-CORE/maestro-service.git
```

All repositories use [GitFlow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow): branch from `develop`, PR back into `develop`. The exception is this superproject, which currently has only `main`. Only admins can make contributions directly to the superproject. See also [CONTRIBUTING.md](CONTRIBUTING.md#workflow).

## Shared prerequisites

**You will not need all of these. Install what the repositories you are working on ask for.**


| Tool                                                                                                                                                                                            | Used by                                                                    | Notes                                                                                                                                                                                                                                             |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **[conda](https://docs.conda.io/projects/conda/en/latest/user-guide/install/index.html)** or **[micromamba](https://mamba.readthedocs.io/en/latest/installation/micromamba-installation.html)** | all Python repos                                                           | conda is the officially supported installation path for the pyincore family. CI uses micromamba. [mamba](https://mamba.readthedocs.io/en/latest/installation/mamba-installation.html) is a drop-in faster replacement for conda if you prefer it. |
| **Python 3.11+**                                                                                                                                                                                | `pyincore, pyincore-viz, pyincore-data`                                    | `pyincore` sets `python_requires=">=3.11"`; CI tests 3.11, 3.12, 3.13.                                                                                                                                                                            |
| **Python 3.9**                                                                                                                                                                                  | `pyincore-incubator`, `maestro-service`                                    | Older pins; see [Known problems](#known-problems).                                                                                                                                                                                                |
| **GDAL C library**                                                                                                                                                                              | `pyincore`, `pyincore-viz`, `pyincore-incubator`                           | Only needed for the (unsupported) pip install path. On Ubuntu: `gdal-bin`, `libgdal-dev`. Conda pulls this in for you.                                                                                                                            |
| **Ipopt**                                                                                                                                                                                       | `pyincore`                                                                 | Required by the CGE analyses. Comes from the `ipopt>=3.11` conda dependency.                                                                                                                                                                      |
| **pre-commit**                                                                                                                                                                                  | `pyincore`, `pyincore-viz`, `pyincore-data`, `pyincore-incubator`          | `brew install pre-commit` or `pip install pre-commit`.                                                                                                                                                                                            |
| **JDK 11**                                                                                                                                                                                      | `incore-services`                                                          | CI uses Zulu 11. The Gradle build sets source/target compatibility to 11.                                                                                                                                                                         |
| **Node 18+**                                                                                                                                                                                    | `incore-studio`                                                            | `engines` requires node >= 16; CI builds on 18.                                                                                                                                                                                                   |
| **Node 12–14**                                                                                                                                                                                  | `incore-ui`                                                                | CI builds on 12 and 14 only; see [Known problems](#known-problems).                                                                                                                                                                               |
| **Poetry**                                                                                                                                                                                      | `maestro-service`                                                          | `pip install poetry`                                                                                                                                                                                                                              |
| **Docker**                                                                                                                                                                                      | every repo                                                                 | Every component ships a Dockerfile; several are easiest to run this way.                                                                                                                                                                          |
| **MongoDB**                                                                                                                                                                                     | `incore-services`, `incore-auth`                                           |                                                                                                                                                                                                                                                   |
| **PostgreSQL**                                                                                                                                                                                  | `maestro-service`, `incore-services` (GeoServer-backed dataset publishing) |                                                                                                                                                                                                                                                   |
| **Helm 3 + a Kubernetes cluster**                                                                                                                                                               | `incore-helm`                                                              |                                                                                                                                                                                                                                                   |


## IN-CORE account and tokens

Most of the Python repositories talk to the IN-CORE web services, and their tests authenticate against the **dev** deployment.

1. Create an IN-CORE account: [https://tools.in-core.org/](https://tools.in-core.org/) (sign-up link can also be found in [CONTRIBUTING.md](CONTRIBUTING.md#upload-data)).
2. `pyincore` caches tokens under `~/.incore/`. `IncoreClient` creates this directory on first use and writes one token file per service URL.
3. `pyincore`'s test suite does **not** use the cache. `tests/conftest.py` reads `tests/pyincore/.incorepw`, a two-line file containing a JWT and the key to decode it, and uses the credentials inside to log into `INCORE_API_DEV_URL`. In CI this file is written from the `PYTEST_USER_TOKEN` secret. Ask in the `#in-core-dev-team` Slack channel for the equivalent for local runs. **Do not commit this file.**

---

## pyincore

Python analysis library; the core of the platform.

### 1. Prerequisites

[conda](https://docs.conda.io/projects/conda/en/latest/user-guide/install/index.html) (or [micromamba](https://mamba.readthedocs.io/en/latest/installation/micromamba-installation.html)), Python 3.11+, pre-commit. Ipopt and GDAL come from the conda environment.

This is the **developer** setup. End users install a released package with `conda install -c in-core pyincore` instead; that path does not pick up local source changes.

### 2. Setup

```bash
cd pyincore
conda env create -f environment.yml
conda activate pyincore
pip install -e .
pre-commit install
```

`pip install -e .` installs the local checkout in editable mode. After you change library code, reinstall so the env stays in sync:

```bash
pip install -e .
```

`environment.yml` is the **authoritative** dependency file for this repository: `requirements.txt`, `setup.py`'s `install_requires`, `recipes/meta.yaml` and `versions.md` are all generated from it (see [step 5](#5-after-a-dependency-change)).

### 3. Run it

`pyincore` is a library, not a service. Use it from a notebook or script:

```python
from pyincore import IncoreClient
client = IncoreClient()
```

Example notebooks live in [incore-docs](#incore-docs) under `manual_jb/content/notebooks/`.

### 4. Test your local change

Put your `.incorepw` in `tests/pyincore/` first (see [IN-CORE account and tokens](#in-core-account-and-tokens)).

**Unit / integration tests (pytest).** This is what CI runs (`.github/workflows/pytests.yml`):

```bash
python -m pytest --ignore=tests/test_format.py --ignore=tests/pyincore/analyses
```

The two exclusions are deliberate: `tests/test_format.py` duplicates the pre-commit hooks, and `tests/pyincore/analyses` is not a pytest suite (see below).

**Analysis scripts (not pytest).** Files under `tests/pyincore/analyses/` are runnable example scripts (`if __name__ == "__main__"`). They talk to the dev services and write result files next to the script. Run one analysis at a time:

```bash
python tests/pyincore/analyses/meandamage/test_meandamage_building.py
```

Do **not** expect `python -m pytest tests/pyincore/analyses` to exercise them; almost none define `test_`* functions for pytest to collect.

Formatting is enforced separately by pre-commit (black 23.11.0 + flake8 6.1.0):

```bash
pre-commit run --all-files
```

### 5. After a dependency change

Do **not** hand-edit `requirements.txt`, `environment.yml`, `versions.md`, `recipes/meta.yaml`, or `setup.py`'s version pins. Instead:

1. Add or change the minimum version in `requirements.min`. This is the one file you edit by hand.
2. If the new dependency has to come from conda rather than pip, add it to `CONDA_IMPORTS` at the top of `requirements.sh`.
3. Regenerate (requires `python3 -m virtualenv` on your PATH; the script creates `/tmp/pyincore-requirements` on first run): `./requirements.sh`

`requirements.sh` scans imports in `pyincore/`, `tests/`, and `notebooks/`, resolves them with `pip-compile` in that throwaway virtualenv, and rewrites `requirements.imports`, `requirements.txt`, `environment.yml`, `versions.md`, `recipes/meta.yaml`, and `setup.py`.
4. Rebuild the conda env and reinstall the local package before re-running tests:

```bash
conda env update -f environment.yml --prune
conda activate pyincore
pip install -e .
```

Then re-run the tests and commit **all** regenerated files together with your code change. Skipping the rebuild is a common source of misleading passes and failures.

A nightly workflow (`.github/workflows/requirements.yaml`) runs `requirements.sh` against `main` and opens a PR when the resolved versions drift. If you see an automated "Updated requirements" PR, that is where it came from.

Note: `pyincore-viz` and `pyincore-incubator` use the same `requirements.sh` mechanism with a different `MODULE` value. `pyincore-data` does not; keep its files in sync by hand (see that section).

---

## pyincore-viz

Visualization utilities for `pyincore`.

### 1. Prerequisites

[conda](https://docs.conda.io/projects/conda/en/latest/user-guide/install/index.html), GDAL, pre-commit. On macOS, add `backend : Agg` to `~/.matplotlib/matplotlibrc` if matplotlib fails to import (see the repository README).

This is the developer setup. End users install with `conda install -c in-core pyincore-viz`.

### 2. Setup

```bash
cd pyincore-viz
conda env create -f environment.yml
conda activate pyincore_viz
pip install -e .
pre-commit install
```

After local library changes, reinstall with `pip install -e .`.

### 3. Run it

Library only; import `pyincore_viz` from a notebook or script.

### 4. Test it

These are real pytest tests (`def test_*` with `@pytest.fixture`). CI (`.github/workflows/pytest.yaml`) runs them separately:

```bash
python -m pytest tests/pyincore_viz/test_pyincore_viz.py
python -m pytest tests/pyincore_viz/test_analysis_viz.py
```

Put credentials in `tests/pyincore_viz/.incorepw` the same way as for `pyincore`.

### 5. After a dependency change

Same as [pyincore](#5-after-a-dependency-change): edit `requirements.min`, run `./requirements.sh`, then `conda env update -f environment.yml --prune` and `pip install -e .` before re-running tests. Commit the regenerated `requirements.txt`, `environment.yml`, `versions.md`, `recipes/meta.yaml` and `setup.py`.

---

## pyincore-data

Utilities for preparing data for IN-CORE analyses.

### 1. Prerequisites

conda, Python 3.9, pre-commit.

### 2. Setup

Note the file name: this repository uses `environment.yaml`, not `environment.yml`:

```bash
cd pyincore-data
conda env create -f environment.yaml
conda activate pyincore_data
pip install -e .
pre-commit install
```

### 3. Run it

Library only.

### 4. Test it

These are real pytest tests (`def test_*` with `@pytest.fixture`). CI (`.github/workflows/pytest.yaml`) runs only:

```bash
python -m pytest --cache-clear -s tests/pyincore_data/test_pyincore_data.py
```

CI also writes `tests/pyincore_data/.incorepw` from `PYTEST_USER_TOKEN`, but the suite above does not use an `IncoreClient` (census/NSI helpers), and this repository has no `conftest.py` that reads the file.

Other files under `tests/pyincore_data/` that CI does **not** run:

- `test_nsi.py`: real pytest (`def test_*`); run locally with `python -m pytest tests/pyincore_data/test_nsi.py` if you want it.
- `test.py`: not pytest. It is a local runnable script (`if __name__ == "__main__"`), gitignored via `*test.py`, and is not collected by pytest.

### 5. After a dependency change

`setup.py` reads `requirements.txt` directly (`install_requires=[line.strip() for line in open("requirements.txt")]`), so `requirements.txt` and `environment.yaml` must be kept in sync **by hand**. This
repository has no `requirements.sh`. Update both, then:

```bash
conda env update -f environment.yaml --prune
conda activate pyincore_data
pip install -e .
```

Commit both files with your change.

---

## pyincore-incubator

Community analyses that extend `pyincore`'s `BaseAnalysis`.

### 1. Prerequisites

[conda](https://docs.conda.io/projects/conda/en/latest/user-guide/install/index.html), Python 3.9+ (`python_requires=">=3.9"`), GDAL (via conda). pre-commit for formatting.

This is the developer setup. End users install with `conda install -c in-core pyincore-incubator`.

### 2. Setup

```bash
cd pyincore-incubator
conda env create -f environment.yml
conda activate pyincore_incubator
pip install -e .
pre-commit install
```

After local library changes, reinstall with `pip install -e .`.

### 3. Run it

Library only; analyses chain with `pyincore` analyses.

### 4. Test it

There is **no pytest workflow** in CI. Files under `tests/pyincore_incubator/analyses/` are runnable example scripts (`if __name__ == "__main__"`), same pattern as `pyincore`'s analysis scripts. They talk to the dev services. Run one at a time:

```bash
python tests/pyincore_incubator/analyses/example/test_example.py
python tests/pyincore_incubator/analyses/independentrecovery/test_independentrecovery.py
```

Do **not** expect `python -m pytest tests/` to exercise them.

Formatting is checked in CI by black (`.github/workflows/black.yaml`). Locally:

```bash
pre-commit run --all-files
# or
black --check .
```

### 5. After a dependency change

Same `requirements.sh` mechanism as [pyincore](#5-after-a-dependency-change): edit `requirements.min`, run `./requirements.sh`, then:

```bash
conda env update -f environment.yml --prune
conda activate pyincore_incubator
pip install -e .
```

Re-run the analysis scripts and commit the regenerated files.

---

## incore-auth

Flask gatekeeper that validates Keycloak JWTs in front of the other services and records usage in InfluxDB.

### 1. Prerequisites

Python 3.7+ (the container is `python:3.7-alpine`), MongoDB, a Keycloak public key, and optionally InfluxDB. Geolocation tracking additionally needs an `IP2LOCATION-LITE-DB5.BIN` database file.

### 2. Setup

```bash
cd incore-auth
python3 -m venv .venv && source .venv/bin/activate
pip install -r incore_auth/requirements.txt
```

`incore_auth/requirements.txt` is the only dependency file; there is no `setup.py`, `environment.yml` or lock file.

### 3. Run it

Configure via environment variables, as the Dockerfile does:

```bash
export FLASK_APP=app.py
export KEYCLOAK_PUBLIC_KEY=...
export KEYCLOAK_AUDIENCE=...
export MONGODB_URI=...
export DATAWOLF_URL=http://localhost:8888/datawolf
cd incore_auth
flask run
```

Which services require a token, and which Keycloak group or role grants access to each, is controlled by `incore_auth/config.json`.

For production-shaped runs, use the container:

```bash
docker build -t incore/auth .
```

### 4. After a dependency change

Edit `incore_auth/requirements.txt` by hand, then recreate the virtualenv (or rebuild the image) before testing anything:

```bash
pip install -r incore_auth/requirements.txt --upgrade
```

Pins are major-version ranges (`flask==2.*`), so a plain reinstall can move you across minor versions. Rebuild rather than patching an existing environment.

---

## plotting-service

Flask service that generates sample points for plotting DFR3 curves.

### 1. Prerequisites

conda, Python 3.8.10, plus `pyincore` and `pyincore-viz` from the `in-core` conda channel.

### 2. Setup

The environment file lives in the nested `plotting-service/` directory, not at the repository root:

```bash
cd plotting-service/plotting-service
conda env create -f env.yml
conda activate plotting-service
```

Then initialize the cache database:

```bash
cd ../util-script
python init_db.py
```

### 3. Run it

```bash
cd plotting-service
python app.py
# or
flask run
```

In the container it runs under gunicorn: `gunicorn app:app --config gunicorn.config.py`, exposed on port 5000.

### 4. Test it

There is **no test workflow in CI** (only `.github/workflows/docker.yaml`). `test/test_samples.py` is an HTTP smoke script against a **running** local service on port 5000. It has `def test_`* helpers and an `if __name__ == "__main__"` entry point; it prints responses rather than asserting much.

Start the service first (see step 3), then:

```bash
cd test
python test_samples.py
```

### 5. After a dependency change

`plotting-service/env.yml` is the single authoritative dependency file. There is no `requirements.txt` and no lock file. Edit it, then rebuild:

```bash
conda env update -f env.yml --prune
conda activate plotting-service
```

Because this service depends on `pyincore` and `pyincore-viz` from the `in-core` channel, a `pyincore` release can change this service's resolved environment without any change here. Recreate the environment from scratch (`conda env remove -n plotting-service` then `conda env create -f env.yml`) when a test result looks inexplicable.

---

## maestro-service

FastAPI service that manages playbooks.

### 1. Prerequisites

Python 3.9, Poetry, PostgreSQL.

### 2. Setup

```bash
cd maestro-service
pip install poetry
poetry install
```

Copy `env-example` and fill in your database settings:

```bash
cp env-example .env
```

e.g.

```
POSTGRES_SERVER=localhost
POSTGRES_PORT=5432
POSTGRES_USER=maestro
POSTGRES_PASSWORD=maestro
POSTGRES_DB=maestro
ROUTER_PREFIX=/maestro
```

Database migrations are managed by Alembic (`alembic/`).

### 3. Run it

```bash
poetry run uvicorn app.main:app --reload
```

- [http://localhost:8000/](http://localhost:8000/): welcome message
- [http://localhost:8000/docs](http://localhost:8000/docs): Swagger UI

Or with Docker:

```bash
docker build --tag incore/maestro-service:latest .
docker run -p 8000:8000 --env-file env-example incore/maestro-service:latest
```

### 4. Test it

There is **no test workflow in CI** (only `.github/workflows/docker.yaml`). `app/tests/test_retrofit_strategies.py` is real pytest (`def test_`* with asserts), but it hits a **running** local service on `http://localhost:8000`. `pytest` is a Poetry dependency.

Start the service first (see step 3), then:

```bash
poetry run pytest app/tests
```

### 5. After a dependency change

`pyproject.toml` is authoritative and `poetry.lock` is the resolved lock file. **Both must be committed.**

```bash
poetry add <package>          # or edit pyproject.toml, then:
poetry lock
poetry install                # sync your venv to the new lock
poetry run pytest app/tests
```

Running `poetry install` after changing `pyproject.toml` without re-locking will install from the *old* lock file. That is the misleading-pass case for this repository.

---

## incore-services

The Java web services: Data, DFR3, Hazard, Space, Semantics and Project. Gradle multi-project build under `server/`.

### 1. Prerequisites

JDK 11, MongoDB. A GeoServer instance and PostgreSQL are needed for the dataset-publishing paths in the Data service; leave `GEOSERVER_ENABLE` unset to skip them locally.

The Gradle wrapper (8.13) is committed under `server/gradle/wrapper/`, so you do not need Gradle installed.

### 2. Setup

```bash
cd incore-services/server
./gradlew projects
```

That resolves the wrapper and lists the nine subprojects (`data-service`, `dfr3-service`, `hazard-service`, `incore-common`, `project-service`, `semantic-core`, `semantics-service`, `space-service`, `tools-common`). Dependencies are
pulled from Maven Central plus the OSGeo repositories. **The first build downloads a lot**.

All runtime configuration comes from environment variables; there is no properties file to edit. The full set:

```
COMMON_MONGODB_URI
DATA_MONGODB_URI
DFR3_MONGODB_URI
HAZARD_MONGODB_URI
PROJECT_MONGODB_URI
SEMANTICS_MONGODB_URI
SPACE_MONGODB_URI
MONGO_STATUS_CONN_TIMEOUT

DATA_SERVICE_URL
DFR3_SERVICE_URL
HAZARD_SERVICE_URL
SEMANTICS_SERVICE_URL
SERVICES_URL
SERVICE_VERSION

DATA_REPO_DATA_DIR
DATA_REPO_WEBDAV_SERVER_URL
DATA_REPO_WEBDAV_DS_DIR
DATA_REPO_WEBDAV_PROP_DIR

GEOSERVER_ENABLE
GEOSERVER_URL
GEOSERVER_USER
GEOSERVER_PW
GEOSERVER_WORKSPACE

PG_HOST
PG_PORT
PG_DATABASE
PG_USER
PG_PASSWORD

DATAWOLF_URL
DATAWOLF_USER

SERVICES_ALLOW_ORIGIN
SERVICES_ALLOW_METHODS
SERVICES_ALLOW_HEADERS
```

**At minimum, point the** `*_MONGODB_URI` **variables at a local MongoDB.**

### 3. Run it

Gretty can run all six web applications in a single Jetty "farm" on port 8080:

```bash
cd server
./gradlew farmRun
```

Or run one service at a time (same port 8080, that service's `contextPath` only):

```bash
./gradlew :hazard-service:appRun
./gradlew :data-service:appRun
./gradlew :dfr3-service:appRun
./gradlew :semantics-service:appRun
./gradlew :space-service:appRun
./gradlew :project-service:appRun
```

`jettyRun` is an alias for `appRun` (what the per-service READMEs call). Context paths: `/hazard`, `/data`, `/dfr3`, `/semantics`, `/space`, `/project`.

Or build the per-service containers:

```bash
./docker.sh
```

### 4. Test it

Exactly what CI runs (`.github/workflows/ci.yml`):

```bash
cd server
./gradlew clean
./gradlew assemble
./gradlew test
```

Tests are JUnit 5 with Mockito. A single subproject:

```bash
./gradlew :hazard-service:test
```

### 5. After a dependency change

Dependency versions are declared inline in `server/build.gradle`; shared ones in the `subprojects { dependencies { … } }` block, service-specific ones in the per-service block further down. There is no lock file, so a version bump takes effect on the next build, but **Gradle will happily reuse stale compiled output and a stale dependency cache**:

```bash
./gradlew clean
./gradlew assemble
./gradlew test
```

Always `clean` first after a dependency change. Use `--refresh-dependencies` if you have changed a dynamic version or a snapshot. Commit `server/build.gradle`; if you added a subproject, also commit `server/settings.gradle`.

---

## incore-ui

The IN-CORE web tools: React + Redux, built with webpack and Babel.

### 1. Prerequisites

Node. `package.json` declares `engines: node >= 6.9.5`, but CI builds only on Node 12 and 14, and this is what actually works. Use a version manager (`nvm`) rather than your system Node. 

### 2. Setup

```bash
cd incore-ui
npm install
```

(`yarn install` also works; the repository commits `package-lock.json`, so prefer npm.)

### 3. Run it

Pick a backend by setting `INCORE_REMOTE_HOSTNAME`:

```bash
npm run start:dev     # https://dev.in-core.org
```

Against a locally-running [incore-services](#incore-services):

```bash
export INCORE_REMOTE_HOSTNAME=http://localhost:8080
npm start
```

Production build:

```bash
npm run build
```

Docker:

```bash
docker build -t incore/frontend:develop .
docker run -ti --rm --name frontend -p 8888:80 incore/frontend
```

### 4. Linting

```bash
npm run lint
```

`npm run lint` also ends in `|| exit 0`, and `prebuild` runs it, so lint errors will not fail a build either.

### 5. After a dependency change

`package.json` is authoritative; `package-lock.json` is the resolved lock file. **Both must be committed.**

```bash
npm install <package>        # updates package.json and package-lock.json
rm -rf node_modules && npm ci   # clean install from the lock file
npm run build
```

Use `npm ci` rather than `npm install` when you want to verify the lock file is self-consistent. `npm install` will silently rewrite the lock to satisfy a conflict, which is how a dependency change ends up looking fine locally and breaking in CI.

---

## incore-studio

TypeScript/React app built with esbuild.

### 1. Prerequisites

Node 16+ (CI builds on 18), npm 7+. Some dependencies come from the `@ncsa` scope on GitHub Packages. Configure it once: 

```bash
echo "@ncsa:registry=https://npm.pkg.github.com/" >> ~/.npmrc
echo "//npm.pkg.github.com/:_authToken=<your GitHub PAT with read:packages>" >> ~/.npmrc
```

CI uses the `GEO_EXPLORER_GITHUB_TOKEN` secret for this.

### 2. Setup

```bash
cd incore-studio
npm install
```

### 3. Run it

```bash
npm run start:dev    # builds in watch mode, serves on http://localhost:3000
```

Production build and preview:

```bash
npm run build
npm run preview
```

### 4. Linting and type check

```bash
npm run lint
npm run type-check     # tsc --noEmit
npm run build
```

### 5. After a dependency change

Same as [incore-ui](#5-after-a-dependency-change-8): `package.json` plus `package-lock.json`, both committed.

```bash
rm -rf node_modules && npm ci
npm run type-check
npm run lint
npm run build
```

---

## incore-docs

Sources for the IN-CORE manual (Jupyter Book), the pyIncore example notebooks, and the Swagger technical reference.

### 1. Prerequisites

conda, Python 3.9+, or just Docker.

### 2. Setup

```bash
cd incore-docs/manual_jb
conda create -n incore_docs python=3.9
conda activate incore_docs
pip install -r requirements.txt
```

`requirements.txt` pins `jupyter-book==0.15.1` and `sphinx-book-theme>=0.1.4`. The repository README suggests `conda install -c conda-forge jupyter-book` instead; prefer `requirements.txt`, since that is what the Dockerfile and CI use.

### 3. Run it

```bash
cd manual_jb
jupyter-book build content
```

Then open `content/_build/html/index.html`. `jupyter-book clean content` empties the build directory.

Via Docker, which is what CI builds:

```bash
cd manual_jb
docker build -t doc_test .
docker run --rm -p 80:80 --name doctest doc_test:latest
# http://localhost/doc/incore/
```

The Swagger API reference is a separate image built from `restapi/`.

### 4. After a dependency change

`manual_jb/requirements.txt` is authoritative. Edit it, reinstall, and rebuild from clean;Jupyter Book caches aggressively and a stale `_build` will hide a breakage:

```bash
pip install -r requirements.txt --upgrade
jupyter-book clean content
jupyter-book build content
```

The manual's version number lives in `manual_jb/content/_config.yml` and the API reference's in `restapi/data.json`; CI reads both to compute image tags.

---

## incore-helm

Helm chart that deploys the whole platform to Kubernetes.

### 1. Prerequisites

Helm 3, a Kubernetes cluster (1.16+) with PV provisioner support, and `chart-testing`(`ct`) for linting.

### 2. Setup

```bash
cd incore-helm
helm repo add bitnami https://raw.githubusercontent.com/bitnami/charts/archive-full-index/bitnami
helm dependency update
```

### 3. Run it

```bash
helm install my-release . -f values-incore-dev.yaml
```

Per-environment values files are committed: `values-incore-dev.yaml`, `values-incore-tst.yaml`, `values-incore-prod.yaml`, plus separate files for GeoServer, Grafana, InfluxDB and JupyterHub. `deploy.sh` and `deploy-incore-lab.sh` wrap the usual sequence.

To render without applying anything:

```bash
helm template my-release . -f values-incore-dev.yaml
```

### 4. After a dependency change

Subchart dependencies are declared in `Chart.yaml`. After changing one:

```bash
helm dependency update
```

That rewrites `Chart.lock` and repopulates `charts/`. Commit `Chart.yaml` **and** `Chart.lock`. `ct.yaml` sets `check-version-increment: true`, **so you must also bump** `version` **in** `Chart.yaml` **or the lint will fail.** 

---

## incore-lab

The customized JupyterLab image (and JupyterHub configuration) that IN-CORE Lab runs.

Not a submodule dependency of anything else; **it packages** `pyincore` **for users**.

### 1. Prerequisites

Docker. The repository is two Dockerfiles and their configuration:

- `lab/`: `Dockerfile` and `config.yml`, the JupyterLab image
- `hub/`: `Dockerfile` and `authenticator/`, the JupyterHub image

### 2. Setup

```bash
git clone https://github.com/IN-CORE/incore-lab.git
cd incore-lab
```

### 3. Run it

```bash
cd lab
docker build -t incore/lab .
docker run --rm -p 8888:8888 incore/lab
```

### 4. After a dependency change

The installed `pyincore` version is pinned in `lab/Dockerfile` / `lab/config.yml`. After changing it, rebuild the image from scratch — a cached layer will keep the old package:

```bash
docker build --no-cache -t incore/lab lab/
```

