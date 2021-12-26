# Python test app using Flask

This is a small Flask hello world web app that runs on port 5000.

# Build and run the docker image 

```bash
docker build . -t myapp:1.0
```

```bash
docker run --rm -p 5000:5000 myapp:1.0
```

