
deploymentNode "FirstVDS" {
    deploymentNode "WEB-SERVER" {
        description "Веб-сайт основного онлайн-сервиса (IP: 91.107.126.103)"
        technology "VPS KVM"
    }
    deploymentNode "STATIC-STORAGE" {
        description "Хранилище статических файлов (IP: 62.109.15.25)"
        technology "VPS KVM"
    }
    deploymentNode "NODE-1" {
        description "Сервер проектных расчетов PROD (IP: 212.109.221.247)"
        technology "VPS KVM"
    }
    deploymentNode "NODE-2" {
        description "Сервер проектных расчетов DEV/STAGE (IP: 188.120.254.218)"
        technology "VPS KVM"
    }
    deploymentNode "SINODE-1" {
        description "Сервер простых расчетов DEV/STAGE/PROD (IP: 83.220.170.100)"
        technology "VPS KVM"
    }
}

// TODO: technology "k8s namespace"
deploymentNode "CloRu" {
    deploymentNode "kalkpro_project" {
        description "Кластер для расчета оптимальных конфигураций лестниц. URL https://optistair(-dev).kalk.rpo"
        technology "VPC"
        deploymentNode "Кластер kalkpro-k8s" {
            technology "kubernetes"

            deploymentNode "infrastructure" {
                technology "k8s namespace"
                infrastructureNode "Cert-Manager" {
                    technology "Cert manager"
                    description "Получение и обновление сертификатов"
                    tags "tagDeploymentInfrastructure,l1"
                }
                deploymentNode "balancer" {
                    technology "Ingregress Nginx"
                    description "Получение и обновление сертификатов"
                    tags "tagDeploymentInfrastructure,l1"
                }
                deploymentNode "pgsql" {
                    technology "PostgreSQL operator"
                }
            }
            deploymentNode "optistair-calc" {
                technology "k8s namespace"
            }
            deploymentNode "optistair-calc-dev" {
                technology "k8s namespace"
            }
        }
    }
}