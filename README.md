# Dockerized face recognition

A Dockerfile to build Adam Geitgey's [face recognition](https://github.com/ageitgey/face_recognition).

## Building

```
docker build -t face_recognition .
```

## Usage

### Command line

Command line [usage](https://github.com/ageitgey/face_recognition#usage)

### Docker

To use the face_recognition container, set volumes for known and unknown. Results go to stdout, redirect to file if desired.

```
docker run -ti -v $(PWD)/known:/known:rw -v $(PWD)/unknown:/unknown:rw face_recognition /known /unknown > results.txt
```

An [image](https://hub.docker.com/r/spara/face_recognition/) is available on Docker Hub.
