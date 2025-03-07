workspace extends ../system-landscape.dsl {
    model {
        !ref system_static_storage {
            fs_static = container "Статические файлы пользователей" {
                description "Файлы аватарок и логотипов на чертежи (PNG, JPG)"
                tags "folder"
            }

            app_web_server = container "Веб-сервер" {
                url "https://static-1.kalk.pro"
                technology "nginx/1.22.1 + php-fpm"
            }

            app_backend = container "Uploader" {
                technology "php 7.2.9"
                description "Загрузчик файлов. Оптимизатор размера изображений. Фильтрация содержимого (безопасность)."
                -> fs_static "Хранилище статических файлов" "FS"
            }

            system_web_site -> app_web_server "HTTP-запросы" "HTTP"
            app_web_server -> app_backend "Разместить изображение" "HTTP"
        }

        // Production
        !ref "DeploymentNode://Production/FirstVDS/STATIC-STORAGE" {
            containerInstance fs_static {
                description "Файловая директория с правами только на чтение, 20Gb (Debian 9.5, ext4)"
            }

            containerInstance app_backend {
                description "Бэкенд приложение (PHP php 7.2.9)"
            }

            containerInstance app_web_server {
                description "Веб-сервер (nginx/1.10.3 + php-fpm)"
            }
        }
    }

    views {
        systemContext system_static_storage STATIC_STORAGE_C4L1 "Хранилище статики - Контекстная диаграмма" {
            autoLayout
            include ->system_static_storage->
        }
        container system_static_storage STATIC_STORAGE_C4L2 "Хранилище статики" {
            autoLayout
            include *
        }
        deployment system_static_storage Production STATIC_STORAGE_DEPLOY_PROD "Хранилище статики" {
            autoLayout
            include *
            exclude "element.tag==Software System"
            exclude "element.tag==Infrastructure Node"
        }
    }
}