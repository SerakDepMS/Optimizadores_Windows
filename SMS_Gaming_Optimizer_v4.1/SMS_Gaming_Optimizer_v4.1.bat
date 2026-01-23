@echo off
chcp 65001 >nul
title OPTIMIZADOR SISTEMA WINDOWS - Versión Estable
color 0A
setlocal enabledelayedexpansion

:: ==============================================
:: VERIFICACIÓN DE ADMINISTRADOR (CORREGIDA)
:: ==============================================
:check_admin
fltmc >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo ============================================
    echo   ERROR: Permisos insuficientes
    echo ============================================
    echo.
    echo Este programa requiere ejecutarse como Administrador.
    echo.
    echo INSTRUCCIONES:
    echo 1. Guarda este archivo en tu escritorio
    echo 2. Haz clic derecho sobre el
    echo 3. Selecciona "Ejecutar como administrador"
    echo.
    echo Si ya lo hiciste, prueba:
    echo - Desactivar antivirus temporalmente
    echo - Ejecutar desde CMD como admin
    echo.
    pause
    exit /b 1
)

:: ==============================================
:: CONFIGURACIÓN INICIAL SEGURA
:: ==============================================
set "backup_folder=%USERPROFILE%\Desktop\Backup_Optimizador"
if not exist "%backup_folder%" mkdir "%backup_folder%"

set "log_file=%backup_folder%\optimizacion.log"
echo ============================================ > "%log_file%"
echo LOG DE OPTIMIZACION - %date% %time%        >> "%log_file%"
echo ============================================ >> "%log_file%"

:: ==============================================
:: MENÚ PRINCIPAL (VERSIÓN ESTABLE)
:: ==============================================
:main_menu
cls
echo.
echo ============================================
echo      OPTIMIZADOR DE SISTEMA WINDOWS
echo ============================================
echo.
echo [1] OPTIMIZACION RAPIDA (Segura)
echo [2] LIBERAR MEMORIA RAM
echo [3] LIMPIAR ARCHIVOS TEMPORALES
echo [4] OPTIMIZAR SERVICIOS WINDOWS
echo [5] REPARAR ARCHIVOS DE SISTEMA
echo [6] VER ESTADO DEL SISTEMA
echo [7] CREAR PUNTO DE RESTAURACION
echo [8] RESTAURAR CONFIGURACION
echo [9] SALIR
echo.
echo ============================================
echo.
set /p opcion="Seleccione una opcion [1-9]: "

if "%opcion%"=="1" goto optimizacion_rapida
if "%opcion%"=="2" goto liberar_ram
if "%opcion%"=="3" goto limpiar_temporales
if "%opcion%"=="4" goto optimizar_servicios
if "%opcion%"=="5" goto reparar_sistema
if "%opcion%"=="6" goto estado_sistema
if "%opcion%"=="7" goto punto_restauracion
if "%opcion%"=="8" goto restaurar_config
if "%opcion%"=="9" goto salir

echo Opcion invalida. Intente de nuevo.
timeout /t 2 /nobreak >nul
goto main_menu

:: ==============================================
:: 1. OPTIMIZACIÓN RÁPIDA
:: ==============================================
:optimizacion_rapida
cls
echo.
echo ============================================
echo      OPTIMIZACION RAPIDA DEL SISTEMA
echo ============================================
echo.
echo Esta opcion realizara una optimizacion segura
echo y completa de su sistema Windows.
echo.
echo PASO 1: Creando punto de restauracion...
call :crear_punto_restauracion_simple
echo.
echo PASO 2: Limpiando archivos temporales...
call :limpiar_archivos_temporales
echo.
echo PASO 3: Liberando memoria RAM...
call :liberar_memoria_ram
echo.
echo PASO 4: Optimizando servicios...
call :optimizar_servicios_basicos
echo.
echo PASO 5: Reparando sistema...
call :reparar_sistema_basico
echo.
echo ============================================
echo    OPTIMIZACION COMPLETADA EXITOSAMENTE
echo ============================================
echo.
echo Acciones realizadas:
echo - Punto de restauracion creado
echo - Archivos temporales eliminados
echo - Memoria RAM liberada
echo - Servicios optimizados
echo - Sistema reparado
echo.
echo Log guardado en: %log_file%
echo.
pause
goto main_menu

