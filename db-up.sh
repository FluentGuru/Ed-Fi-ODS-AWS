#ENV
export MINIMAL_BACKUP=EdFi_Ods_Minimal_Template_TPDM_Core.sql
export POPULATED_BACKUP=EdFi_Ods_Populated_Template.sql
export MINVERSION="5.3.232"
export MINTPDMVERSION="5.3.77"
export ADMIN_VERSION="5.3.154"
export SECURITY_VERSION="5.3.152"
export ADMINAPP_DATABASE_VERSION="2.3.2"
export POSTGRES_USER=postgres
export PGPASSWORD=postgres1
export POSTGRES_PASSWORD=postgres1
export POSTGRES_DB=postgres
export ODS_DB=EdFi_Ods
export POSTGRES_PORT=5432
export ODS_POSTGRES_HOST=developersnet-edfi-shared-ods-rds.ckljvufeppno.us-east-1.rds.amazonaws.com
export ADMIN_POSTGRES_HOST=developersnet-edfi-shared-ods-rds.ckljvufeppno.us-east-1.rds.amazonaws.com

#BACKUPS
echo "Downloading database backups"
mkdir tmp
wget -O ./tmp/EdFi_Admin.zip https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_apis/packaging/feeds/EdFi/nuget/packages/EdFi.Database.Admin.PostgreSQL/versions/${ADMIN_VERSION}/content && \
wget -O ./tmp/EdFi_Security.zip https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_apis/packaging/feeds/EdFi/nuget/packages/EdFi.Database.Security.PostgreSQL/versions/${SECURITY_VERSION}/content && \
wget -O ./tmp/EdFi_AdminApp_Scripts.zip https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_apis/packaging/feeds/EdFi/nuget/packages/EdFi.Suite3.ODS.AdminApp.Database/versions/${ADMINAPP_DATABASE_VERSION}/content && \
wget -O ./tmp/TPDMOdsMinimalDatabase.zip https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_apis/packaging/feeds/EdFi/nuget/packages/EdFi.Suite3.Ods.Minimal.Template.TPDM.Core.PostgreSQL/versions/${MINTPDMVERSION}/content && \
unzip -p ./tmp/TPDMOdsMinimalDatabase.zip EdFi.Ods.Minimal.Template.TPDM.Core.sql > ./tmp/EdFi_Ods_Minimal_Template_TPDM_Core.sql && \
unzip -p ./tmp/EdFi_Admin.zip EdFi_Admin.sql > ./tmp/EdFi_Admin.sql && \
unzip -p ./tmp/EdFi_Security.zip EdFi_Security.sql > ./tmp/EdFi_Security.sql && \
unzip ./tmp/EdFi_AdminApp_Scripts.zip PgSql/* -d ./tmp/AdminAppScripts/ && \

#CLEANUP
echo "Deleting Admin databases databases"
psql --username "$POSTGRES_USER"  --port $POSTGRES_PORT --dbname "$POSTGRES_DB" --host "$ADMIN_POSTGRES_HOST" <<-EOSQL
DROP DATABASE IF EXISTS "EdFi_Admin" WITH (FORCE);
DROP DATABASE IF EXISTS "EdFi_Security" WITH (FORCE);
EOSQL

echo "Deleting ODS Databases databases databases"
psql --username "$POSTGRES_USER"  --port $POSTGRES_PORT --dbname "$POSTGRES_DB" --host "$ODS_POSTGRES_HOST" <<-EOSQL
DROP DATABASE IF EXISTS "EdFi_Ods_Minimal_Template" WITH (FORCE);
DROP DATABASE IF EXISTS "$ODS_DB" WITH (FORCE);
EOSQL

#ADMIN and Security DBS
echo "Creating base Admin and Security databases..."
psql --username "$POSTGRES_USER"  --port $POSTGRES_PORT --dbname "$POSTGRES_DB" --host "$ADMIN_POSTGRES_HOST" <<-EOSQL
    CREATE DATABASE "EdFi_Admin" TEMPLATE template0;
    CREATE DATABASE "EdFi_Security" TEMPLATE template0;
    GRANT ALL PRIVILEGES ON DATABASE "EdFi_Admin" TO $POSTGRES_USER;
    GRANT ALL PRIVILEGES ON DATABASE "EdFi_Security" TO $POSTGRES_USER;
EOSQL

echo "Loading Security Database from backup..."
psql --no-password --username "$POSTGRES_USER"  --port $POSTGRES_PORT --dbname "EdFi_Security" --file ./tmp/EdFi_Security.sql --host "$ADMIN_POSTGRES_HOST" 1> /dev/null

echo "Loading Admin database from backup..."
psql --no-password --username "$POSTGRES_USER"  --port $POSTGRES_PORT --dbname "EdFi_Admin" --file ./tmp/EdFi_Admin.sql --host "$ADMIN_POSTGRES_HOST" 1> /dev/null

echo "Running Admin App database migration scripts..."

for FILE in `LANG=C ls ./tmp/AdminAppScripts/PgSql/* | sort -V`
do
    psql --no-password --username "$POSTGRES_USER" --port $POSTGRES_PORT --dbname "EdFi_Admin" --host "$ADMIN_POSTGRES_HOST" --file $FILE 1> /dev/null
done

#ODS DB
echo "Creating template"
psql --username "$POSTGRES_USER"  --port $POSTGRES_PORT --dbname "$POSTGRES_DB" --host "$ODS_POSTGRES_HOST" <<-EOSQL
    CREATE DATABASE "EdFi_Ods_Minimal_Template" TEMPLATE template0;
    GRANT ALL PRIVILEGES ON DATABASE "EdFi_Ods_Minimal_Template" TO $POSTGRES_USER;
    GRANT ALL PRIVILEGES ON DATABASE "$POSTGRES_DB" TO $POSTGRES_USER;
    ALTER DATABASE "EdFi_Ods_Minimal_Template" OWNER TO $POSTGRES_USER; 
EOSQL

echo "Loading Minimal Template Database from backup..."
psql --no-password --username "$POSTGRES_USER"  --port $POSTGRES_PORT --dbname "EdFi_Ods_Minimal_Template" --host "$ODS_POSTGRES_HOST" --file ./tmp/${MINIMAL_BACKUP}  1> /dev/null

echo "creating $POSTGRES_DB"
psql --username "$POSTGRES_USER"  --port $POSTGRES_PORT --dbname "$POSTGRES_DB" --host "$ODS_POSTGRES_HOST" <<-EOSQL

    CREATE DATABASE "$ODS_DB" TEMPLATE 'EdFi_Ods_Minimal_Template';
    GRANT ALL PRIVILEGES ON DATABASE "$ODS_DB" TO $POSTGRES_USER;
EOSQL