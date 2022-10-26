#SETUP
echo "Setting up "
docker context use default
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin $AWS_ECR_URL

#ODS
echo "Publishing ODS API"
docker build -t $ODSAPI_IMAGE ./images/ods/ 
docker push $ODSAPI_IMAGE

#ADMIN
echo "Publishing ADMINAPP"
docker build -t $ADMINAPP_IMAGE ./images/adminapp/
docker push $ADMINAPP_IMAGE

#SWAGGER
echo "Publishing SWAGGER"
docker build -t $SWAGGER_IMAGE ./images/swagger/
docker push $SWAGGER_IMAGE



