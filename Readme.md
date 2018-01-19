# Build linux kernel meta package for 3.13.0-48

There are certain packages in Ubuntu Precise for which source packages exist, but the binaries have been lost to history.  This builds one of them -- the linux kernel meta package for 3.13.0-48.

# Build instructions

## Replibit-specific example

```sh
rm output/*

docker build \
    -t \
    build-precise-vanilla \
    .

docker run --rm -it -v "${PWD}/output:/out" build-precise-vanilla

# sed -i /^Distribution:/s/precise/rb-precise-alpha/ output/*.changes
# dput output/*
# scp output/* user@repository:/upload-location/
```

All packages built in the docker container will appear in the `output` directory.

