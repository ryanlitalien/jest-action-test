workflow "Build and test" {
  on = "push"
  resolves = ["Test"]
}

action "Test" {
  uses = "ryanlitalien/jest-action@master"
}
