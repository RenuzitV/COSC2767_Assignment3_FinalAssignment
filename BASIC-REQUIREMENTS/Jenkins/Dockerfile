#   RMIT University Vietnam
#   Course: COSC2767 Systems Deployment and Operations
#   Semester: 2023C
#   Assessment: Assignment 1
#   Author: Nguyen Vu Minh Duy
#   ID: s3878076
#   Created  date: 27/11/2023 (e.g. 31/07/2023)
#   Last modified: 02/12/2023 (e.g. 05/08/2023)
#   Acknowledgement: 
# https://www.jenkins.io/doc/book/managing/casc/
# https://plugins.jenkins.io/configuration-as-code/
# https://stackoverflow.com/questions/57953187/aws-cli-has-no-output
# https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
FROM jenkins/jenkins:lts


# Skip the initial setup wizard
# ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false


ARG DOCKER_GROUP_ID
ENV DOCKER_GROUP_ID ${DOCKER_GROUP_ID:-999}

# Install necessary plugins
RUN jenkins-plugin-cli --plugins configuration-as-code job-dsl git jdk-tool adoptopenjdk workflow-aggregator maven-plugin deploy docker-build-step

# Copy JCasC configuration file and Job DSL script into the container
COPY jenkins.yaml /var/jenkins_home/casc_configs/
COPY Jobs/ /usr/share/jenkins/ref/jobs/

# Set the CASC_JENKINS_CONFIG environment variable to point to the JCasC file
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc_configs/jenkins.yaml

# Switch to root to install system dependencies
USER root

RUN apt-get update && \
    apt-get install -y maven git && \
    rm -rf /var/lib/apt/lists/*


# Install Docker CLI
RUN apt-get update && \
    apt-get install -y apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get install -y docker-ce-cli

RUN groupadd -g ${DOCKER_GROUP_ID} docker && \
    usermod -aG docker jenkins
    
# install aws cli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install

# set aws cli pager to empty string to avoid error
ENV AWS_PAGER ""

# install kubectl 

RUN curl -o kubectl https://s3.us-west-2.amazonaws.com/amazon-eks/1.28.3/2023-11-14/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl

# update kubeconfig
RUN aws eks update-kubeconfig --name devops-eks-cluster --region us-east-1

# Switch back to the Jenkins user
USER jenkins
