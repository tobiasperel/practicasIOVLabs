# Guia para correr el backend 💻
1-  Instalar venv:

```bash 
py -m pip install --user virtualenv 
py -m venv env 
.\env\Scripts\activate 

```

2- Correr `requirements.txt`:
```bash 
pip install -r requirements.txt

```
3- Crear una Base de datos con el mismo nombre que en [settings](ApiDjango/mysite/settings.py) y remplazar el nombre del host.

4- Migrar las tablas posicionarse en [ApiDjango](apiDjango):
```python
cd ApiDjango
python manage.py migrate
python manage.py makemigrations General
python manage.py migrate
```

5- Para correr el programa poner el siguente comando:
```(Estar parado sobre /backend/apidjango)```
```python 
python manage.py runserver
```
---
Material complementario:

[Api en Postman con todos los end-points](https://www.getpostman.com/collections/b60752b8832f0ff504bc)

[No puedo activar venv](https://www.cdmon.com/es/blog/la-ejecucion-de-scripts-esta-deshabilitada-en-este-sistema-te-contamos-como-actuar)

[Arreglar error BD](https://stackoverflow.com/questions/54824864/django-python-sql-server-pyodbc-isnt-an-available-database-backend)

[Como hacer BD en Django](https://www.youtube.com/watch?v=w8mTKlOeb2o)

[GIT](GIT.md)

[google-ads-github](https://github.com/googleads/google-ads-python.git)
