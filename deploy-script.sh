!/bin/bash

# Nombre de la instancia y otras variables
# INSTANCE_NAME="instance-gce-test"
# IMAGE_NAME="gcr.io/rosy-acolyte-412215/image-gce-test"
# ZONE="us-central1-b"
# PROJECT_ID="rosy-acolyte-412215"

# # Verificar si la instancia existe
# if gcloud compute instances describe $INSTANCE_NAME --zone=$ZONE &>/dev/null; then
#   echo "La instancia ya existe, actualizando el contenedor..."
#   # Actualizar el contenedor dentro de la instancia existente
#   gcloud compute instances update-container $INSTANCE_NAME \
#     --container-image=$IMAGE_NAME \
#     --zone=$ZONE
# else
#   echo "La instancia no existe, creando la instancia y desplegando el contenedor..."
#   # Crear la instancia y desplegar el contenedor
#   gcloud compute instances create-with-container $INSTANCE_NAME \
#     --container-image=$IMAGE_NAME \
#     --zone=$ZONE
# fi


INSTANCE_NAME="instance-gce-test"
ZONE="us-central1-b"
PROJECT_ID="rosy-acolyte-412215"
SCRIPT_PATH="/home/joshua163011/test.sh"  # Ruta al archivo .sh dentro de la instancia

# Verificar si la instancia existe
if gcloud compute instances describe $INSTANCE_NAME --zone=$ZONE --project=$PROJECT_ID &>/dev/null; then
    echo "La instancia existe, ejecutando el archivo .sh..."
    # Conectarse a la instancia y ejecutar el script
    gcloud compute ssh $INSTANCE_NAME --zone=$ZONE --project=$PROJECT_ID --command="bash $SCRIPT_PATH"
else
    echo "La instancia no existe."
fi

# Verificar si la instancia existe
# if gcloud compute instances describe $INSTANCE_NAME --zone=$ZONE --project=$PROJECT_ID &>/dev/null; then
#   echo "La instancia ya existe, ejecutando el archivo .sh..."
#   # Ejecutar el archivo .sh dentro de la instancia existente usando SSH
#   gcloud compute ssh $INSTANCE_NAME --zone=$ZONE --project=$PROJECT_ID --command="bash -s" < $SCRIPT_PATH
# else
#   echo "La instancia no existe, creando la instancia y ejecutando el archivo .sh..."
#   # Crear la instancia y ejecutar el archivo .sh
#   gcloud compute instances create $INSTANCE_NAME \
#     --zone=$ZONE \
#     --metadata-from-file startup-script=$SCRIPT_PATH
# fi

