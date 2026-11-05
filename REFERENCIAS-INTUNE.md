# Biblioteca de referencias de Microsoft Intune

Este repositorio reúne ejemplos para consultar y evaluar configuraciones de Microsoft Intune. **No constituye un baseline aprobado para producción**.

## Inicio rápido
- [Catálogo de fuentes](Referencias/FUENTES.md)
- [Repositorios de Microsoft relacionados con Intune](Referencias/MICROSOFT-INTUNE-REPOS.md)
- [Método de evaluación de directivas](Referencias/GUIA-CONSULTA-DIRECTIVAS.md)
- [Material redistribuido con licencia](Referencias/Codigo/README.md)

## Principios
1. Consultar primero documentación oficial actual de Microsoft y Apple; usar ejemplos comunitarios como insumo, no como autoridad.
2. Preferir políticas nativas de Intune o Defender frente a remediaciones de registro/scripts cuando exista un control admitido.
3. Verificar plataforma, versión, ámbito de dispositivo/usuario, requisitos, conflicto con otras políticas, idempotencia, salida de detección y reversión.
4. Probar en piloto antes de pasar a producción. No desplegar directamente ningún archivo de `Referencias/Codigo`.
5. No subir identificadores del tenant, credenciales, certificados, URLs internos, tokens, IP corporativas ni información de usuarios. El repositorio es público.

> Archivo de referencias incorporado el 2026-11-05. Las fuentes externas deben volver a verificarse al preparar cada política.