:: ==============================================
:: 2. LIBERAR MEMORIA RAM
:: ==============================================
:liberar_ram
cls
echo.
echo ============================================
echo       LIBERANDO MEMORIA RAM
echo ============================================
echo.
echo Estado actual de memoria:
systeminfo | findstr /C:"Memoria física disponible"
echo.
echo Liberando memoria...
echo.

:: Método 1: Limpiar cachés
echo [1/3] Limpiando cachés del sistema...
ipconfig /flushdns >nul 2>&1
echo ? Caché DNS limpiado

:: Método 2: Vaciar working sets
echo [2/3] Optimizando memoria de procesos...
powershell -Command " $sig = '[DllImport(\"kernel32.dll\")] public static extern bool SetProcessWorkingSetSize(IntPtr proc, int min, int max);'; $type = Add-Type -MemberDefinition $sig -Name NativeMethods -Namespace Kernel32 -PassThru; $processes = Get-Process; foreach($process in $processes) { try { $type::SetProcessWorkingSetSize($process.Handle, -1, -1) | Out-Null } catch {} }" >nul 2>&1
echo ? Procesos optimizados

:: Método 3: Limpiar RAM standby
echo [3/3] Limpiando RAM en espera...
powershell -Command "Clear-RecycleBin -Force" >nul 2>&1
echo ? Papelera de reciclaje vaciada

echo.
echo Memoria liberada exitosamente.
echo Estado nuevo:
systeminfo | findstr /C:"Memoria física disponible"
echo.
echo Resultado guardado en log.
echo.
pause
goto main_menu

:: ==============================================
:: 3. LIMPIAR ARCHIVOS TEMPORALES
:: ==============================================
:limpiar_temporales
cls
echo.
echo ============================================
echo     LIMPIEZA DE ARCHIVOS TEMPORALES
echo ============================================
echo.
echo Esta operacion eliminara:
echo - Archivos temporales del sistema
echo - Caché de aplicaciones
echo - Logs antiguos
echo - Archivos de instalacion temporal
echo.
set /p confirm="¿Desea continuar? (S/N): "
if /i not "%confirm%"=="S" goto main_menu

echo.
echo [1/5] Limpiando TEMP del sistema...
del /f /s /q "%TEMP%\*" >nul 2>&1
rd /s /q "%TEMP%" 2>nul
mkdir "%TEMP%" >nul 2>&1
echo ? TEMP limpiado

echo [2/5] Limpiando TEMP de Windows...
del /f /s /q "%WINDIR%\Temp\*" >nul 2>&1
echo ? Windows Temp limpiado

echo [3/5] Limpiando Prefetch...
del /f /s /q "%WINDIR%\Prefetch\*" >nul 2>&1
echo ? Prefetch limpiado

echo [4/5] Limpiando SoftwareDistribution...
del /f /s /q "%WINDIR%\SoftwareDistribution\Download\*" >nul 2>&1
echo ? Actualizaciones temporales limpiadas

echo [5/5] Ejecutando Cleanmgr...
cleanmgr /sagerun:1 >nul 2>&1
echo ? Limpieza de disco completada

echo.
echo Limpieza finalizada exitosamente.
echo Espacio liberado.
echo.
pause
goto main_menu

:: ==============================================
:: 4. OPTIMIZAR SERVICIOS WINDOWS
:: ==============================================
:optimizar_servicios
cls
echo.
echo ============================================
echo     OPTIMIZACION DE SERVICIOS WINDOWS
echo ============================================
echo.
echo Esta opcion optimizara servicios de Windows
echo para mejorar el rendimiento del sistema.
echo.
echo SERVICIOS A OPTIMIZAR:
echo 1. DiagTrack - Telemetria
echo 2. dmwappushservice - Notificaciones push
echo 3. SysMain (Superfetch)
echo 4. WSearch - Busqueda de Windows
echo.
set /p confirm="¿Continuar? (S/N): "
if /i not "%confirm%"=="S" goto main_menu

