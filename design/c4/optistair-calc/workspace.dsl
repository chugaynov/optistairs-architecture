workspace extends ../system-landscape.dsl {
    model {
        !ref system_optistair_calc {
            app_balancer = container "Балансировщик" {
                url "https://optistair.kalk.pro"
                technology "Ingress nginx"
            }

            app_request_manager = container "Менеджер обработки запросов" {
                technology "Python"
                description ""
            }

            app_straight_stair_calc = container "Калькулятор: Прямая лестница" {
                technology "Python"
                description "Подбор оптимальной конфигурации лестницы по заданным параметрам проема"
            }

            app_l_shape_stair_calc = container "Калькулятор: Г-образная лестница" {
                technology "Python"
                description "Подбор оптимальной конфигурации лестницы по заданным параметрам проема"
            }

            app_u_shape_stair_calc = container "Калькулятор: П-образная лестница" {
                technology "Python"
                description "Подбор оптимальной конфигурации лестницы по заданным параметрам проема"
            }

            db_optistairs = container "postgres-optistairs" {
                description "База данных с рассчитанными конфигурациями"
                technology "PostgreSQL"
                tags storage
            }

            app_balancer -> app_request_manager "Маршрутизация запросов с внешнего IP" "HTTP" "tagRead, tagWrite"
            app_request_manager -> db_optistairs "Создание запросов на расчет. Получение статуса запроса." "pgsql" "tagRead, tagWrite"
            app_straight_stair_calc -> db_optistairs "Получение параметров расчёта и запись подобранных конфигураций" "pgsql" "tagRead, tagWrite"
            app_l_shape_stair_calc -> db_optistairs "Получение параметров расчёта и запись подобранных конфигураций" "pgsql" "tagRead, tagWrite"
            app_u_shape_stair_calc -> db_optistairs "Получение параметров расчёта и запись подобранных конфигураций" "pgsql" "tagRead, tagWrite"
        }

        // Dev
        !ref "DeploymentNode://Development/CloRu/kalkpro_project/Кластер kalkpro-k8s/infrastructure/balancer" {
            containerInstance app_balancer {
                description "K8s Ingress nginx"
            }
        }

        !ref "DeploymentNode://Development/CloRu/kalkpro_project/Кластер kalkpro-k8s/infrastructure/pgsql" {
            technology "postgres 17 operator 500Mi"
            containerInstance db_optistairs {
                description "optistairs"
            }
        }


        !ref "DeploymentNode://Development/CloRu/kalkpro_project/Кластер kalkpro-k8s/optistair-calc-dev" {
            containerInstance app_request_manager
            containerInstance app_straight_stair_calc
            containerInstance app_l_shape_stair_calc
            containerInstance app_u_shape_stair_calc
        }

        // Production
        !ref "DeploymentNode://Production/CloRu/kalkpro_project/Кластер kalkpro-k8s/infrastructure/balancer" {
            containerInstance app_balancer {
                description "K8s Ingress nginx"
            }
        }

        !ref "DeploymentNode://Production/CloRu/kalkpro_project/Кластер kalkpro-k8s/infrastructure/pgsql" {
            technology "postgres 17 operator 500Mi"
            containerInstance db_optistairs {
                description "optistairs"
            }
        }

        !ref "DeploymentNode://Production/CloRu/kalkpro_project/Кластер kalkpro-k8s/optistair-calc" {
            containerInstance app_request_manager
            containerInstance app_straight_stair_calc
            containerInstance app_l_shape_stair_calc
            containerInstance app_u_shape_stair_calc
        }
    }

    views {
        systemContext system_optistair_calc OPTISTAIR_CALC_C4L1 "Подбор оптимальной конф. лестницы - Контекстная диаграмма" {
            autoLayout
            include ->system_optistair_calc->
        }
        container system_optistair_calc OPTISTAIR_CALC_C4L2 "Подбор оптимальной конф. лестницы" {
            autoLayout
            include *
        }
        deployment system_optistair_calc Production OPTISTAIR_CALC_DEPLOY_DEV "Подбор оптимальной конф. лестницы" {
            autoLayout
            include *
            exclude "element.tag==Software System"
            exclude "element.tag==Infrastructure Node"
        }
        deployment system_optistair_calc Production OPTISTAIR_CALC_DEPLOY_PROD "Подбор оптимальной конф. лестницы" {
            autoLayout
            include *
            exclude "element.tag==Software System"
            exclude "element.tag==Infrastructure Node"
        }
    }
}