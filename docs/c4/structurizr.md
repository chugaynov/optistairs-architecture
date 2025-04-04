# Запуск STRUCTURIZR

## Подготовка диаграмм
### Общий вид команды для запуска Structurizr
```shell
docker run -it --rm -p 8080:8080 -v <path-to-local-repo>:/usr/local/structurizr -e STRUCTURIZR_WORKSPACE_PATH=<system-workspace-subdir> structurizr/lite:2024.12.07
```

### Программные системы
```shell
docker run -it --rm -p 8080:8080 -v `pwd`/design/c4:/usr/local/structurizr -e STRUCTURIZR_WORKSPACE_PATH=/ structurizr/lite:2024.12.07
```

### Веб-сайт https://kalk.pro
```shell
docker run -it --rm -p 8080:8080 -v `pwd`/design/c4:/usr/local/structurizr -e STRUCTURIZR_WORKSPACE_PATH=/web-site structurizr/lite:2024.12.07
```

### Хранилище статических файлов https://static-1.kalk.pro
```shell
docker run -it --rm -p 8080:8080 -v `pwd`/design/c4:/usr/local/structurizr -e STRUCTURIZR_WORKSPACE_PATH=/static-storage structurizr/lite:2024.12.07
```

### Контролер выдачи простых калькуляторов на JS https://sinode-1.kalk.pro
```shell
docker run -it --rm -p 8080:8080 -v `pwd`/design/c4:/usr/local/structurizr -e STRUCTURIZR_WORKSPACE_PATH=/simple-calc structurizr/lite:2024.12.07
```

### Калькулятор металлопроката https://met-calc.ru
```shell
docker run -it --rm -p 8080:8080 -v `pwd`/design/c4:/usr/local/structurizr -e STRUCTURIZR_WORKSPACE_PATH=/metal-calc structurizr/lite:2024.12.07
```

### Программная система "Кластер проектных расчетов" https://node-x.kalk.pro
```shell
docker run -it --rm -p 8080:8080 -v `pwd`/design/c4:/usr/local/structurizr -e STRUCTURIZR_WORKSPACE_PATH=/node-calc structurizr/lite:2024.12.07
```

### Подбор оптимальной конфигурации лестниц https://optistair.kalk.pro
```shell
docker run -it --rm -p 8080:8080 -v `pwd`/design/c4:/usr/local/structurizr -e STRUCTURIZR_WORKSPACE_PATH=/optistair-calc structurizr/lite:2024.12.07
```

[> На главную страницу](/README.md)