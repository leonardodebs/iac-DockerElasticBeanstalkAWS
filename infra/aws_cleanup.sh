#!/bin/bash

# Altere essas variáveis conforme necessário
ECR_REPO="producao"
S3_BUCKET="meu-bucket-de-exemplo"
BEANSTALK_ENV="meu-ambiente"
BEANSTALK_APP="minha-aplicacao"
IAM_ROLE="minha-role"
IAM_POLICY="minha-policy"  # se existir uma policy custom
AWS_REGION="us-east-1"     # ajuste para sua região

echo "🧼 Limpando imagens do ECR..."
IMAGES=$(aws ecr list-images --repository-name "$ECR_REPO" --region $AWS_REGION --query 'imageIds[*]' --output json)
if [ "$IMAGES" != "[]" ]; then
  aws ecr batch-delete-image --repository-name "$ECR_REPO" --image-ids "$IMAGES" --region $AWS_REGION
fi

echo "🗑️ Deletando repositório ECR..."
aws ecr delete-repository --repository-name "$ECR_REPO" --force --region $AWS_REGION

echo "🪣 Limpando e removendo bucket S3..."
aws s3 rm "s3://$S3_BUCKET" --recursive
aws s3api delete-bucket --bucket "$S3_BUCKET" --region $AWS_REGION

echo "🚀 Terminando ambiente Elastic Beanstalk..."
aws elasticbeanstalk terminate-environment --environment-name "$BEANSTALK_ENV" --region $AWS_REGION

echo "🧾 Deletando aplicação Elastic Beanstalk..."
aws elasticbeanstalk delete-application --application-name "$BEANSTALK_APP" --region $AWS_REGION

echo "🔐 Deletando IAM role..."
aws iam delete-role-policy --role-name "$IAM_ROLE" --policy-name "$IAM_POLICY"
aws iam delete-role --role-name "$IAM_ROLE"

echo "✅ Limpeza manual concluída!"

