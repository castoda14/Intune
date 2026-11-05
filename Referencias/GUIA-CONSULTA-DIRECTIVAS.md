# Método de análisis de una directiva de Microsoft Intune

1. **Necesidad y amenaza:** qué comportamiento controlar y sobre qué plataforma, versión, usuarios/dispositivos y tipo de enrolamiento.
2. **Control preferido:** Settings Catalog / Administrative Templates / Endpoint Security / Defender / Security Baseline / Compliance / Configuration Profiles, de acuerdo con la tecnología que realmente administra el ajuste.
3. **Fuente:** Microsoft Learn y documentación de proveedor primero; ejemplos oficiales y comunitarios después. Anotar URL, fecha, rama/commit y licencia si se reutiliza código.
4. **Conflictos y prerrequisitos:** otras políticas, controles por GPO, Tamper Protection, PSSO, Apple MDM, permisos, arquitectura de CPU y conectividad.
5. **Piloto:** grupo controlado; registrar cumplimiento, eventos/logs, resultado esperado, fallas y tolerancia al error.
6. **Reversión:** documentar el valor anterior y un procedimiento de rollback; no usar scripts destructivos sin revisión.
7. **Entrega:** nombre de política, plataforma, ruta del portal, configuración exacta, alcance, exclusiones, dependencia, evidencias y criterio de aceptación.

## Criterios para scripts de Remediations
- Detección de sólo lectura, con `exit 0` para estado conforme y `exit 1` sólo cuando corresponde corregir.
- Remediación idempotente, registro sin datos sensibles y tratamiento explícito de errores.
- Evaluar si se requiere PowerShell de 64 bits, contexto SYSTEM/usuario, firma y prerequisitos.
- Evitar deshabilitar Defender o su protección en tiempo real, editar protectores BitLocker sin recuperación respaldada, modificar WinRM/registro a ciegas o ejecutar instaladores de origen no verificado.
- No usar scripts con referencias a Flash o Windows antiguos como si fueran controles recomendados actuales.

## Áreas iniciales del catálogo
- Windows: BitLocker, TPM, WHfB, navegadores, endurecimiento de red, Remediations.
- macOS: Company Portal, Platform SSO, Defender, perfiles MDM y cumplimiento.
- Automatización: Microsoft Graph y empaquetado Win32.