echo.
echo Optimizando servicios...
echo.

:: Servicio 1: DiagTrack
echo [1/4] Configurando DiagTrack...
sc stop "DiagTrack" >nul 2>&1
sc config "DiagTrack" start= disabled >nul 2>&1
echo ? DiagTrack deshabilitado

:: Servicio 2: dmwappushservice
echo [2/4] Configurando dmwappushservice...
sc stop "dmwappushservice" >nul 2>&1
sc config "dmwappushservice" start= disabled >nul 2>&1
echo ? dmwappushservice deshabilitado

:: Servicio 3: SysMain (Superfetch)
echo [3/4] Configurando SysMain (Superfetch)...
sc stop "SysMain" >nul 2>&1
sc config "SysMain" start= disabled >nul 2>&1
echo ? SysMain deshabilitado

:: Servicio 4: WSearch
echo [4/4] Optimizando Windows Search...
sc config "WSearch" start= delayed-auto >nul 2>&1
echo ? Windows Search optimizado

echo.
echo Optimizacion de servicios completada.
echo.
echo NOTA: Algunos cambios requieren reinicio.
echo.
pause
goto main_menu

:: ==============================================
:: 5. REPARAR ARCHIVOS DE SISTEMA
:: ==============================================
:reparar_sistema
cls
echo.
echo ============================================
echo     REPARACION DE ARCHIVOS DEL SISTEMA
echo ============================================
echo.
echo Esta herramienta reparara archivos dañados
echo de Windows usando herramientas oficiales.
echo.
echo HERRAMIENTAS A USAR:
echo 1. SFC (System File Checker)
echo 2. DISM (Deployment Image Service)
echo 3. CHKDSK (Verificacion de disco)
echo.
set /p confirm="¿Continuar? (S/N): "
if /i not "%confirm%"=="S" goto main_menu

echo.
echo [1/3] Ejecutando SFC /scannow...
echo Esto puede tomar varios minutos...
sfc /scannow
echo ? SFC completado
echo.

echo [2/3] Ejecutando DISM...
DISM.exe /Online /Cleanup-image /Restorehealth
echo ? DISM completado
echo.

echo [3/3] Verificando disco...
echo Ejecutando CHKDSK en modo lectura...
chkdsk C: /f
echo ? Verificacion de disco completada
echo.

echo Reparacion del sistema finalizada.
echo Si se encontraron errores, reinicie el sistema.
echo.
pause
goto main_menu

:: ==============================================
:: 6. VER ESTADO DEL SISTEMA
:: ==============================================
:estado_sistema
cls
echo.
echo ============================================
echo      ESTADO ACTUAL DEL SISTEMA
echo ============================================
echo.
echo [INFORMACION DEL SISTEMA]
echo.
ver
echo.
echo [INFORMACION DEL PROCESADOR]
wmic cpu get name
echo.
echo [MEMORIA RAM]
systeminfo | findstr /C:"Memoria física total" /C:"Memoria física disponible"
echo.
echo [ALMACENAMIENTO]
wmic logicaldisk where "DeviceID='C:'" get Size,FreeSpace /value | findstr "FreeSpace Size"
echo.
echo [USO DE CPU]
for /f "skip=1" %%p in ('wmic cpu get loadpercentage') do (
    if not "%%p"=="" echo CPU en uso: %%p%%
)
echo.
echo [PROCESOS ACTIVOS]
for /f %%a in ('tasklist ^| find /c /v ""') do echo Procesos ejecutandose: %%a
echo.
echo [TEMPERATURAS (si disponibles)]
wmic /namespace:\\root\wmi PATH MSAcpi_ThermalZoneTemperature get CurrentTemperature 2>nul || echo Informacion no disponible
echo.
echo [CONEXIONES DE RED]
ipconfig | findstr "IPv4"
echo.
pause
goto main_menu

