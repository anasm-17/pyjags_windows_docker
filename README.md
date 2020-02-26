# pyjags_windows
Docker container for pyjags for windows users having difficulties installing pyjags. I do not own pyjags or any of the packages in this docker build, this is merely a repo to help my peers get pyjags running on their machines.

## Usage
1. Pull docker image: 
```
docker pull anasm17/pyjags_windows
```

2. Place project directories or files under the project folder and run the following command in the root directory of the project:

**Windows:**
```
docker run --rm -it -v ${PWD}/project:/usr/src/project/ -p 8899:8888 anasm17/pyjags_windows
```
**Linux/MacOS:**
```
docker run --rm -it -v /$(pwd)/project:/usr/src/project/ -p 8899:8888 anasm17/pyjags_windows
```
*Note:- 8899 can be another number, just make sure it is consistent with step 5.*

3. Once it runs, run the following command:

```
cd /usr/src/project/
```

4. To open jupyter notebook or lab run the following:

```
jupyter notebook --ip 0.0.0.0 --port 8888 --no-browser --allow-root
```

5. On your local browser go to localhost:8899 and copy the token from the terminal onto the password or token input box.
