# How to Contribute

By participating in this project, you agree to abide by our [Code of Conduct](CODE_OF_CONDUCT.md). Before your code can be accepted, you will have to sign a CLA.

Please discuss your ideas and contributions with the community on the Slack (https://in-core.slack.com, #developer channel) or at the Github Discussions. 

## Code Contribution
### Workflow

- Make sure you have a GitHub account https://github.com/
- If the issue doesn’t already exist, submit an issue in GitHub
  - If it's a bug, clearly describe the issue including steps to reproduce it
  - If it's a new feature, clearly describe requirements and how your proposed solution would fulfill them. For complex new features it might help to create a wiki page or google document, or discussions
  - If it's an improvement, clearly describe the current behavior and how your contribution will improve current functionality.
- Create a fork on GitHub
  - See [Fork a repo](https://docs.github.com/en/get-started/quickstart/fork-a-repo) on how to do this and keep it in sync.
- Check out the **develop** branch
  - We use the [GitFlow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow) workflow on all of our repositories
  - This means there are two branches, “main” is released, and “develop” is the next release.
  - All code changes will be against the develop branch
- Make a branch
  - You can create a branch from a Github issue.
  - When creating a branch, start with the issue number and include a short descriptive title for the branch. For example, 276-add-combined-building-loss-for-wind-wave-and-surge
- Make your awesome new feature or bugfix on your branch
  - If this is a new analysis, please include an example Jupyter notebook for incore-docs
  - Code should be documented
  - Code should have unit tests
  - Code should follow black formatting for python, Eclipse Style guide for Java, and Google style guide for Typescript
- From your branch, make pull request against **develop**
  - Make sure to add an example test to verify that your code runs correctly
- Work with the code reviewer to get your change reviewed on GitHub 
- When ready to merge, the branch will be merged into **develop**.
  - We might use squash to minimize the number of commits

### Code Reviews

Code reviews for pull requests will happen in GitHub. If your PR is not ready for review, please create a draft pull request until it is ready for review. When a pull request is ready to be merged, it will be merged into develop on GitHub. 

### Issues

We use some of the common issue labels available in GitHub. For the most part they are self explanatory: **bug**, **enhancement**, **new feature**. 

Make sure to get feedback from the community on your proposed solution before starting implementation, either on Slack (#developer channel), or Github discussions. Given the distributed nature of the team and the different requirements from the different projects using and contributing to IN-CORE, it's important that contributions to the core are compatible with all projects and the overall design.

### Testing

Tests should be included with new contributions to verify they run and to assist in the review process. In addition, we welcome contributions of tests to existing features as well.

### Continuous Integration

All pull requests will be built automatically by the GitHub actions.

### Documentation

User and developer documentation is available in the source (https://github.com/IN-CORE/incore-docs) and [online](https://incore.ncsa.illinois.edu/doc/incore/index.html)

## Data Contribution

This section describes the process for contributing data to the public “incore” space. 

### Upload Data
- Make sure you have an IN-CORE account. You can sign-up [here](https://incore.ncsa.illinois.edu/auth/realms/In-core/protocol/openid-connect/registrations?client_id=react-auth&response_type=code&scope=openid&redirect_uri=https://incore.ncsa.illinois.edu/)
- Upload the data to IN-CORE Data service
- Create PR at [incore-data](https://github.com/IN-CORE/incore-data-release) repo. 
  - Template info
- Review the data
- After approved, the data is moved to the “incore” space

## Documentation Contribution

Please follow the same pattern as code contribution, except no unit tests are required. Branch or Fork the [incore-docs](https://github.com/IN-CORE/incore-docs) repository.

