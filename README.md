# jest-action-test
Full example of using Github Actions with Jest, Vue and Yarn

## Project setup
```
yarn install
```

### Compiles and hot-reloads for development
```
yarn serve
```

### Compiles and minifies for production
```
yarn build
```

### Run your (unit) tests
```
yarn test
```

### Lints and fixes files
```
yarn lint
```

## Docker

### To build

```
docker build -t jest-action-test . -f ".github/Dockerfile.test"
```

#### To run

```
docker run jest-action-test yarn test
docker run jest-action-test yarn lint
```
