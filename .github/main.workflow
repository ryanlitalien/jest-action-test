workflow "Build and test" {
  on = "push"
  resolves = ["git.pull_request"]
}

action "yarn.build" {
  uses = "actions/docker/cli@master"
  args = "build -f .github/Dockerfile -t ci-$GITHUB_SHA:latest ."
}

action "yarn.test" {
  uses = "actions/docker/cli@master"
  needs = ["yarn.build"]
  args = "run ci-$GITHUB_SHA:latest yarn test"
}

action "yarn.lint" {
  uses = "actions/docker/cli@master"
  needs = ["yarn.build"]
  args = "run ci-$GITHUB_SHA:latest yarn lint"
}

action "eslint.check" {
  uses = "gimenete/eslint-action@1.0"
  needs = ["yarn.build"]
}

action "git.pull_request" {
  uses = "actions/bin/filter@master"
  needs = ["yarn.test", "yarn.lint", "eslint.check"]
  args = "ref refs/pulls/*"
}
