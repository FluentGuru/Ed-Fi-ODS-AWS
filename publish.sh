#AWS CREDENTIALS
export AWS_ACCESS_KEY_ID="ASIAQZ5DTLYWENN3KEBI"
export AWS_SECRET_ACCESS_KEY="4BlW/R/cPjTPaW0GWoG2NKUfeTovnKOQHFmA8CWS"
export AWS_SESSION_TOKEN="IQoJb3JpZ2luX2VjEI///////////wEaCXVzLWVhc3QtMSJHMEUCIQD6aiNCgN5cl24M1xvPsP+tfFtxdXxuP1j2TPur96BOewIgPTp666/yE3pa0Cvwf8/YMIY6TV2G68cnIXhn9PBnVxsq9wIIaBABGgwwNTU2NDA4MDkwMDQiDNksNpxcsF/ET029tyrUAqIFuojGMe5Bte0fxhAbae1dmfD2p3MpzpTbEY36eqlzuKRX7qoqg95+T6H+8QqMnNAuN1g6lP7McseMga2aKwsdE/HY39TXcZyJA+z3Asi8IdcY39ohTotAJ509hduCIdS/mTnQiBnvm7tNO3qxKXj9PEz0r2gtkBA5Y+hO51BIV3ww7W8q42wdTwOpiJ23naxAdCf26nd0H9T0SFm3/CRj509JfAF13Gl8R1mH0stfrGtwG1ONCOz3JoaxOLhIsrnEipfm1UaxS7h8pcPbPqQTMmkqCO7K62AZ0SQJHBIe8tBPz9puuyHh/djYFSugI258hn2yQqGUy/if07p8YIZF09D8AWMtY94cRYPapWDt8j+Lx/QCupyq45xlN3NnpqdXsATpVqWlf9hc52gKjhG2GHknNPqFcB2JDqEvO2qH/PE/vyzGkoAPzWb1IZwLs56k8pwwqpnHmgY6pwHTSjQBHHhC2tXyaUbI4m1Sw6SMhk/hi3PyP0Xht24uC+XIfy3IEa0c4jQCuyPs3AUhKukr0D+kLIZN56jBMV//4otsW5pHRqKhc3lTlI5A/Zy+M/i7ipdKLNSWn0RfPJx6iEKT4rmSAG/a9KXezVQAKMgZ6j6uWh2YN4DgI/AQFDJzlTHDyP6w5zbGunsdkCRYszhGazBK/HPPz15MMcQjnQsEIoUm9w=="

#SETUP
echo "Setting up "
docker context use default
# aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/s2q7l7m0

#ODS
echo "Publishing ODS API"
docker build -t public.ecr.aws/s2q7l7m0/developersnet-edfi-api:latest ./images/ods/ 
docker push public.ecr.aws/s2q7l7m0/developersnet-edfi-api:latest

#ADMIN
echo "Publishing ADMINAPP"
docker build -t public.ecr.aws/s2q7l7m0/developersnet-edfi-adminapp:latest ./images/adminapp/
docker push public.ecr.aws/s2q7l7m0/developersnet-edfi-adminapp:latest

#SWAGGER
echo "Publishing SWAGGER"
docker build -t public.ecr.aws/s2q7l7m0/developersnet-edfi-swagger:latest ./images/swagger/
docker push public.ecr.aws/s2q7l7m0/developersnet-edfi-swagger:latest



