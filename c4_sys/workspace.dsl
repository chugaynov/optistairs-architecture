workspace extends ./system-landscape.dsl {
    model {
        !ref "DeploymentNode://Production/FirstVDS/WEB-SERVER" {
            softwareSystemInstance system_web_site {
                url "https://kalk.pro"
                description "Веб-сайт онлайн-сервиса автоматизации строительных расчетов"
            }
        }
    }
    views {
        systemLandscape systemLandscape "Программные системы онлайн-сервиса KALK.PRO" {
            autoLayout
            include *
        }
        // deployment * Production deploymentLandscapeProduction "Продуктовые развертывания программных систем" {
        //     include *
        //     exclude "* -> *"
        // }
        // deployment * Production deploymentLandscapeInfra "Развертывания инфраструктурных компонентов" {
        //     autoLayout
        //     include element.tag==tagDeploymentInfrastructure
        // }
    }
}
