# Overview of local Kubernetes variants for AsciiArtify


## Intro to Kubernetes

Kubernetes supports various deployment scenario including **"local deployments"**, where complete cluster runs on single machine.
This document provides overview for 3 local Kubernetes solutions - **minikuve, kind and k3d**.

Each solution allows to run fully funcitonal Kubernetes cluster using resources of local machine using single command. However, there are some pros and cons in each solution, so the same are going to be explained in this document.

### minikube

Minikube requires Docker (or similarly compatibe) container or a Virtual Machine environment. It works on Linux, Windows and MacOS. Supported architectures are x86-64, ARM64, ARMv7, ppc64, S390x

In order to deploy some image, following command needs to be executed:
> kubectl create deployment hello-minikube --image=kicbase/echo-server:1.0

**Pros**: 
- easy to install and launch
- dedicated command to start, stop and pause cluster
- dashboard and gcp-auth addons are enabled by default


### kind

kind requires Docker/Podman/Nerdctl and go 1.16+

It supports Linux, macOS and Windows.

**Pros**:
- configuration can be defined in Yaml file
- multi-node clusters supported


### k3d

k3d requires Docker and kubectl.

Default installation includes Control plane, CoreDNS and Metrics-server.

**Pros**:
- NA

**Cons**:
- only Docker supported

## Recommended solution

Based on pros and cons of each solution, it's recommended to use kind. 




Вступ: Опис інструментів та їх призначення.
Характеристики: Опис основних характеристик кожного інструменту, таких як підтримувані ОС та архітектури, можливість автоматизації, наявність додаткових функцій, таких як моніторинг та керування Kubernetes кластером.
Переваги та недоліки: Опис переваг та недоліків кожного інструменту, таких як легкість використання, швидкість розгортання, стабільність роботи, наявність документації та підтримки спільноти, складність налаштування та використання.
Демонстрація: Коротка демонстрація рекомендованого Вами інструменту з використанням прикладу, такого як розгортання застосунку «Hello World» на Kubernetes.
Висновки: Заключення та рекомендації щодо використання кожного інструменту в PoC для стартапу.