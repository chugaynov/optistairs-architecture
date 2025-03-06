# Запуск STRUCTURIZR
## Подготовка диаграмм
### Общий вид команды для запуска Structurizr
```shell
docker run -it --rm -p 8080:8080 -v <path-to-local-repo>:/usr/local/structurizr -e STRUCTURIZR_WORKSPACE_PATH=<system-workspace-subdir> structurizr/lite
```

### Программные системы
```shell
docker run -it --rm -p 8080:8080 -v `pwd`/c4_sys:/usr/local/structurizr -e STRUCTURIZR_WORKSPACE_PATH=/ structurizr/lite
```

### Веб-сайт https://kalk.pro
```shell
docker run -it --rm -p 8080:8080 -v `pwd`/c4_sys:/usr/local/structurizr -e STRUCTURIZR_WORKSPACE_PATH=/web-site structurizr/lite
```

### Хранилище статических файлов https://static-1.kalk.pro
```shell
docker run -it --rm -p 8080:8080 -v `pwd`/c4_sys:/usr/local/structurizr -e STRUCTURIZR_WORKSPACE_PATH=/static-storage structurizr/lite
```

### Контролер выдачи простых калькуляторов на JS https://sinode-1.kalk.pro
```shell
docker run -it --rm -p 8080:8080 -v `pwd`/c4_sys:/usr/local/structurizr -e STRUCTURIZR_WORKSPACE_PATH=/simple-calc structurizr/lite
```

### Калькулятор металлопроката https://met-calc.ru
```shell
docker run -it --rm -p 8080:8080 -v `pwd`/c4_sys:/usr/local/structurizr -e STRUCTURIZR_WORKSPACE_PATH=/metal-calc structurizr/lite
```

### Программная система "Кластер проектных расчетов" https://node-x.kalk.pro
```shell
docker run -it --rm -p 8080:8080 -v `pwd`/c4_sys:/usr/local/structurizr -e STRUCTURIZR_WORKSPACE_PATH=/node-calc structurizr/lite
```

### Подбор оптимальной конфигурации лестниц https://optistair.kalk.pro
```shell
docker run -it --rm -p 8080:8080 -v `pwd`/c4_sys:/usr/local/structurizr -e STRUCTURIZR_WORKSPACE_PATH=/optistair-calc structurizr/lite
```
