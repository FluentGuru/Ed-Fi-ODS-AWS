#SETUP
echo "Setting up "
docker context use default
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin $AWS_ECR_URL

#ODS
echo "Publishing ODS API"
docker build -t $AWS_ECR_URL/developersnet-edfi-api:latest ./images/ods/ 
docker push $AWS_ECR_URL/developersnet-edfi-api:latest

#ADMIN
echo "Publishing ADMINAPP"
docker build -t $AWS_ECR_URL/developersnet-edfi-adminapp:latest ./images/adminapp/
docker push $AWS_ECR_URLdevelopersnet-edfi-adminapp:latest

#SWAGGER
echo "Publishing SWAGGER"
docker build -t $AWS_ECR_URL/developersnet-edfi-swagger:latest ./images/swagger/
docker push $AWS_ECR_URL/developersnet-edfi-swagger:latest



