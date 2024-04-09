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

Installation:
> go install sigs.k8s.io/kind@v0.22.0



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

Based on pros and cons of each solution, it's recommended to use minikube. 
Example demo is below:

![demo session](../demo.gif)


## Conclusion


| Name     | Container runtime     | Complexity | Extra add-ons       |
|----------|-----------------------|------------|---------------------|
| minikube | Docker, Podman, VM    | Easy       | dashboard, gcp-auth |
| kind     | Docker/Podman/Nerdctl | Medium     |                     |
| k3d      | Only Docker           | Medium     |                     |