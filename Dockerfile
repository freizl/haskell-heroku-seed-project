FROM haskell:8.10 as build

WORKDIR /app/build

# Add just the .cabal file to capture dependencies
COPY stack.yaml stack.yaml.lock haskell-heroku-seed-project.cabal /app/build/
# # Docker will cache this command as a layer, freeing us up to
# # modify source code without re-installing dependencies
# # (unless the .cabal file changes!)
RUN stack build --only-dependencies -j4

# # Add and Install Application Code
COPY . /app/build/
RUN stack install
RUN mv $(stack path --local-bin) /app/build/bin

FROM debian:buster as prod
WORKDIR /app
COPY --from=build /app/build/bin .
RUN adduser myuser
USER myuser

CMD /app/haskell-heroku-seed-project-app
