# Github Actions Workflows

The following .yml files trigger github actions

## CI

ci.yml will trigger on pull_requestdoes the following:

- install dependencies
- Check Code and Formatting Errors
- Build Projects
- Run Automated Tests (Unit and E2E)
- Upload Code Coverage as an Artifact