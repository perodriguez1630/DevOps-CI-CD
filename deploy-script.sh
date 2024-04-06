#!/bin/bash

# Nombre de la instancia y otras variables
INSTANCE_NAME="instance-gce-test"
IMAGE_NAME="gcr.io/rosy-acolyte-412215/image-gce-test"
ZONE="us-central1-b"
PROJECT_ID="rosy-acolyte-412215"

# Verificar si la instancia existe
if gcloud compute instances describe $INSTANCE_NAME --zone=$ZONE &>/dev/null; then
  echo "La instancia ya existe, actualizando el contenedor..."
  # Actualizar el contenedor dentro de la instancia existente
  gcloud compute instances update-container $INSTANCE_NAME \
    --container-image=$IMAGE_NAME \
    --zone=$ZONE
else
  echo "La instancia no existe, creando la instancia y desplegando el contenedor..."
  # Crear la instancia y desplegar el contenedor
  gcloud compute instances create-with-container $INSTANCE_NAME \
    --container-image=$IMAGE_NAME \
    --zone=$ZONE
fi
