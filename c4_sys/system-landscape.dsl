workspace system-landscape "Ландшафт Онлайн-сервиса" {
    !identifiers hierarchical
    model {
        // external
        ext_person_web = person "Пользователь (посетитель сайта)" {
            tags "external"
        }

        ext_person_admin = person "Администратор сайта" {
            tags "external"
        }

        ext_smpt = softwareSystem "Yandex SMTP" {
            tags "external"
        }

        // Internal
        system_web_site = softwareSystem "Онлайн-сервис автоматизации строительных расчетов" {
            description "KALK.PRO"
        }

        system_node_calc = softwareSystem "Кластер проектных расчетов" {
            description "Расчет проектов (чертежи, 3D модель, характеристики конструкций)"
        }

        system_simple_calc = softwareSystem "Сервис простых расчетов" {
            description "Расчет типовых строительных конструкций"
        }

        system_metal_calc = softwareSystem "Сервис расчета металлопроката" {
            description "Расчет изделий из металлопроката. Справочник ГОСТов по металлопрокату."
        }

        system_optistair_calc = softwareSystem "Сервис подбора оптимальной конфигурации лестницы" {
            description "Сервис подбора оптимальной конфигурации лестницы"
        }

        system_static_storage = softwareSystem "Сервис публикации файлов статики" {
            description "Сервис публикации файлов статики на защищенном сервере"
        }

        ext_person_web -> system_web_site "Работа с веб-интерфейсом (расчеты, проекты)" "HTTPS" ""
        ext_person_admin -> system_web_site "Управление структруой и данными на сайте" "HTTPS" ""

        system_web_site -> system_node_calc "Получение проекта с чертежами и 3D" "WEB-SOCKETS" "L1"
        system_web_site -> system_simple_calc "Расчет типовых строительных расчетов" "WEB-SOCKETS" "L1"
        system_web_site -> system_metal_calc "Расчет металлопроката" "iFrame" "L1"
        system_web_site -> system_static_storage "Размещение файлов статики" "HTTP" "L1"

        system_web_site -> system_optistair_calc "Размещение запроса на расчёт. Получение расчёта." "REST API" "L1,tagFrontReq"
        system_web_site -> system_optistair_calc "Установить параметры доступа пользователя к расчётам." "REST API" "L1,tagBackReq"
//        system_web_site -> system_optistair_calc "Frontend. Получить статус запроса GET: /request-status" "REST API" "L1"
//        system_web_site -> system_optistair_calc "Frontend. Установаить статус запроса 'send' PATCH: /request-status" "REST API" "L1"
//        system_web_site -> system_optistair_calc "Frontend. Создать запрос на подбор конфигураций Прямой лестницы POST: /straight-stair" "REST API" "L1"
//        system_web_site -> system_optistair_calc "Frontend. Создать запрос на подбор конфигураций Г-образ. лестницы POST: /l-shape-stair" "REST API" "L1"
//        system_web_site -> system_optistair_calc "Frontend. Создать запрос на подбор конфигураций П-образ. лестницы POST: /u-shape-stair" "REST API" "L1"
//        system_web_site -> system_optistair_calc "Backend. Установить параметры доступа пользователю POST: /user-acl" "REST API" "L1"
//        system_web_site -> system_optistair_calc "Backend. Обновить параметры доступа пользователя PATCH: /user-acl" "REST API" "L1"

        system_web_site -> ext_smpt "Отправка e-mail уведомлений через внешний шлюз" "SMTP"

        deploymentEnvironment Development {
            !include ./infrastructure.dsl
        }
        deploymentEnvironment Stage {
            !include ./infrastructure.dsl
        }
        deploymentEnvironment Production {
            !include ./infrastructure.dsl
        }
    }
    views {
        styles {
            element "Element" {
                background #1168bd
                shape RoundedBox
                color #ffffff
            }
            element "Software System" {
                background #1168bd
            }
            element "external" {
                background #cccccc
            }
            element "web" {
                shape WebBrowser
            }
            element "storage" {
                shape Cylinder
                background #85bbf0
            }
            element "queue" {
                shape Pipe
                background #85bbf0
            }
            element "folder" {
                shape Folder
                background #85bbf0
            }
            element "proxy" {
                background #85bbf0
            }
            element "infrastructure" {
                background #ffffff
                color #999999
            }
            element "obsolete" {
                background #f085bb
                color #ffffff
            }
            element "tagArchDebt" {
                background #f035bb
                color #ffffff
            }
            element "tagStorageDev" {
                background #a5abd0
                shape Cylinder
                color #ffffff
            }
            element "Container" {
                background #438dd5
                color #ffffff
            }
            element "Component" {
                background #85bbf0
                color #000000
            }
            element "Person" {
                background #08427b
                color #ffffff
                shape Person
            }


            relationship "tagArchDebt" {
                color #f035bb
            }
            relationship "tagToBe" {
                color #198f31
            }
            relationship "tagFrontReq" {
                color #059e05
            }
            relationship "tagBackReq" {
                color #0d38ea
            }

            // element "Deployment Node" {
            //     metadata false
            //     fontSize 40
            // }
            // Boundary: all enterprise/software system/container boundaries
            element "Boundary" {
                metadata true
                fontSize 40
                description true
            }
            // Boundary:Enterprise: the enterprise boundary only
            // Boundary:SoftwareSystem: all software system boundaries
            // Boundary:Container: all container boundaries
            // Group: all groups
            element "Group" {
                metadata true
                description true
                fontSize 32
                color #2e3a50
            }
            // Group:Name: the named group only
        }
    }
}
