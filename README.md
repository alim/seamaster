# Seamster

Seamaster is a container centric continuous integration and continuous
deployment (CI/CD) platform. The platform is based on the idea of using ]
[Docker](https://www.docker.com)
containers as the primary build mechanism. This approach will radically
simplify the CI/CD platform.

Most current CI/CD platforms are designed and built on the assumption
that an environment must be configured to build, test
and deplot an application or service. These current systems include
a lot of complex software and plugins to manage both the Configuration
of these environments and the execution of the build, test, and Deployment
steps.

Seamaster looks to invert this complexity by using
[Docker](https://www.docker.com) containers. The configuration of the
build environment and the testing steps can be configured as part of
Docker container. The CI/CD system no longer needs to worry about
the envrionment and build/test execution.

# CI/CD Simplified

Given this container centric approach, we can simplify the CI/CD system
into a few high-level components and a few simple steps.

## CI/CD Components

1. Build/Test Dockerfile - this Dockerfile / image will be responsible for:
    * Loading the source code into the container
    * Installing any tools required to build and test the code
    * Building the software, if required
    * Running automated tests
2. Docker Compose File - to be used to launch and link any additional
   software needed to test the application (e.g. database)
3. Production Build Dockerfile - specifies the Docker image you will
   use to deploy into your production environment. It will *not* include
   any testing tools and should remove any build tools from the container.
   It will then push the container image to either Docker Hub or a
   Docker Trusted Registry.
4. Deployment Dockerfile - specifies the container image that will include
   the necessary steps to deploy your code from the Docker Hub or
   Docker Trusted Registry into your target execution environment.

## CI/CD Steps

1. Build the *build/test* Container and execute it with the Docker
compose file.
2. If the *build/test* container executes successfully, then build the
production container image and push it either Docker Trusted Registry
or Docker Hub.
3. Build the *deployment* container and execute it. This container will
need network access and permissions to your target deploymet platform.

# Usage

## Build Test Containers

## Deployment Containers

## Deployment Targets

# License

The project is an open source project released under the
[GNU AGPLv3](https://www.gnu.org/licenses/agpl-3.0.en.html). Modification
made to source code, even for usage over a network service must follow
the terms of this license.
