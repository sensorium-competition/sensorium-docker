# sensorium-docker
Docker/Singularity environment for working with neural predictive models. It is based on the [Jupyter Docker Stacks](https://jupyter-docker-stacks.readthedocs.io/en/latest/) pytorch-notebook.


# Usage

## Docker
If you're using Docker, you can just run the image from DockerHub. To do so, create two files `docker-compose.yml` and `.env` containing the following:

The file `docker-compose.yml` should contain the following:
```
version: '2.3'
services:
  pytorch-notebook:
    image: eckerlab/sensorium-docker:latest
    env_file: .env
    runtime: nvidia
    ports:
      - "8000:8888"
    volumes:
      - /path/to/code:/notebooks
```

This will pull the image with the `cuda12-latest` tag. Change it if you need, e.g., an older version of CUDA. You can find the available images on [DockerHub](https://hub.docker.com/repository/docker/eckerlab/sensorium-docker/general). It will export the Jupyter Lab server on port 8000 and mount `/path/to/code` into the folder `/notebooks` in the container.

The `.env` file will get your relevant environment variables into the container. It has to minimally contain the following:
```
JUPYTER_PASSWORD=<<pick_a_password>>
```

Then, to run the container, run the following command from the folder that contains `docker-compose.yml` and `.env`:

```
docker compose up
```

Then you can accesss Jupyter Lab from your browser on `https://hostname:8000/lab` using the password you defined.


## Singularity

If you're using Singularity, build the container as follows:

```
sudo singularity build sensorium.sif singularity.def
singularity instance start --bind /path/to/data:/data sensorium.sif sensorium
```

Then you can access Jupyter Lab from your browser on `https://hostname:8888/lab`. To get the access token, use the following command:

```
singularity exec instance://sensorium jupyter server list
```

If you want to set a fixed password for accessing Jupyter Lab in the future, you can do so using the following command:

```
singularity exec instance://alex jupyter notebook password
```

It will write a config file into your home directory that will be read next time you start the container. It will not affect the currently running instance.


# Contributing

TO DO: Adding CUDA versions, building, pushing to DockerHub

