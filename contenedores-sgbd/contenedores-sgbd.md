# Contenedores de sistemas gestores de base de datos
![ImagenDocker](./img/DockerWhale.png)

<br>

## Comandos Docker con descripción
| Comando | Descripción |
| :--- | :--- |
| **docker --version** | _Verifica la versión de docker_ |
| **docker pull nombre_imagen** | _Descarga una imagen de [Docker Hub](https://hub.docker.com/)_ |
| **docker images** | _Visualiza las imagenes_ |
| **docker run** | _Crea un contenedor_ |
| **docker ps** | _Visualiza todos los contenedores en ejecución_ |
| **docker container ls** | _Visualiza todos los contenedores en ejecución_ |
| **docker ps -a** | _Visualiza todos los contenedores en general (ejecutándose y no ejecutándose)_ |
| **docker container ls -a** | _Visualiza todos los contenedores en general (ejecutándose y no ejecutándose)_ |
| **docker start [nombre o ID del contenedor]** | _Inicia un contenedor_ |
| **docker stop [nombre o ID del contenedor]** | _Detiene un contenedor_ |
| **docker rm [nombre o ID del contenedor]** | _Elimina un contenedor que no está en ejecución_ |
| **docker rm -f [nombre o ID del contenedor]** | _Elimina un contenedor que está en ejecución_ |
| **docker volume ls** | _Lista los volúmenes que tiene docker_ |
| **docker volume create [nombre del volumen]** | _Crea un volumen_ |
| **docker volume rm [nombre del volumen]** | _Elimina un volumen_ |

<br>

## Comandos de Contenedores de SGBD
```bash
docker pull docker/getting-started
```

<br>

### Contenedor de tutorial de Docker
```bash
docker run -d --name tutorial-docker -p 80:80 docker/getting-started:latest
```

<center> ó </center>
<br>

```bash
docker run -d --name tutorial-docker -p 80:80 d79336f4812b
```

<br>

### Contenedor de MariaDB sin volumen
```bash
docker run -d --name server-MariaDBG3 -p 3342:3306 -e MARIADB_ROOT_PASSWORD=12345 70385bd0d0f4
```

<br>

### Contenedor de MariaDB con volumen
```bash
docker run -d --name server-MariaDBG3 \
-p 3342:3306 -e MARIADB_ROOT_PASSWORD=12345 \
-v vol-mariadbg3:/var/lib/mysql 70385bd0d0f4
```

<br>

### Contenedor de Postgres con volumen
```bash
docker run -d --name server-postgresg3 -p 5432:5432 -e POSTGRES_PASSWORD=123456 -v vol-postgresg3:/var/lib/postgresql/data/pgdata 78481659c47e
```