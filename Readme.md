# Build Precise packages from Precise

There are certain packages in Ubuntu Precise for which source packages exist, but the binaries have been lost to history.  This can be used to build those Precise packages for Precise.

# Build instructions

## General

```sh
docker build \
    --build-arg package="package[=version]" \
    -t \
    build-precise-vanilla \
    .
docker run --rm -it -v "${PWD}/output:/out" build-precise-vanilla
```

All packages built in the docker container will appear in the `output` directory.

## Replibit-specific example

```sh
rm output/*

docker build \
    --build-arg package="linux-generic=3.13.0.48.55" \
    -t \
    build-precise-vanilla \
    .

docker run --rm -it -v "${PWD}/output:/out" build-precise-vanilla

# sed -i /^Distribution:/s/trusty/rb-precise-alpha/ output/*.changes
# dput output/*
# scp output/* user@repository:/upload-location/
```

