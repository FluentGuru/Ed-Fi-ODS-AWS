#AWS CREDENTIALS
export AWS_ACCESS_KEY_ID="ASIAQZ5DTLYWKR67DFYX"
export AWS_SECRET_ACCESS_KEY="Fh/3VaWI0YNux1Js068yyaGcJzU547oB3yhWwO84"
export AWS_SESSION_TOKEN="IQoJb3JpZ2luX2VjEI3//////////wEaCXVzLWVhc3QtMSJGMEQCIC+oj6N/+fnlDPmAW4O0KiZUWCULNyQidy7sAbdJyuvrAiARKS6EbXagFnrKY5heTAM6Ks6KMiO86SnxJzhN4tycWSr3AghmEAEaDDA1NTY0MDgwOTAwNCIMYwh/IPl+OI8jnN96KtQCVKQnci8xwGbxxwfiH053V6iX95fuLNg6Ws2qxHkmCIl4NElw4byYvHjHVTAV4u5/zt4zT0RIyZ3A4PgWaVAXocx2hHXh7h+qeP1QZX0X6y+adTAtSrBMIUxxNWTMHnTJTnJHYREkPpGP+9HX6vm6CdOMhknnToSenFOwE4BtN4+IcMNAzfXM8hyz35v9vyNCPENVzHk74F1Y9Lf9YzggX/oF7+JOaEAtDBuPlURRYYTvjXzAnLIhnwnq+DDGM+IOljhq1mTokPgkRTAnhYZaFWL0GM3jdCYOvIittkLz+XHRp0wtEoA2QWzwD4CMGBBStX9IVDYPZ2DxTDaMlC//95+L/vtgDHKbvK/bKf8A0fZULen/lkR36GgKHTxv5CxYzrPOrZDLrYRo8NFH0+/yrqcMmZH82WxJgfiqWvMkHATiCyUZ7BSygVs45XLo08QzB2xLazC33caaBjqoAZ18hON2CI0cREfy/VC9Bq3cVobJQYLueuVe0fY+6mFsrvE2uhMoT0Wy2ctw6o4GUUTx1YoaR0t2SoSoG/41tDhP7Rq8/JhXjl/XjdrdoLJd86o1xqls3PKAUHQt69nxvMe1JGi5q6c95uc92JB0oRBANpybb7liFhwpNw2bFdWClMQEE0PlScVnX77i6VHckVvy0UAvdFtpaiMGPaLjJzlPGF8QJh41zQ=="

#AWS CONFIG
export AWS_VPC_ID="vpc-0fcf208e6ecec4037"
export AWS_LB_NAME="developersnet-edfi-shared-elb"
export AWS_AUTOSCALING_MIN=2
export AWS_AUTOSCALING_MAX=10
export AWS_AUTOSCALING_CPU=75


#VERSIONS
export MINVERSION="5.3.232"
export MINTPDMVERSION="5.3.77"
export ADMIN_VERSION="5.3.154"
export SECURITY_VERSION="5.3.152"
export ADMINAPP_DATABASE_VERSION="2.3.2"

#COMMON
export TAG=v2
export ENCRYPTION_KEY="FjhjsfNoQPK7Ys+0ic4ZnWCU5AY5EW8kAhAilHMRDro="
export LOGS_FOLDER="/tmp/logs"
export HEALTHCHECK_TEST="wget --no-verbose --tries=1 --spider http://localhost || exit 1"

#DB
export POSTGRES_USER=postgres
export PGPASSWORD=postgres1
export POSTGRES_PASSWORD=postgres1
export POSTGRES_DB=postgres
export ODS_DB=EdFi_Ods
export POSTGRES_PORT=5432
export ODS_POSTGRES_HOST=developersnet-edfi-shared-ods-rds.ckljvufeppno.us-east-1.rds.amazonaws.com
export ADMIN_POSTGRES_HOST="${ODS_POSTGRES_HOST}"


#ODS
export API_MODE="SharedInstance"
export ApiSettings__PathBase="api"
export TPDM_ENABLED=true
export API_INTERNAL_URL="http://developersnet-edfi-shared-elb-1258834677.us-east-1.elb.amazonaws.com"
export ODS_VIRTUAL_NAME="api"
export API_HOSTNAME="developersnet-edfi-shared-elb-1258834677.us-east-1.elb.amazonaws.com"
export API_EXTERNAL_URL="http://developersnet-edfi-shared-elb-1258834677.us-east-1.elb.amazonaws.com"

export API_HEALTHCHECK_TEST="wget --no-verbose --tries=1 --spider http://localhost || exit 1"

#SWAGGER
export MINIMAL_KEY=minimal
export MINIMAL_SECRET=minimalSecret
export POPULATED_KEY=populated
export POPULATED_SECRET=populatedSecret
export DOCS_VIRTUAL_NAME=docs
export SWAGGER_HEALTHCHECK_TEST="wget --no-verbose --tries=1 --spider http://localhost:8081 || exit 1"

#ADMIN
export ADMIN_USER="admin@test.com"
export ADMIN_PASSWORD=Admin1
export SANDBOX_ADMIN_VIRTUAL_NAME=sandboxadmin
export ADMINAPP_VIRTUAL_NAME=adminapp
export ADMINAPP_HEALTHCHECK_TEST="wget --no-verbose --tries=1 --spider http://localhost:8082 || exit 1"

#SETUP
docker context create ecs developersnet-edfi-shared
docker context use developersnet-edfi-shared
docker compose -f ./docker-compose.aws.yml up
