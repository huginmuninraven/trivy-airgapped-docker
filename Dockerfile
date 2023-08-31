ARG TRIVY_VERSION

FROM aquasec/trivy:latest

# Do not try to download updates by default
ENV TRIVY_NO_PROGRESS=true
ENV TRIVY_SKIP_DB_UPDATE=true
ENV TRIVY_SKIP_JAVA_DB_UPDATE=true


# Copies database files into Trivy 
COPY trivydb/ /root/.cache/trivy/db
# COPY javadb/ /root/.cache/trivy/java-db  # Too big for web.git.mil!

ENTRYPOINT ["trivy"]