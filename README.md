# 🚀 Deploy automático de VMs en GCP con Terraform y GitHub Actions

Este proyecto crea instancias de Compute Engine en Google Cloud Platform (GCP) usando Terraform y las despliega automáticamente mediante GitHub Actions.

## 🧰 Requisitos

- Cuenta en Google Cloud Platform con permisos de administrador
- Un repositorio en GitHub
- Servicio de Artifact Registry con una imagen disponible (Ubuntu 22.04 compatible)
- GitHub Actions habilitado

## ⚙️ Configura los Secrets en GitHub

Ve a `Settings > Secrets and variables > Actions` en tu repositorio y agrega los siguientes secretos:

| Nombre del secreto                  | Descripción                                               |
|------------------------------------|-----------------------------------------------------------|
| GCP_CREDENTIALS                    | Contenido del archivo JSON del service account codificado en base64 |
| TF_VAR_PROJECT_ID                  | ID del proyecto en GCP (ej: curso-devops-402315)          |
| TF_VAR_REGION_NAME                 | Región de despliegue (ej: us-central1)                    |
| TF_VAR_GITHUB_USER                 | Tu usuario de GitHub (ej: pierobrunetti)                  |
| TF_VAR_ARTIFACT_REGISTRY_IMAGE     | Ruta completa de la imagen Docker en Artifact Registry (ej: us-central1-docker.pkg.dev/curso-devops-402315/my-repo/my-image:latest) |

Puedes codificar el JSON de la cuenta de servicio en base64 así:

```bash
base64 -w 0 service-account.json
```

## 📁 Estructura del proyecto

```
.
├── main.tf
├── variables.tf
├── outputs.tf
├── vm-machines.json
├── modules/
│   └── compute-engine/
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
└── .github/
    └── workflows/
        └── deploy_gcp_boolean.yml
```

## 🚀 Despliegue automático

Cada vez que haces push a la rama principal, el workflow en `.github/workflows/deploy_gcp_boolean.yml`:

1. Inicializa Terraform
2. Valida la configuración
3. Genera un plan
4. Aplica los cambios (crea/actualiza VMs)

## ✅ Resultado esperado

Una o más instancias virtuales corriendo Ubuntu 22.04 LTS en GCP con Docker instalado, autenticadas en Artifact Registry y ejecutando una imagen desde el repositorio.

## 📎 Notas adicionales

- Puedes modificar el archivo `vm-machines.json` para definir múltiples instancias con distintos tipos, nombres y discos.
- Todas las variables son manejadas como variables de entorno usando el prefijo TF_VAR_ para integrarse con Terraform automáticamente.

---
Autor: Piero Giovanni Brunetti Fonseca  
