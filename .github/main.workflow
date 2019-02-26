workflow "Build and test" {
  on = "push"
  resolves = ["git.master"]
}

action "yarn.build" {
  uses = "actions/docker/cli@master"
  args = "build -f .github/Dockerfile.test -t ci-$GITHUB_SHA:latest ."
}

action "yarn.test" {
  uses = "actions/docker/cli@master"
  needs = ["yarn.test"]
  args = "run ci-$GITHUB_SHA:latest yarn test"
}

action "yarn.lint" {
  uses = "actions/docker/cli@master"
  needs = ["yarn.build"]
  args = "run ci-$GITHUB_SHA:latest yarn lint"
}

action "git.master" {
  uses = "actions/bin/filter@master"
  needs = ["yarn.test", "yarn.lint"]
  args = "branch master"
}
