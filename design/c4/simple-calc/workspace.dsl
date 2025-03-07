workspace extends ../system-landscape.dsl {
    model {
        !ref system_simple_calc {
            db_ctrl_panel = container "БД db_sinode" {
                description "База данных панели управления"
                technology "MySQL"
                tags "storage"
            }

            app_web_server = container "Веб-сервер" {
                url "https://sinode-1.kalk.pro"
                technology "nginx/1.22.1 + php-fpm"
            }

            app_ctrl_panel = container "Панель управления калькуляторами" {
                technology "php 7.4, WordPress, CFF Plugin"
                description "Панель управления для создания калькуляторов на базе WP plugin Calculated Fields Form."
            }

            app_calcs_pull = container "Готовые сборки калькуляторов" {
                technology "php 7.4, web-sockets"
                description "Контроллер сборки калькуляторов на JS для передачи их в бинарном виде через сокет на основной сайт KALK.PRO"
            }

            app_ctrl_panel -> app_calcs_pull "Периодически выгружает бинарные сборки калькуляторов в публичную директорию на сайте" "FS"
        }

        app_ctrl_panel -> db_ctrl_panel "Исходный код и конфигурации калькуляторов" ""
        system_web_site -> app_web_server "Получить код калькулятора" "web-sockets"
        app_web_server -> app_calcs_pull "Запрашиавет код для отображения калькуляторов на стороне клиента" "web-sockets"

        // Production
        !ref "DeploymentNode://Production/FirstVDS/SINODE-1" {
            containerInstance app_calcs_pull {
                description "Контроллер сборки калькуляторов на JS"
            }

            containerInstance app_ctrl_panel {
                description "WordPress + CFF Plugin"
            }

            containerInstance app_web_server {
                description "Веб-сервер (nginx/1.18 + php-fpm)"
            }

            containerInstance db_ctrl_panel {
                description "db: db_sinode (MariaDB 10.5.26)"
            }
        }
    }

    views {
        systemContext system_simple_calc SIMPLE_CALC_C4L1 "Простые калькуляторы - Контекстная диаграмма" {
            autoLayout
            include ->system_simple_calc->
        }
        container system_simple_calc SIMPLE_CALC_C4L2 "Простые калькуляторы" {
            autoLayout
            include *
        }
        deployment system_simple_calc Production SIMPLE_CALC_DEPLOY_PROD "Простые калькуляторы" {
            autoLayout
            include *
            exclude "element.tag==Software System"
            exclude "element.tag==Infrastructure Node"
        }
    }
}