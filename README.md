# sensorium-docker
Docker/Singularity environment for working with neural predictive models. It is based on the [Jupyter Docker Stacks](https://jupyter-docker-stacks.readthedocs.io/en/latest/) pytorch-notebook.


# Usage

## Docker
If you're using Docker, you can just run the image from DockerHub:

```
docker run -p8000:8888 --gpus all eckerlab/sensorium-docker
```

You need additional flags to map your environment and paths into the container. TODO: Describe how to do this.

Then you can accesss Jupyter Lab from your browser on `https://hostname:8000/lab`. The password is `sensorium`.


## Singularity

If you're using Singularity, build the container as follows:

```
sudo singularity build sensorium.sif singularity.def
singularity instance start --bind /path/to/data:/data sensorium.sif sensorium
```

Then you can access Jupyter Lab from your browser on `https://hostname:8888/lab`. The password is `sensorium`.


