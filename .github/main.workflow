workflow "Build and test" {
  on = "push"
  resolves = ["Test"]
}

action "Test" {
  uses = "rkusa/jest-action@master"
}
