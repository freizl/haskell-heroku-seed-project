Hello Heroku!

## Setup

- `heroku login`
- `heroku container:login`
- `herok create YOUR_APP_NAME`
- run `make hdeploy` to build image and deploy to heroku
- More details [at this page](https://devcenter.heroku.com/articles/container-registry-and-runtime)

## Notes

This seed project uses stack as build tool and scotty web framework to demo creating a webapp. Both can be easily swapped by other tools (e.g. cabal and servant respectively.)
