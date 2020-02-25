# pyjags_windows
Docker container for pyjags for windows users having difficulties installing pyjags. 

## Usage
1. Place project directories or files under the project folder and run the following command:

**Windows:**
```
docker run --rm -it -v ${PWD}/project:/usr/src/project/ -p 8899:8888 pyjags_windows
```
**Linux:**
```
docker run --rm -it -v /$(pwd)/project:/usr/src/project/ -p 8899:8888 pyjags_windows
```

2. Once it runs 
