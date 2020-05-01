## Prerequirement

* Docker
* Docker compose


## Build

```
git clone https://github.com/wtakase/docker-grafanalib.git
cd docker-grafanalib
docker-compose build
```

## Start a container

```
docker-compose up -d
```

## Generate dashboard

* After executing the following command, you can find `example_dashboard.json` in your `work` directory:

```
docker-compose exec grafanalib generate-dashboard -o example_dashboard.json example_dashboard.py
```

## Stop

```
docker-compose down -v
```

