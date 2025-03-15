workspace extends ../system-landscape.dsl {
    model {
        !ref system_optistair_calc {
            !adrs adrs

            db_optistairs = container "postgres-optistairs" {
                description "База данных с рассчитанными конфигурациями"
                technology "PostgreSQL"
                tags storage
            }

            topic_request_straight_stair = container "Топик request.straight_stair" {
                technology "Kafka"
                description "Запросы на расчет конфигураций Прямой лестницы"
                tags queue,tagToBe
            }

            topic_request_l_shape_stair = container "Топик request.l_shape_stair" {
                technology "Kafka"
                description "Запросы на расчет конфигураций Г-образной лестницы"
                tags queue,tagToBe
            }

            topic_request_u_shape_stair = container "Топик request.u_shape_stair" {
                technology "Kafka"
                description "Запросы на расчет конфигураций П-образной лестницы"
                tags queue,tagToBe
            }

            topic_response = container "Топик response" {
                technology "Kafka"
                description "Результаты расчётов оптимальных конфигураций"
                tags queue,tagToBe
            }

            app_balancer = container "Балансировщик" {
                url "https://optistair.kalk.pro"
                technology "Ingress nginx"
            }

            app_request_manager = container "Менеджер обработки запросов" {
                technology "Python"
                description ""
                -> db_optistairs "Создание запросов на расчет. Получение статуса запроса. Запись и чтение результатов расчета." "pgsql" "tagRead, tagWrite"
                -> topic_request_straight_stair "W: Размещение запроса на расчёт Прямой лестницы" "Kafka" "queue,tagWrite,tagToBe"
                -> topic_request_l_shape_stair "W: Размещение запроса на расчёт Г-образной лестницы" "Kafka" "queue,tagWrite,tagToBe"
                -> topic_request_u_shape_stair "W: Размещение запроса на расчёт П-образной лестницы" "Kafka" "queue,tagWrite,tagToBe"
                -> topic_response "R: Получение результатов расчёта" "Kafka" "queue,tagRead,tagToBe"
            }

            app_straight_stair_calc = container "Калькулятор: Прямая лестница" {
                technology "Python"
                description "Подбор оптимальной конфигурации лестницы по заданным параметрам проема"
                -> app_request_manager "Передать результат расчёта. POST: /result" "REST API" ""
                -> app_request_manager "Уведомить о прогрессе расчета. POST: /progress" "REST API" ""
                -> topic_request_straight_stair "R: Получение запроса на расчёт Прямой лестницы" "Kafka" "queue,tagRead,tagToBe"
                -> topic_response "W: Размещение результата расчёта" "Kafka" "queue,tagWrite,tagToBe"
            }

            app_l_shape_stair_calc = container "Калькулятор: Г-образная лестница" {
                technology "Python"
                description "Подбор оптимальной конфигурации лестницы по заданным параметрам проема"
                -> app_request_manager "Передать результат расчёта. POST: /result" "REST API" ""
                -> app_request_manager "Уведомить о прогрессе расчета. POST: /progress" "REST API" ""
                -> topic_request_l_shape_stair "R: Получение запроса на расчёт Г-образной лестницы" "Kafka" "queue,tagRead,tagToBe"
                -> topic_response "W: Размещение результата расчёта" "Kafka" "queue,tagWrite,tagToBe"
            }

            app_u_shape_stair_calc = container "Калькулятор: П-образная лестница" {
                technology "Python"
                description "Подбор оптимальной конфигурации лестницы по заданным параметрам проема"
                -> app_request_manager "Передать результат расчёта. POST: /result" "REST API" ""
                -> app_request_manager "Уведомить о прогрессе расчета. POST: /progress" "REST API" ""
                -> topic_request_u_shape_stair "R: Получение запроса на расчёт П-образной лестницы" "Kafka" "queue,tagRead,tagToBe"
                -> topic_response "W: Размещение результата расчёта" "Kafka" "queue,tagWrite,tagToBe"
            }

            app_balancer -> app_request_manager "Получить статус запроса на расчёт. GET (public): /api/request-status" "REST API" ""
            app_balancer -> app_request_manager "Разместить запрос на расчёт Прямой лестницы. POST (public): /api/straight-stair" "REST API" ""
            app_balancer -> app_request_manager "Разместить запрос на расчёт Г-образной лестницы. POST (public): /api/l-shape-stair" "REST API" ""
            app_balancer -> app_request_manager "Разместить запрос на расчёт П-образной лестницы. POST (public): /api/u-shape-stair" "REST API" ""
            app_balancer -> app_request_manager "Установить ограничения пользователя. POST (public secured): /api/user-acl" "REST API" ""

            app_request_manager -> app_straight_stair_calc "Запросить выполнить расчет Прямой лестницы. POST: /straight-stair/calculation" "REST API" "tagArchDebt"
            app_request_manager -> app_l_shape_stair_calc "Запросить выполнить расчет Г-образной лестницы. POST: /l-shape-stair/calculation" "REST API" "tagArchDebt"
            app_request_manager -> app_u_shape_stair_calc "Запросить выполнить расчет П-образной лестницы. POST: /u-shape-stair/calculation" "REST API" "tagArchDebt"
        }

        // Dev
        !ref "DeploymentNode://Development/CloRu/kalkpro_project/Кластер kalkpro-k8s/dev/balancer" {
            containerInstance app_balancer {
                description "K8s Ingress nginx\nreplicas: X1"
                properties {
                    "replicas" "1"
                }
            }
        }

        !ref "DeploymentNode://Development/CloRu/kalkpro_project/Кластер kalkpro-k8s/dev/pgsql" {
            technology "postgres 17 operator 500Mi"
            containerInstance db_optistairs {
                description "db: optistairs\nreplicas: X1"
                properties {
                    "replicas" "1"
                }
            }
        }


        !ref "DeploymentNode://Development/CloRu/kalkpro_project/Кластер kalkpro-k8s/dev/optistair-calc" {
            containerInstance app_request_manager {
                description "replicas: X1"
                properties {
                    "replicas" "1"
                }
            }
            containerInstance app_straight_stair_calc {
                description "replicas: X1"
                properties {
                    "replicas" "1"
                }
            }
            containerInstance app_l_shape_stair_calc {
                description "replicas: X1"
                properties {
                    "replicas" "1"
                }
            }
            containerInstance app_u_shape_stair_calc {
                description "replicas: X1"
                properties {
                    "replicas" "1"
                }
            }

            containerInstance topic_request_straight_stair
            containerInstance topic_request_l_shape_stair
            containerInstance topic_request_u_shape_stair
            containerInstance topic_response
        }

        // Production
        !ref "DeploymentNode://Production/CloRu/kalkpro_project/Кластер kalkpro-k8s/infrastructure/balancer" {
            containerInstance app_balancer {
                description "K8s Ingress nginx\nreplicas: X2"
                properties {
                    "replicas" "2"
                }
            }
        }

        !ref "DeploymentNode://Production/CloRu/kalkpro_project/Кластер kalkpro-k8s/infrastructure/pgsql" {
            technology "postgres 17 operator 500Mi"
            containerInstance db_optistairs {
                description "db: optistairs\nreplicas: X2"
                properties {
                    "replicas" "2"
                }
            }
        }

        !ref "DeploymentNode://Production/CloRu/kalkpro_project/Кластер kalkpro-k8s/infrastructure/kafka" {
            containerInstance topic_request_straight_stair
            containerInstance topic_request_l_shape_stair
            containerInstance topic_request_u_shape_stair
            containerInstance topic_response
        }

        !ref "DeploymentNode://Production/CloRu/kalkpro_project/Кластер kalkpro-k8s/optistair-calc" {
            containerInstance app_request_manager {
                description "replicas: X2"
                properties {
                    "replicas" "2"
                }
            }
            containerInstance app_straight_stair_calc {
                description "replicas: X2"
                properties {
                    "replicas" "2"
                }
            }
            containerInstance app_l_shape_stair_calc {
                description "replicas: X2"
                properties {
                    "replicas" "2"
                }
            }
            containerInstance app_u_shape_stair_calc {
                description "replicas: X2"
                properties {
                    "replicas" "2"
                }
            }
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
        deployment system_optistair_calc Development OPTISTAIR_CALC_DEPLOY_DEV "Подбор оптимальной конф. лестницы" {
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