Hello Heroku!

## Setup

- `heroku login`
- `heroku container:login`
- `herok create YOUR_APP_NAME`
- run `make hdeploy` to build image and deploy to heroku
- More details [at this page](https://devcenter.heroku.com/articles/container-registry-and-runtime)

## Notes

1. This seed project uses stack as build tool and scotty web framework to demo creating a webapp. Both can be easily swapped by other tools (e.g. cabal and servant respectively.)
1. Multiple Stage Dockerfile
   a. See 2 `FROM` in the `Dockerfile`
   b. The goal is to create much smaller image for running in production
1. Changes to cabal file and stack yaml will cause full build (rebuild from scratch), which is terrible.
