## Jupyter Docker

```bash
docker run -p 8888:8888 jupyter/scipy-notebook:33add21fab64
```
In a browser, type
```bash
http://127.0.0.1:8888/?token=<token>
```
where <token> is copied from the screen output of above docker run command.