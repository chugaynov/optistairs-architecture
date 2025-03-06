workspace extends ../system-landscape.dsl {
    model {
        !ref system_metal_calc {
            db_web_site = container "БД db_metalcalcru" {
                description "База данных сайта"
                technology "MySQL"
                tags "storage"
            }

            app_web_server = container "Веб-сервер" {
                url "https://met-calc.ru/"
                technology "nginx/1.22.1 + php-fpm"
            }

            app_web_site = container "Сайт-справочник по металлопрокату" {
                technology "php 7.4, UMI.CMS, ReactJS"
                description "Панель управления номенклатурным каталогом характеристик металлопроката"
            }
        }

        app_web_site -> db_web_site "Номенклатра металлопроката с характеристиками. Контент сайта." ""
        app_web_server -> app_web_site "" "HTTPS"
        system_web_site -> app_web_server "HTML iFrame" "HTTPS"
        ext_person_web -> app_web_server "Посещение сайта" "HTTPS"

        // Production
        !ref "DeploymentNode://Production/FirstVDS/SINODE-1" {
            containerInstance app_web_site {
                description "UMI.CMS + ReactJS"
            }

            containerInstance app_web_server {
                description "Веб-сервер (nginx/1.18 + php-fpm)"
            }

            containerInstance db_web_site {
                description "db: db_metalcalcru (MariaDB 10.5.26)"
            }
        }
    }

    views {
        systemContext system_metal_calc METAL_CALC_C4L1 "Калькуляторы металлопроката - Контекстная диаграмма" {
            autoLayout
            include ->system_metal_calc->
        }
        container system_metal_calc METAL_CALC_C4L2 "Калькуляторы металлопроката" {
            autoLayout
            include *
        }
        deployment system_metal_calc Production METAL_CALC_DEPLOY_PROD "Калькуляторы металлопроката" {
            autoLayout
            include *
            exclude "element.tag==Software System"
            exclude "element.tag==Infrastructure Node"
        }
    }
}