# iac-DockerElasticBeanstalkAWS

Este repositório contém infraestrutura como código (IaC) para configurar e gerenciar recursos na AWS usando **Terraform** e **Docker**. O objetivo é automatizar o deploy de aplicações utilizando **AWS Elastic Beanstalk**.

## Estrutura do Repositório

- **Dockerfile**: Arquivo de configuração para criar uma imagem Docker para a aplicação.
- **terraform/**: Contém os arquivos Terraform para provisionar recursos na AWS, incluindo **Elastic Beanstalk**, **VPC** e **Auto Scaling**.
- **.gitignore**: Lista de arquivos e diretórios a serem ignorados pelo Git.
- **env/**: Arquivos de configuração para ambientes específicos.

## Como Usar

### Pré-requisitos

- Terraform
- Docker
- Conta AWS configurada

### Configuração

1. Clone o repositório:
    ```bash
    git clone https://github.com/leonardodebs/iac-DockerElasticBeanstalkAWS.git
    ```

2. Configure as variáveis do Terraform:
    - Preencha o arquivo `terraform.tfvars` com suas credenciais e configurações específicas.

3. Execute os comandos do Terraform:
    ```bash
    terraform init
    terraform plan
    terraform apply
    ```

### Deploy da Aplicação

1. Construa a imagem Docker:
    ```bash
    docker build -t your-app .
    ```

2. Realize o deploy no Elastic Beanstalk utilizando o Terraform.

## Contribuições

Sinta-se à vontade para contribuir com melhorias ou ajustes. Para isso, crie uma branch, faça as alterações e submeta um pull request.

## Licença

Este projeto está licenciado sob a [MIT License](LICENSE).