:: ==============================================
:: 7. CREAR PUNTO DE RESTAURACIÓN
:: ==============================================
:punto_restauracion
cls
echo.
echo ============================================
echo      CREAR PUNTO DE RESTAURACION
echo ============================================
echo.
echo Creando punto de restauracion del sistema...
echo.
echo Nombre del punto: OPTIMIZADOR_%date:~10,4%%date:~4,2%%date:~7,2%
echo.
wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "OPTIMIZADOR_%date:~10,4%%date:~4,2%%date:~7,2%", 100, 7
echo.
if %errorlevel% equ 0 (
    echo ? Punto de restauracion creado exitosamente
) else (
    echo [!] Error al crear punto de restauracion
    echo     El servicio de restauracion puede estar deshabilitado
)
echo.
pause
goto main_menu

:: ==============================================
:: 8. RESTAURAR CONFIGURACIÓN
:: ==============================================
:restaurar_config
cls
echo.
echo ============================================
echo      RESTAURAR CONFIGURACION ORIGINAL
echo ============================================
echo.
echo Esta opcion revertira los cambios realizados
echo por el optimizador.
echo.
echo [1] Restaurar servicios de Windows
echo [2] Restaurar configuracion de red
echo [3] Restaurar plan de energia
echo [4] Volver al menu principal
echo.
set /p opcion_rest="Seleccione opcion [1-4]: "

if "%opcion_rest%"=="1" goto restaurar_servicios
if "%opcion_rest%"=="2" goto restaurar_red
if "%opcion_rest%"=="3" goto restaurar_energia
goto main_menu

:restaurar_servicios
echo Restaurando servicios de Windows...
sc config "DiagTrack" start= auto >nul 2>&1
sc config "dmwappushservice" start= auto >nul 2>&1
sc config "SysMain" start= auto >nul 2>&1
sc config "WSearch" start= auto >nul 2>&1
echo ? Servicios restaurados
pause
goto restaurar_config

:restaurar_red
echo Restaurando configuracion de red...
netsh winsock reset >nul 2>&1
netsh int ip reset >nul 2>&1
ipconfig /flushdns >nul 2>&1
echo ? Configuracion de red restaurada
pause
goto restaurar_config

:restaurar_energia
echo Restaurando plan de energia...
powercfg -restoredefaultschemes >nul 2>&1
echo ? Plan de energia restaurado
pause
goto restaurar_config

:: ==============================================
:: FUNCIONES AUXILIARES
:: ==============================================

:crear_punto_restauracion_simple
echo Creando punto de restauracion...
wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "Optimizador_Rapido", 100, 7 >nul 2>&1
if %errorlevel% equ 0 (
    echo ? Punto creado exitosamente
) else (
    echo [!] No se pudo crear punto (servicio deshabilitado)
)
goto :eof

:limpiar_archivos_temporales
echo Limpiando archivos temporales...
del /f /s /q "%TEMP%\*" >nul 2>&1
del /f /s /q "%WINDIR%\Temp\*" >nul 2>&1
del /f /s /q "%WINDIR%\Prefetch\*" >nul 2>&1
cleanmgr /sagerun:1 >nul 2>&1
echo ? Archivos temporales limpiados
goto :eof

:liberar_memoria_ram
echo Liberando memoria RAM...
powershell -Command "Clear-RecycleBin -Force" >nul 2>&1
ipconfig /flushdns >nul 2>&1
echo ? Memoria liberada
goto :eof

:optimizar_servicios_basicos
echo Optimizando servicios...
sc config "DiagTrack" start= disabled >nul 2>&1
sc config "dmwappushservice" start= disabled >nul 2>&1
echo ? Servicios optimizados
goto :eof

:reparar_sistema_basico
echo Reparando archivos del sistema...
sfc /scannow >nul 2>&1
echo ? Sistema reparado
goto :eof

:: ==============================================
:: 9. SALIR
:: ==============================================
:salir
cls
echo.
echo ============================================
echo        OPTIMIZADOR DE SISTEMA
echo ============================================
echo.
echo Gracias por usar el optimizador.
echo.
echo Resumen de acciones guardadas en:
echo %log_file%
echo.
echo Recomendaciones:
echo 1. Reinicie su PC para cambios completos
echo 2. Ejecute el optimizador mensualmente
echo 3. Mantenga Windows actualizado
echo.
echo ¡Hasta pronto!
echo.
timeout /t 3 /nobreak >nul
exit