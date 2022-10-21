# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

# Sourced from https://github.com/Ed-Fi-Alliance-OSS/Ed-Fi-ODS-Docker

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-alpine
LABEL maintainer="Ed-Fi Alliance, LLC and Contributors <techsupport@ed-fi.org>"

ENV VERSION="5.3.1146"
ENV MINIMAL_BACKUP=EdFi_Ods_Minimal_Template_TPDM_Core.sql
ENV POPULATED_BACKUP=EdFi_Ods_Populated_Template.sql
ENV MINVERSION="5.3.232"
ENV MINTPDMVERSION="5.3.77"
ENV ADMIN_VERSION="5.3.154"
ENV SECURITY_VERSION="5.3.152"
ENV ADMINAPP_DATABASE_VERSION="2.3.1"

WORKDIR /app
COPY appsettings.template.json /app/appsettings.template.json
COPY run.sh /app/run.sh
COPY migrate.sh /app/migrate.sh
COPY log4net.config /app/log4net.txt
COPY global.pem /usr/local/share/ca-certificates/my-cert.crt

RUN cat /usr/local/share/ca-certificates/my-cert.crt >> /etc/ssl/certs/ca-certificates.crt && \
    apk --no-cache add \
        curl

RUN apk add unzip dos2unix bash gettext postgresql-client && \
    wget -O /app/WebApi.zip  https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_apis/packaging/feeds/EdFi/nuget/packages/EdFi.Suite3.Ods.WebApi/versions/${VERSION}/content && \
    unzip /app/WebApi.zip -d /app && \
    rm -f /app/WebApi.zip && \
    cp /app/log4net.txt /app/log4net.config && \
    dos2unix /app/*.json && \
    dos2unix /app/*.sh && \
    dos2unix /app/log4net.config && \
    chmod 700 /app/*.sh ** && \
    rm -f /app/*.exe

RUN mkdir tmp && \
    wget -O /tmp/EdFi_Admin.zip https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_apis/packaging/feeds/EdFi/nuget/packages/EdFi.Database.Admin.PostgreSQL/versions/${ADMIN_VERSION}/content && \
    wget -O /tmp/EdFi_Security.zip https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_apis/packaging/feeds/EdFi/nuget/packages/EdFi.Database.Security.PostgreSQL/versions/${SECURITY_VERSION}/content && \
    wget -O /tmp/EdFi_AdminApp_Scripts.zip https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_apis/packaging/feeds/EdFi/nuget/packages/EdFi.Suite3.ODS.AdminApp.Database/versions/${ADMINAPP_DATABASE_VERSION}/content && \
    wget -O /tmp/TPDMOdsMinimalDatabase.zip https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_apis/packaging/feeds/EdFi/nuget/packages/EdFi.Suite3.Ods.Minimal.Template.TPDM.Core.PostgreSQL/versions/${MINTPDMVERSION}/content && \
    unzip -p /tmp/TPDMOdsMinimalDatabase.zip EdFi.Ods.Minimal.Template.TPDM.Core.sql > /tmp/EdFi_Ods_Minimal_Template_TPDM_Core.sql && \
    unzip -p /tmp/EdFi_Admin.zip EdFi_Admin.sql > /tmp/EdFi_Admin.sql && \
    unzip -p /tmp/EdFi_Security.zip EdFi_Security.sql > /tmp/EdFi_Security.sql && \
    unzip /tmp/EdFi_AdminApp_Scripts.zip PgSql/* -d /tmp/AdminAppScripts/ && \
 
EXPOSE "80"

ENTRYPOINT ["exec /app/migrate.sh", "exec /app/run.sh"]


