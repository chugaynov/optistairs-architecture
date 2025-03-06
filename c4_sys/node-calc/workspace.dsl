workspace extends ../system-landscape.dsl {
    model {
        !ref system_node_calc {
            description "Кластер сервисов, обеспечивающих расчет проектов, 3D и чертежи"

            app_web_server = container "Веб-сервер" {
                url "https://node-x.kalk.pro/"
                technology "nginx/1.22.1"
            }

            group "Калькуляторы" {
                app_calc_angle180Saddle2XV2 = container "П-обр. лестница (2 марша)" {
                    technology "NodeJS, сервис-калькулятор"
                    description ""
                }


                app_calc_angle180Saddle3XV2 = container "П-обр. лестница (3 марша)" {
                    technology "NodeJS, сервис-калькулятор"
                    description ""
                }

                app_calc_angle180SaddleWinder4Steps = container "П-обр. лестница (4 забеж. ступ.)" {
                    technology "NodeJS, сервис-калькулятор"
                    description ""
                }

                app_calc_angle180SaddleWinder8Steps = container "П-обр. лестница (8 забеж. ступ.)" {
                    technology "NodeJS, сервис-калькулятор"
                    description ""
                }

                app_calc_angle180SaddleWinderAutoSteps = container "П-обр. лестница (N забеж. ступ.)" {
                    technology "NodeJS, сервис-калькулятор"
                    description ""
                }

                app_calc_angle180SaddleWinderSteps = container "П-обр. лестница (6 забеж. ступ.)" {
                    technology "NodeJS, сервис-калькулятор"
                    description ""
                }

                app_calc_angle90SaddleV2 = container "Г-обр. лестница (площадка)" {
                    technology "NodeJS, сервис-калькулятор"
                    description ""
                }

                app_calc_angle90SaddleWinder2Steps = container "Г-обр. лестница (2 забеж. ступ.)" {
                    technology "NodeJS, сервис-калькулятор"
                    description ""
                }

                app_calc_angle90SaddleWinder4Steps = container "Г-обр. лестница (4 забеж. ступ.)" {
                    technology "NodeJS, сервис-калькулятор"
                    description ""
                }

                app_calc_angle90SaddleWinderAutoSteps = container "Г-обр. лестница (N забеж. ступ.)" {
                    technology "NodeJS, сервис-калькулятор"
                    description ""
                }

                app_calc_angle90SaddleWinderSteps = container "Г-обр. лестница (3 забеж. ступ.)" {
                    technology "NodeJS, сервис-калькулятор"
                    description ""
                }

                app_calc_closedStringer_straightSaddle = container "Прямая лестница на тетивах" {
                    technology "NodeJS, сервис-калькулятор"
                    description ""
                }

                app_calc_concreteBase_straightSaddle = container "Прямая бетонная лестница" {
                    technology "NodeJS, сервис-калькулятор"
                    description ""
                }

                app_calc_gableRoof = container "Двухскатная крыша" {
                    technology "NodeJS, сервис-калькулятор"
                    description ""
                }

                app_calc_gableRoofRafters = container "Стропила двухскатной крыши" {
                    technology "NodeJS, сервис-калькулятор"
                    description ""
                }

                app_calc_hipRoofAdjustSlope = container "Вальмовая крыша с изменяемой длиной конька" {
                    technology "NodeJS, сервис-калькулятор"
                    description ""
                }

                app_calc_hipRoof = container "Вальмовая крыша с одинаковым углом скатов" {
                    technology "NodeJS, сервис-калькулятор"
                    description ""
                }

                app_calc_metalZigzag_angle180Saddle2XV2 = container "П-обр. лестница (2 марша) на метал. косоурах" {
                    technology "NodeJS, сервис-калькулятор"
                    description ""
                }

                app_calc_metalZigzag_angle180Saddle3XV2 = container "П-обр. лестница (3 марша) на метал. косоурах" {
                    technology "NodeJS, сервис-калькулятор"
                    description ""
                }

                app_calc_metalZigzag_angle180SaddleWinder4Steps = container "П-обр. лестница (4 забеж. ступ.) на метал. косоурах" {
                    technology "NodeJS, сервис-калькулятор"
                    description ""
                }

                app_calc_metalZigzag_angle180SaddleWinder8Steps = container "П-обр. лестница (8 забеж. ступ.) на метал. косоурах" {
                    technology "NodeJS, сервис-калькулятор"
                    description ""
                }

                app_calc_metalZigzag_angle180SaddleWinderAutoSteps = container "П-обр. лестница (N забеж. ступ.) на метал. косоурах" {
                    technology "NodeJS, сервис-калькулятор"
                    description ""
                }

                app_calc_metalZigzag_angle180SaddleWinderSteps = container "П-обр. лестница (6 забеж. ступ.) на метал. косоурах" {
                    technology "NodeJS, сервис-калькулятор"
                    description ""
                }

                app_calc_metalZigzag_angle90SaddleV2 = container "Г-обр. лестница (с площадкой) на метал. косоурах" {
                    technology "NodeJS, сервис-калькулятор"
                    description ""
                }

                app_calc_metalZigzag_angle90SaddleWinder2Steps = container "Г-обр. лестница (2 забеж. ступ.) на метал. косоурах" {
                    technology "NodeJS, сервис-калькулятор"
                    description ""
                }

                app_calc_metalZigzag_angle90SaddleWinder3Steps = container "Г-обр. лестница (3 забеж. ступ.) на метал. косоурах" {
                    technology "NodeJS, сервис-калькулятор"
                    description ""
                }

                app_calc_metalZigzag_angle90SaddleWinder4Steps = container "Г-обр. лестница (4 забеж. ступ.) на метал. косоурах" {
                    technology "NodeJS, сервис-калькулятор"
                    description ""
                }

                app_calc_metalZigzag_angle90SaddleWinderAutoSteps = container "Г-обр. лестница (N забеж. ступ.) на метал. косоурах" {
                    technology "NodeJS, сервис-калькулятор"
                    description ""
                }

                app_calc_metalZigzag_straightSaddle = container "Прямая лестница на метал. косоурах" {
                    technology "NodeJS, сервис-калькулятор"
                    description ""
                }

                app_calc_pentRoof = container "Односкатная (плоская) крыша" {
                    technology "NodeJS, сервис-калькулятор"
                    description ""
                }

                app_calc_pentRoofRafters = container "Стропила односкатной (плоской) крыши" {
                    technology "NodeJS, сервис-калькулятор"
                    description ""
                }

                app_calc_pyramidHipRoof = container "Шатровая крыша" {
                    technology "NodeJS, сервис-калькулятор"
                    description ""
                }

                app_calc_staircaseSpiralConcrete = container "Винтовая бетонная лестница" {
                    technology "NodeJS, сервис-калькулятор"
                    description ""
                }

                app_calc_staircaseSpiralMetalOnPole = container "Винтовая метал. лестница на шесте" {
                    technology "NodeJS, сервис-калькулятор"
                    description ""
                }

                app_calc_staircaseSpiralOnHole = container "Винтовая лестница в пространстве" {
                    technology "NodeJS, сервис-калькулятор"
                    description ""
                }

                app_calc_staircaseSpiralOnPole = container "Винтовая дерев. лестница на шесте" {
                    technology "NodeJS, сервис-калькулятор"
                    description ""
                }

                app_calc_straightSaddle = container "Прямая лестница" {
                    technology "NodeJS, сервис-калькулятор"
                    description ""
                }

                app_calc_stripFoundation = container "Ленточный фундамент" {
                    technology "NodeJS, сервис-калькулятор"
                    description ""
                }

                app_calc_woodenRectangularGluedBoardsOverlapBeam = container "Деревянные прямоугольные клееные балки перекрытия" {
                    technology "NodeJS, сервис-калькулятор"
                    description ""
                }

                app_calc_woodenRectangularLvlOverlapBeam = container "Деревянные прямоугольные LVL балки перекрытия" {
                    technology "NodeJS, сервис-калькулятор"
                    description ""
                }

                app_calc_woodenRectangularSolidOverlapBeam = container "Деревянные прямоугольные цельные балки перекрытия" {
                    technology "NodeJS, сервис-калькулятор"
                    description ""
                }

                app_calc_woodenTrimmedCylinderOverlapBeam = container "Деревянные цилиндрические балки перекрытия" {
                    technology "NodeJS, сервис-калькулятор"
                    description ""
                }
            }

            group "Сервисы" {
                app_service_Email = container "Сервис отправки проектов по Email" {
                    technology "NodeJS, сервис"
                    description ""
                }

                app_service_File = container "Сервис формирования файлов с проектами" {
                    technology "NodeJS, сервис"
                    description ""
                }

                app_service_Versions = container "Сервис контроля версий калькуляторов" {
                    technology "NodeJS, сервис"
                    description ""
                }

                app_service_Monitoring = container "Сервис контроля доступности/жизнеспособности инстансов калькуляторов" {
                    technology "NodeJS, сервис"
                    description ""
                }
            }

            app_service_Router = container "Балансировщик запросов по инстансам калькуляторов" {
                technology "NodeJS, сервис"
                description ""
            }
        }

        app_service_Router -> app_calc_angle180Saddle2XV2 "Запрос на расчет к свободному инстансу" "web-sockets"
        app_service_Router -> app_calc_angle180Saddle3XV2 "Запрос на расчет к свободному инстансу" "web-sockets"
        app_service_Router -> app_calc_angle180SaddleWinder4Steps "Запрос на расчет к свободному инстансу" "web-sockets"
        app_service_Router -> app_calc_angle180SaddleWinder8Steps "Запрос на расчет к свободному инстансу" "web-sockets"
        app_service_Router -> app_calc_angle180SaddleWinderAutoSteps "Запрос на расчет к свободному инстансу" "web-sockets"
        app_service_Router -> app_calc_angle180SaddleWinderSteps "Запрос на расчет к свободному инстансу" "web-sockets"
        app_service_Router -> app_calc_angle90SaddleV2 "Запрос на расчет к свободному инстансу" "web-sockets"
        app_service_Router -> app_calc_angle90SaddleWinder2Steps "Запрос на расчет к свободному инстансу" "web-sockets"
        app_service_Router -> app_calc_angle90SaddleWinder4Steps "Запрос на расчет к свободному инстансу" "web-sockets"
        app_service_Router -> app_calc_angle90SaddleWinderAutoSteps "Запрос на расчет к свободному инстансу" "web-sockets"
        app_service_Router -> app_calc_angle90SaddleWinderSteps "Запрос на расчет к свободному инстансу" "web-sockets"
        app_service_Router -> app_calc_closedStringer_straightSaddle "Запрос на расчет к свободному инстансу" "web-sockets"
        app_service_Router -> app_calc_concreteBase_straightSaddle "Запрос на расчет к свободному инстансу" "web-sockets"
        app_service_Router -> app_calc_gableRoof "Запрос на расчет к свободному инстансу" "web-sockets"
        app_service_Router -> app_calc_gableRoofRafters "Запрос на расчет к свободному инстансу" "web-sockets"
        app_service_Router -> app_calc_hipRoofAdjustSlope "Запрос на расчет к свободному инстансу" "web-sockets"
        app_service_Router -> app_calc_hipRoof "Запрос на расчет к свободному инстансу" "web-sockets"
        app_service_Router -> app_calc_metalZigzag_angle180Saddle2XV2 "Запрос на расчет к свободному инстансу" "web-sockets"
        app_service_Router -> app_calc_metalZigzag_angle180Saddle3XV2 "Запрос на расчет к свободному инстансу" "web-sockets"
        app_service_Router -> app_calc_metalZigzag_angle180SaddleWinder4Steps "Запрос на расчет к свободному инстансу" "web-sockets"
        app_service_Router -> app_calc_metalZigzag_angle180SaddleWinder8Steps "Запрос на расчет к свободному инстансу" "web-sockets"
        app_service_Router -> app_calc_metalZigzag_angle180SaddleWinderAutoSteps "Запрос на расчет к свободному инстансу" "web-sockets"
        app_service_Router -> app_calc_metalZigzag_angle180SaddleWinderSteps "Запрос на расчет к свободному инстансу" "web-sockets"
        app_service_Router -> app_calc_metalZigzag_angle90SaddleV2 "Запрос на расчет к свободному инстансу" "web-sockets"
        app_service_Router -> app_calc_metalZigzag_angle90SaddleWinder2Steps "Запрос на расчет к свободному инстансу" "web-sockets"
        app_service_Router -> app_calc_metalZigzag_angle90SaddleWinder3Steps "Запрос на расчет к свободному инстансу" "web-sockets"
        app_service_Router -> app_calc_metalZigzag_angle90SaddleWinder4Steps "Запрос на расчет к свободному инстансу" "web-sockets"
        app_service_Router -> app_calc_metalZigzag_angle90SaddleWinderAutoSteps "Запрос на расчет к свободному инстансу" "web-sockets"
        app_service_Router -> app_calc_metalZigzag_straightSaddle "Запрос на расчет к свободному инстансу" "web-sockets"
        app_service_Router -> app_calc_pentRoof "Запрос на расчет к свободному инстансу" "web-sockets"
        app_service_Router -> app_calc_pentRoofRafters "Запрос на расчет к свободному инстансу" "web-sockets"
        app_service_Router -> app_calc_pyramidHipRoof "Запрос на расчет к свободному инстансу" "web-sockets"
        app_service_Router -> app_calc_staircaseSpiralConcrete "Запрос на расчет к свободному инстансу" "web-sockets"
        app_service_Router -> app_calc_staircaseSpiralMetalOnPole "Запрос на расчет к свободному инстансу" "web-sockets"
        app_service_Router -> app_calc_staircaseSpiralOnHole "Запрос на расчет к свободному инстансу" "web-sockets"
        app_service_Router -> app_calc_staircaseSpiralOnPole "Запрос на расчет к свободному инстансу" "web-sockets"
        app_service_Router -> app_calc_straightSaddle "Запрос на расчет к свободному инстансу" "web-sockets"
        app_service_Router -> app_calc_stripFoundation "Запрос на расчет к свободному инстансу" "web-sockets"
        app_service_Router -> app_calc_woodenRectangularGluedBoardsOverlapBeam "Запрос на расчет к свободному инстансу" "web-sockets"
        app_service_Router -> app_calc_woodenRectangularLvlOverlapBeam "Запрос на расчет к свободному инстансу" "web-sockets"
        app_service_Router -> app_calc_woodenRectangularSolidOverlapBeam "Запрос на расчет к свободному инстансу" "web-sockets"
        app_service_Router -> app_calc_woodenTrimmedCylinderOverlapBeam "Запрос на расчет к свободному инстансу" "web-sockets"

        app_calc_angle180Saddle2XV2 -> app_service_Router "Подготовка проекта в ServiceFile. Отправка проекта через Service Email. Контроль версий через ServiceVersion." "web-sockets"
        app_calc_angle180Saddle3XV2 -> app_service_Router "Подготовка проекта в ServiceFile. Отправка проекта через Service Email. Контроль версий через ServiceVersion." "web-sockets"
        app_calc_angle180SaddleWinder4Steps -> app_service_Router "Подготовка проекта в ServiceFile. Отправка проекта через Service Email. Контроль версий через ServiceVersion." "web-sockets"
        app_calc_angle180SaddleWinder8Steps -> app_service_Router "Подготовка проекта в ServiceFile. Отправка проекта через Service Email. Контроль версий через ServiceVersion." "web-sockets"
        app_calc_angle180SaddleWinderAutoSteps -> app_service_Router "Подготовка проекта в ServiceFile. Отправка проекта через Service Email. Контроль версий через ServiceVersion." "web-sockets"
        app_calc_angle180SaddleWinderSteps -> app_service_Router "Подготовка проекта в ServiceFile. Отправка проекта через Service Email. Контроль версий через ServiceVersion." "web-sockets"
        app_calc_angle90SaddleV2 -> app_service_Router "Подготовка проекта в ServiceFile. Отправка проекта через Service Email. Контроль версий через ServiceVersion." "web-sockets"
        app_calc_angle90SaddleWinder2Steps -> app_service_Router "Подготовка проекта в ServiceFile. Отправка проекта через Service Email. Контроль версий через ServiceVersion." "web-sockets"
        app_calc_angle90SaddleWinder4Steps -> app_service_Router "Подготовка проекта в ServiceFile. Отправка проекта через Service Email. Контроль версий через ServiceVersion." "web-sockets"
        app_calc_angle90SaddleWinderAutoSteps -> app_service_Router "Подготовка проекта в ServiceFile. Отправка проекта через Service Email. Контроль версий через ServiceVersion." "web-sockets"
        app_calc_angle90SaddleWinderSteps -> app_service_Router "Подготовка проекта в ServiceFile. Отправка проекта через Service Email. Контроль версий через ServiceVersion." "web-sockets"
        app_calc_closedStringer_straightSaddle -> app_service_Router "Подготовка проекта в ServiceFile. Отправка проекта через Service Email. Контроль версий через ServiceVersion." "web-sockets"
        app_calc_concreteBase_straightSaddle -> app_service_Router "Подготовка проекта в ServiceFile. Отправка проекта через Service Email. Контроль версий через ServiceVersion." "web-sockets"
        app_calc_gableRoof -> app_service_Router "Подготовка проекта в ServiceFile. Отправка проекта через Service Email. Контроль версий через ServiceVersion." "web-sockets"
        app_calc_gableRoofRafters -> app_service_Router "Подготовка проекта в ServiceFile. Отправка проекта через Service Email. Контроль версий через ServiceVersion." "web-sockets"
        app_calc_hipRoofAdjustSlope -> app_service_Router "Подготовка проекта в ServiceFile. Отправка проекта через Service Email. Контроль версий через ServiceVersion." "web-sockets"
        app_calc_hipRoof -> app_service_Router "Подготовка проекта в ServiceFile. Отправка проекта через Service Email. Контроль версий через ServiceVersion." "web-sockets"
        app_calc_metalZigzag_angle180Saddle2XV2 -> app_service_Router "Подготовка проекта в ServiceFile. Отправка проекта через Service Email. Контроль версий через ServiceVersion." "web-sockets"
        app_calc_metalZigzag_angle180Saddle3XV2 -> app_service_Router "Подготовка проекта в ServiceFile. Отправка проекта через Service Email. Контроль версий через ServiceVersion." "web-sockets"
        app_calc_metalZigzag_angle180SaddleWinder4Steps -> app_service_Router "Подготовка проекта в ServiceFile. Отправка проекта через Service Email. Контроль версий через ServiceVersion." "web-sockets"
        app_calc_metalZigzag_angle180SaddleWinder8Steps -> app_service_Router "Подготовка проекта в ServiceFile. Отправка проекта через Service Email. Контроль версий через ServiceVersion." "web-sockets"
        app_calc_metalZigzag_angle180SaddleWinderAutoSteps -> app_service_Router "Подготовка проекта в ServiceFile. Отправка проекта через Service Email. Контроль версий через ServiceVersion." "web-sockets"
        app_calc_metalZigzag_angle180SaddleWinderSteps -> app_service_Router "Подготовка проекта в ServiceFile. Отправка проекта через Service Email. Контроль версий через ServiceVersion." "web-sockets"
        app_calc_metalZigzag_angle90SaddleV2 -> app_service_Router "Подготовка проекта в ServiceFile. Отправка проекта через Service Email. Контроль версий через ServiceVersion." "web-sockets"
        app_calc_metalZigzag_angle90SaddleWinder2Steps -> app_service_Router "Подготовка проекта в ServiceFile. Отправка проекта через Service Email. Контроль версий через ServiceVersion." "web-sockets"
        app_calc_metalZigzag_angle90SaddleWinder3Steps -> app_service_Router "Подготовка проекта в ServiceFile. Отправка проекта через Service Email. Контроль версий через ServiceVersion." "web-sockets"
        app_calc_metalZigzag_angle90SaddleWinder4Steps -> app_service_Router "Подготовка проекта в ServiceFile. Отправка проекта через Service Email. Контроль версий через ServiceVersion." "web-sockets"
        app_calc_metalZigzag_angle90SaddleWinderAutoSteps -> app_service_Router "Подготовка проекта в ServiceFile. Отправка проекта через Service Email. Контроль версий через ServiceVersion." "web-sockets"
        app_calc_metalZigzag_straightSaddle -> app_service_Router "Подготовка проекта в ServiceFile. Отправка проекта через Service Email. Контроль версий через ServiceVersion." "web-sockets"
        app_calc_pentRoof -> app_service_Router "Подготовка проекта в ServiceFile. Отправка проекта через Service Email. Контроль версий через ServiceVersion." "web-sockets"
        app_calc_pentRoofRafters -> app_service_Router "Подготовка проекта в ServiceFile. Отправка проекта через Service Email. Контроль версий через ServiceVersion." "web-sockets"
        app_calc_pyramidHipRoof -> app_service_Router "Подготовка проекта в ServiceFile. Отправка проекта через Service Email. Контроль версий через ServiceVersion." "web-sockets"
        app_calc_staircaseSpiralConcrete -> app_service_Router "Подготовка проекта в ServiceFile. Отправка проекта через Service Email. Контроль версий через ServiceVersion." "web-sockets"
        app_calc_staircaseSpiralMetalOnPole -> app_service_Router "Подготовка проекта в ServiceFile. Отправка проекта через Service Email. Контроль версий через ServiceVersion." "web-sockets"
        app_calc_staircaseSpiralOnHole -> app_service_Router "Подготовка проекта в ServiceFile. Отправка проекта через Service Email. Контроль версий через ServiceVersion." "web-sockets"
        app_calc_staircaseSpiralOnPole -> app_service_Router "Подготовка проекта в ServiceFile. Отправка проекта через Service Email. Контроль версий через ServiceVersion." "web-sockets"
        app_calc_straightSaddle -> app_service_Router "Подготовка проекта в ServiceFile. Отправка проекта через Service Email. Контроль версий через ServiceVersion." "web-sockets"
        app_calc_stripFoundation -> app_service_Router "Подготовка проекта в ServiceFile. Отправка проекта через Service Email. Контроль версий через ServiceVersion." "web-sockets"
        app_calc_woodenRectangularGluedBoardsOverlapBeam -> app_service_Router "Подготовка проекта в ServiceFile. Отправка проекта через Service Email. Контроль версий через ServiceVersion." "web-sockets"
        app_calc_woodenRectangularLvlOverlapBeam -> app_service_Router "Подготовка проекта в ServiceFile. Отправка проекта через Service Email. Контроль версий через ServiceVersion." "web-sockets"
        app_calc_woodenRectangularSolidOverlapBeam -> app_service_Router "Подготовка проекта в ServiceFile. Отправка проекта через Service Email. Контроль версий через ServiceVersion." "web-sockets"
        app_calc_woodenTrimmedCylinderOverlapBeam -> app_service_Router "Подготовка проекта в ServiceFile. Отправка проекта через Service Email. Контроль версий через ServiceVersion." "web-sockets"

        app_service_Router -> app_service_Email "Запрос на расчет к свободному инстансу" "web-sockets"
        app_service_Router -> app_service_File "Запрос на расчет к свободному инстансу" "web-sockets"
        app_service_Router -> app_service_Versions "Запрос на расчет к свободному инстансу" "web-sockets"

        app_service_Monitoring -> app_service_Router "Опрос всех приложений service-alive. Отправка уведомлений о сбоях через app_service_Email" "web-sockets"

        app_service_Versions -> system_web_site "Актуальная версия калькулятора и слепок дефолтного проекта" "REST"
        system_web_site -> app_web_server "Запрос на расчет проекта" "web-socket"
        app_web_server -> app_service_Router "Запрос на расчет проекта" "web-socket"

        // Production
        !ref "DeploymentNode://Production/FirstVDS/NODE-1" {
            !include ./calcs-deployment.dsl
            !include ./services-deployment.dsl
        }

        // Dev
        !ref "DeploymentNode://Development/FirstVDS/NODE-2" {
            !include ./calcs-deployment.dsl
            !include ./services-deployment.dsl
        }
    }

    views {
        systemContext system_node_calc NODE_CALC_C4L1 "Сервисы калькуляторов - Контекстная диаграмма" {
            autoLayout lr
            include ->system_node_calc->
        }
        container system_node_calc NODE_CALC_C4L2 "Сервисы калькуляторов" {
            autoLayout lr
            include *
        }
        deployment system_node_calc Development NODE_CALC_DEPLOY_DEV "Сервисы калькуляторов" {
            autoLayout lr
            include *
            exclude "element.tag==Software System"
            exclude "element.tag==Infrastructure Node"
        }
        deployment system_node_calc Production NODE_CALC_DEPLOY_PROD "Сервисы калькуляторов" {
            autoLayout lr
            include *
            exclude "element.tag==Software System"
            exclude "element.tag==Infrastructure Node"
        }
    }
}