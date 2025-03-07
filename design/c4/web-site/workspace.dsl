workspace extends ../system-landscape.dsl {
    model {
        !ref system_web_site {
            db_kalkpro = container "БД db_kalkpro" {
                description "База данных сайта"
                technology "MySQL"
                tags "storage"
            }

            fs_static = container "Статические файлы для сайта" {
                description "Файлы картинки, документация в PDF"
                tags "folder"
            }

            group "app_kalkpro" {
                app_backend = container "Backend-приложение KALK.PRO" {
                    url "https://bitbucket.org/aschugaynov/kalk.pro-template/src/master/"
                    technology "php 7.3.33, UMI.CMS"
                    description "Основная бизнес-логика сайта + регламентные задания"
                    -> db_kalkpro
                    -> system_static_storage "Безопасное сохранение статических файлов пользователя" "HTTP"
                    -> fs_static "Хранилище статических файлов сайта" "FS"
                    -> ext_smpt "Отправка уведомлений по email" "SMTP"
                }

                app_ui = container "Набор фронтенд приложений" {
                    url "https://bitbucket.org/kalkpro"
                    technology "php 7.3.33, ReactJS"
                    description "Front-приложения, генерируемые на бэкенде и реактивные"
                    -> system_node_calc "Получение проектов 3D и чертежей" "WEB-SOCKETS"
                    -> system_simple_calc "Получение типовых строительных расчетов" "WEB-SOCKETS"
                    -> system_metal_calc "Получение расчетов по металлопрокату" "iFrame"
                    -> system_optistair_calc "Подбор оптимальной конфигурации лестницы" "HTTP"
                    -> system_static_storage "Получение статическийх файлов пользователя" "HTTP"
                }
            }

            app_web_server = container "Веб-сервер" {
                url "https://kalk.pro"
                technology "nginx/1.22.1 + php-fpm"
            }

            ext_person_web -> app_web_server "HTTP-запросы" "HTTPS, REST API"
            app_web_server -> app_ui "UI приложения" "HTTPS"
            app_web_server -> app_backend "Получение данных для UI" "REST API"
        }

        // DEV
        !ref "DeploymentNode://Development/FirstVDS/WEB-SERVER" {
            containerInstance db_kalkpro {
                description "db: db_devkalkproru (MariaDB 10.11.4)"
            }

            containerInstance fs_static {
                description "Файловая директория с правами только на чтение, 20Gb (Debian 11, ext4)"
            }

            containerInstance app_backend {
                description "Бэкенд приложение (PHP 7.3.33)"
            }

            containerInstance app_ui {
                description "Фронтенд приложения (HTML, ReactJS, PHP 7.3.33)"
            }

            containerInstance app_web_server {
                description "Веб-сервер (nginx/1.22.1 + php-fpm)"
            }
        }


        // Stage
        !ref "DeploymentNode://Stage/FirstVDS/WEB-SERVER" {
            containerInstance db_kalkpro {
                description "db: db_kalkproru (MariaDB 10.11.4)"
            }

            containerInstance fs_static {
                description "Файловая директория с правами только на чтение, 20Gb (Debian 11, ext4)"
            }

            containerInstance app_backend {
                description "Бэкенд приложение (PHP 7.3.33)"
            }

            containerInstance app_ui {
                description "Фронтенд приложения (HTML, ReactJS, PHP 7.3.33)"
            }

            containerInstance app_web_server {
                description "Веб-сервер (nginx/1.22.1 + php-fpm)"
            }
        }

        // Production
        !ref "DeploymentNode://Production/FirstVDS/WEB-SERVER" {
            containerInstance db_kalkpro {
                description "db: db_kalkpro (MariaDB 10.11.4)"
            }

            containerInstance fs_static {
                description "Файловая директория с правами только на чтение, 20Gb (Debian 11, ext4)"
            }

            containerInstance app_backend {
                description "Бэкенд приложение (PHP 7.3.33)"
            }

            containerInstance app_ui {
                description "Фронтенд приложения (HTML, ReactJS, PHP 7.3.33)"
            }

            containerInstance app_web_server {
                description "Веб-сервер (nginx/1.22.1 + php-fpm)"
            }
        }
    }

    views {
        systemContext system_web_site WEB_SITE_C4L1 "Сайт KALK.PRO - Контекстная диаграмма" {
            autoLayout
            include ->system_web_site->
        }
        container system_web_site WEB_SITE_C4L2 "Сайт KALK.PRO - Контейнеры" {
            autoLayout
            include *
        }
        deployment system_web_site Development WEB_SITE_DEPLOY_DEVELOPMENT "Сайт KALK.PRO - Схема развертывания в dev окружении" {
            autoLayout
            include *
            exclude "element.tag==Software System"
            exclude "element.tag==Infrastructure Node"
        }
        deployment system_web_site Stage WEB_SITE_DEPLOY_STAGE "Сайт KALK.PRO - Схема развертывания в stage окружении" {
            autoLayout
            include *
            exclude "element.tag==Software System"
            exclude "element.tag==Infrastructure Node"
        }
        deployment system_web_site Production WEB_SITE_DEPLOY_PROD "Сайт KALK.PRO - Схема развертывания в production окружении" {
            autoLayout
            include *
            exclude "element.tag==Software System"
            exclude "element.tag==Infrastructure Node"
        }
    }
}