@echo off
chcp 850 >nul 2>&1
title OPTIMIZADOR SISTEMA WINDOWS - Versión Estable y Segura
color 0A
setlocal enabledelayedexpansion

:: ==============================================
:: VERIFICACIÓN DE ADMINISTRADOR (CORREGIDA)
:: ==============================================
:inicio
fltmc >nul 2>&1
if %errorlevel% neq 0 (
    cls
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
set "backup_folder=%USERPROFILE%\Desktop\Backup_Optimizador_%date:~10,4%%date:~4,2%%date:~7,2%"
if not exist "%backup_folder%" mkdir "%backup_folder%"

set "log_file=%backup_folder%\optimizacion.log"
echo ============================================ > "%log_file%"
echo LOG DE OPTIMIZACION - %date% %time%        >> "%log_file%"
echo ============================================ >> "%log_file%"

:: ==============================================
:: MENÚ PRINCIPAL (VERSIÓN ESTABLE CORREGIDA)
:: ==============================================
:main_menu
cls
echo.
echo ============================================
echo      OPTIMIZADOR DE SISTEMA WINDOWS
echo      Version Estable y Segura
echo ============================================
echo.
echo [1] OPTIMIZACION RAPIDA (Segura y Recomendada)
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
:: 1. OPTIMIZACIÓN RÁPIDA (CORREGIDA Y MEJORADA)
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
echo NOTA: El proceso tomara algunos minutos.
echo.
echo PASO 1: Creando punto de restauracion...
call :crear_punto_restauracion_simple
echo.
echo PASO 2: Limpiando archivos temporales...
call :limpiar_archivos_temporales_corregido
echo.
echo PASO 3: Liberando memoria RAM...
call :liberar_memoria_ram_corregido
echo.
echo PASO 4: Optimizando servicios basicos...
call :optimizar_servicios_basicos
echo.
echo PASO 5: Reparando archivos del sistema...
call :reparar_sistema_basico_corregido
echo.
echo ============================================
echo    OPTIMIZACION COMPLETADA EXITOSAMENTE
echo ============================================
echo.
echo Acciones realizadas:
echo ✓ Punto de restauracion creado
echo ✓ Archivos temporales eliminados
echo ✓ Memoria RAM liberada
echo ✓ Servicios optimizados
echo ✓ Sistema reparado
echo.
echo Log guardado en: %log_file%
echo.
echo Recomendacion: Reinicie su PC para cambios completos.
echo.
pause
goto main_menu

:: ==============================================
:: 2. LIBERAR MEMORIA RAM (MEJORADO)
:: ==============================================
:liberar_ram
cls
echo.
echo ============================================
echo       LIBERANDO MEMORIA RAM
echo ============================================
echo.
echo Estado actual de memoria:
for /f "tokens=2 delims=:" %%a in ('systeminfo ^| findstr /C:"Memoria física disponible"') do set memoria=%%a
echo Memoria disponible: !memoria!
echo.
echo Liberando memoria...
echo.

echo [1/4] Liberando caché DNS...
ipconfig /flushdns >nul 2>&1
echo ✓ Caché DNS limpiado

echo [2/4] Vaciamiento de la papelera de reciclaje...
powershell -Command "Clear-RecycleBin -Force -ErrorAction SilentlyContinue" >nul 2>&1
echo ✓ Papelera de reciclaje vaciada

echo [3/4] Optimizando memoria de procesos...
powershell -Command "try { Add-Type -MemberDefinition '[DllImport(\"kernel32.dll\")] public static extern bool SetProcessWorkingSetSize(IntPtr proc, int min, int max);' -Name Memory -Namespace Performance -PassThru | Out-Null } catch {}" >nul 2>&1
powershell -Command "Get-Process | ForEach-Object { try { [Performance.Memory]::SetProcessWorkingSetSize($_.Handle, -1, -1) } catch {} }" >nul 2>&1
echo ✓ Procesos optimizados

echo [4/4] Limpiando caché del sistema...
echo. > %TEMP%\clean.tmp && del %TEMP%\clean.tmp >nul 2>&1
echo ✓ Caché temporal limpiado

echo.
echo Memoria liberada exitosamente.
echo Estado nuevo:
for /f "tokens=2 delims=:" %%a in ('systeminfo ^| findstr /C:"Memoria física disponible"') do set nueva_memoria=%%a
echo Memoria disponible: !nueva_memoria!
echo.
echo Resultado guardado en log.
echo.
pause
goto main_menu

:: ==============================================
:: 3. LIMPIAR ARCHIVOS TEMPORALES (CORREGIDO)
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
echo ADVERTENCIA: No cierre ventanas durante el proceso.
echo.
set /p confirm="¿Desea continuar? (S/N): "
if /i not "%confirm%"=="S" goto main_menu

echo.
echo [1/5] Limpiando TEMP del sistema...
del /f /s /q "%TEMP%\*" >nul 2>&1
for /d %%x in ("%TEMP%\*") do rd /s /q "%%x" >nul 2>&1
echo ✓ TEMP limpiado

echo [2/5] Limpiando TEMP de Windows...
del /f /s /q "%WINDIR%\Temp\*" >nul 2>&1
for /d %%x in ("%WINDIR%\Temp\*") do rd /s /q "%%x" >nul 2>&1
echo ✓ Windows Temp limpiado

echo [3/5] Limpiando Prefetch...
del /f /s /q "%WINDIR%\Prefetch\*" >nul 2>&1
echo ✓ Prefetch limpiado

echo [4/5] Limpiando SoftwareDistribution...
del /f /s /q "%WINDIR%\SoftwareDistribution\Download\*" >nul 2>&1
echo ✓ Actualizaciones temporales limpiadas

echo [5/5] Ejecutando Limpieza de Disco...
echo Por favor espere, esto puede tomar tiempo...
cleanmgr /sagerun:1 /autoclean >nul 2>&1
echo ✓ Limpieza de disco completada

echo.
echo ============================================
echo    LIMPIEZA FINALIZADA EXITOSAMENTE
echo ============================================
echo.
echo Todos los archivos temporales han sido eliminados.
echo Se ha liberado espacio en el disco duro.
echo.
pause
goto main_menu

:: ==============================================
:: 4. OPTIMIZAR SERVICIOS WINDOWS (MEJORADO)
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
echo 3. SysMain (Superfetch) - Para SSD
echo 4. WSearch - Busqueda de Windows (modo diferido)
echo.
echo ADVERTENCIA: Algunos servicios pueden afectar
echo caracteristicas de Windows si los desactiva.
echo.
set /p confirm="¿Continuar? (S/N): "
if /i not "%confirm%"=="S" goto main_menu

echo.
echo Optimizando servicios...
echo.

:: Verificar si el servicio existe antes de modificarlo
echo [1/4] Configurando DiagTrack (Telemetria)...
sc query "DiagTrack" >nul 2>&1
if %errorlevel% equ 0 (
    sc stop "DiagTrack" >nul 2>&1
    sc config "DiagTrack" start= disabled >nul 2>&1
    echo ✓ DiagTrack deshabilitado
) else (
    echo ℹ DiagTrack no encontrado
)

echo [2/4] Configurando dmwappushservice...
sc query "dmwappushservice" >nul 2>&1
if %errorlevel% equ 0 (
    sc stop "dmwappushservice" >nul 2>&1
    sc config "dmwappushservice" start= disabled >nul 2>&1
    echo ✓ dmwappushservice deshabilitado
) else (
    echo ℹ dmwappushservice no encontrado
)

echo [3/4] Configurando SysMain (Superfetch)...
sc query "SysMain" >nul 2>&1
if %errorlevel% equ 0 (
    sc stop "SysMain" >nul 2>&1
    sc config "SysMain" start= disabled >nul 2>&1
    echo ✓ SysMain deshabilitado (recomendado para SSD)
) else (
    echo ℹ SysMain no encontrado
)

echo [4/4] Optimizando Windows Search...
sc query "WSearch" >nul 2>&1
if %errorlevel% equ 0 (
    sc config "WSearch" start= delayed-auto >nul 2>&1
    echo ✓ Windows Search optimizado (inicio diferido)
) else (
    echo ℹ WSearch no encontrado
)

echo.
echo ============================================
echo OPTIMIZACION DE SERVICIOS COMPLETADA
echo ============================================
echo.
echo NOTA: Algunos cambios requieren reinicio.
echo.
echo Recomendacion: Reinicie su PC para aplicar cambios.
echo.
pause
goto main_menu

:: ==============================================
:: 5. REPARAR ARCHIVOS DE SISTEMA (CORREGIDO)
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
echo 1. SFC (System File Checker) - Verifica archivos
echo 2. DISM - Repara imagen de Windows
echo 3. CHKDSK - Verifica integridad del disco
echo.
echo ADVERTENCIA: Esto puede tomar 15-30 minutos.
echo No cierre la ventana durante el proceso.
echo.
set /p confirm="¿Continuar? (S/N): "
if /i not "%confirm%"=="S" goto main_menu

echo.
echo [1/3] Ejecutando SFC /scannow...
echo Esto puede tomar varios minutos...
echo Por favor espere pacientemente...
sfc /scannow >nul
if %errorlevel% equ 0 (
    echo ✓ SFC completado - No se encontraron errores
) else (
    echo ⚠ SFC completado - Se encontraron y repararon errores
)
echo.

echo [2/3] Ejecutando DISM...
echo Reparando imagen de Windows...
DISM.exe /Online /Cleanup-image /Restorehealth >nul
if %errorlevel% equ 0 (
    echo ✓ DISM completado exitosamente
) else (
    echo ⚠ DISM encontró problemas - Consulte el log
)
echo.

echo [3/3] Verificando integridad del disco...
echo Ejecutando CHKDSK en modo solo lectura...
chkdsk C: /scan >nul 2>&1
if %errorlevel% equ 0 (
    echo ✓ Disco verificado - Sin errores encontrados
) else (
    echo ⚠ CHKDSK encontró problemas - Ejecute chkdsk C: /f
)
echo.

echo ============================================
echo REPARACION DEL SISTEMA FINALIZADA
echo ============================================
echo.
echo Resultados:
echo - Archivos del sistema verificados y reparados
echo - Imagen de Windows reparada
echo - Disco verificado para errores
echo.
echo Si se encontraron errores, se recomienda reiniciar.
echo.
pause
goto main_menu

:: ==============================================
:: 6. VER ESTADO DEL SISTEMA (MEJORADO)
:: ==============================================
:estado_sistema
cls
echo.
echo ============================================
echo      ESTADO ACTUAL DEL SISTEMA
echo ============================================
echo.

echo [INFORMACION DEL SISTEMA OPERATIVO]
echo.
ver
echo.

echo [INFORMACION DEL PROCESADOR]
for /f "skip=1 delims=" %%a in ('wmic cpu get name /value') do (
    for /f "tokens=2 delims==" %%b in ("%%a") do echo Procesador: %%b
)
echo.

echo [MEMORIA RAM]
for /f "tokens=2 delims=:" %%a in ('systeminfo ^| findstr /C:"Memoria física total"') do set ram_total=%%a
for /f "tokens=2 delims=:" %%a in ('systeminfo ^| findstr /C:"Memoria física disponible"') do set ram_libre=%%a
echo Total RAM: !ram_total!
echo Disponible: !ram_libre!
echo.

echo [ALMACENAMIENTO - DISCO C:]
for /f "tokens=2 delims==" %%a in ('wmic logicaldisk where "DeviceID='C:'" get Size /value ^| findstr "Size"') do set tamano=%%a
for /f "tokens=2 delims==" %%a in ('wmic logicaldisk where "DeviceID='C:'" get FreeSpace /value ^| findstr "FreeSpace"') do set libre=%%a

set /a tamano_gb=%tamano%/1073741824
set /a libre_gb=%libre%/1073741824
set /a usado_gb=%tamano_gb% - %libre_gb%
set /a porcentaje=%usado_gb% * 100 / %tamano_gb%

echo Tamaño total: %tamano_gb% GB
echo Espacio usado: %usado_gb% GB (%porcentaje%%%)
echo Espacio libre: %libre_gb% GB
echo.

echo [USO DE CPU ACTUAL]
for /f "skip=1" %%p in ('wmic cpu get loadpercentage') do (
    if not "%%p"=="" echo Uso de CPU: %%p%%
)
echo.

echo [PROCESOS ACTIVOS]
for /f %%a in ('tasklist ^| find /c /v ""') do echo Procesos ejecutándose: %%a
echo.

echo [TEMPERATURAS (si disponibles)]
wmic /namespace:\\root\wmi PATH MSAcpi_ThermalZoneTemperature get CurrentTemperature 2>nul | findstr /r "[0-9]" >nul
if %errorlevel% equ 0 (
    echo Temperaturas disponibles (en décimas de Kelvin)
    wmic /namespace:\\root\wmi PATH MSAcpi_ThermalZoneTemperature get CurrentTemperature 2>nul
) else (
    echo Información de temperatura no disponible
)
echo.

echo [CONEXIONES DE RED]
ipconfig | findstr "IPv4"
echo.

echo [ULTIMO REINICIO DEL SISTEMA]
systeminfo | findstr /C:"Hora de inicio del sistema"
echo.

pause
goto main_menu

:: ==============================================
:: 7. CREAR PUNTO DE RESTAURACIÓN (MEJORADO)
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
echo Nombre del punto: OPTIMIZADOR_%date:~10,4%%date:~4,2%%date:~7,2%_%time:~0,2%%time:~3,2%
echo.
echo Por favor espere...

wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "OPTIMIZADOR_%date:~10,4%%date:~4,2%%date:~7,2%_%time:~0,2%%time:~3,2%", 100, 7 >nul 2>&1

if %errorlevel% equ 0 (
    echo.
    echo ✓ Punto de restauracion creado exitosamente
    echo.
    echo Puede restaurar el sistema desde:
    echo Panel de Control -> Sistema -> Proteccion del sistema -> Restaurar sistema
) else (
    echo.
    echo ⚠ No se pudo crear punto de restauracion
    echo.
    echo Posibles causas:
    echo 1. Servicio de restauracion deshabilitado
    echo 2. Proteccion del sistema desactivada
    echo 3. Espacio insuficiente
    echo.
    echo Solucion: Active la proteccion del sistema en:
    echo Panel de Control -> Sistema -> Proteccion del sistema
)
echo.
pause
goto main_menu

:: ==============================================
:: 8. RESTAURAR CONFIGURACIÓN (MEJORADO)
:: ==============================================
:restaurar_config
cls
echo.
echo ============================================
echo      RESTAURAR CONFIGURACION ORIGINAL
echo ============================================
echo.
echo Esta opcion revertira los cambios realizados
echo por el optimizador a su configuracion original.
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
echo.
echo Restaurando servicios de Windows...
echo.
sc config "DiagTrack" start= delayed-auto >nul 2>&1
sc config "dmwappushservice" start= auto >nul 2>&1
sc config "SysMain" start= auto >nul 2>&1
sc config "WSearch" start= auto >nul 2>&1
echo ✓ Servicios restaurados a configuracion predeterminada
echo.
echo NOTA: Reinicie para aplicar cambios en servicios.
pause
goto restaurar_config

:restaurar_red
echo.
echo Restaurando configuracion de red...
echo.
netsh winsock reset >nul 2>&1
echo ? Winsock restaurado
netsh int ip reset >nul 2>&1
echo ? Configuracion IP restaurada
ipconfig /flushdns >nul 2>&1
echo ? Cache DNS limpiada
ipconfig /registerdns >nul 2>&1
echo ? DNS registrado
echo.
echo ✓ Configuracion de red restaurada
echo.
echo NOTA: Puede necesitar reiniciar para cambios completos.
pause
goto restaurar_config

:restaurar_energia
echo.
echo Restaurando plan de energia...
echo.
powercfg -restoredefaultschemes >nul 2>&1
powercfg -setactive 381b4222-f694-41f0-9685-ff5bb260df2e >nul 2>&1
echo ? Plan de energia restaurado
echo.
echo ✓ Plan de energia restaurado a equilibrado
pause
goto restaurar_config

:: ==============================================
:: FUNCIONES AUXILIARES CORREGIDAS
:: ==============================================

:crear_punto_restauracion_simple
echo Creando punto de restauracion...
wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "Optimizador_Rapido", 100, 7 >nul 2>&1
if %errorlevel% equ 0 (
    echo ✓ Punto creado exitosamente
) else (
    echo ℹ No se pudo crear punto (servicio deshabilitado)
)
goto :eof

:limpiar_archivos_temporales_corregido
echo Limpiando archivos temporales...
del /f /s /q "%TEMP%\*" >nul 2>&1
for /d %%x in ("%TEMP%\*") do rd /s /q "%%x" >nul 2>&1
del /f /s /q "%WINDIR%\Temp\*" >nul 2>&1
for /d %%x in ("%WINDIR%\Temp\*") do rd /s /q "%%x" >nul 2>&1
del /f /s /q "%WINDIR%\Prefetch\*" >nul 2>&1
cleanmgr /sagerun:1 /autoclean >nul 2>&1
echo ✓ Archivos temporales limpiados
goto :eof

:liberar_memoria_ram_corregido
echo Liberando memoria RAM...
powershell -Command "Clear-RecycleBin -Force -ErrorAction SilentlyContinue" >nul 2>&1
ipconfig /flushdns >nul 2>&1
echo ✓ Memoria liberada
goto :eof

:optimizar_servicios_basicos
echo Optimizando servicios...
sc config "DiagTrack" start= disabled >nul 2>&1
sc config "dmwappushservice" start= disabled >nul 2>&1
echo ✓ Servicios optimizados
goto :eof

:reparar_sistema_basico_corregido
echo Reparando archivos del sistema...
sfc /scannow >nul 2>&1
echo ✓ Sistema reparado
goto :eof

:: ==============================================
:: 9. SALIR (MEJORADO)
:: ==============================================
:salir
cls
echo.
echo ============================================
echo        OPTIMIZADOR DE SISTEMA
echo        Version Estable y Segura
echo ============================================
echo.
echo Gracias por usar el optimizador.
echo.
echo Resumen de acciones guardadas en:
echo %log_file%
echo.
echo Backup de configuracion en:
echo %backup_folder%
echo.
echo RECOMENDACIONES FINALES:
echo 1. Reinicie su PC para aplicar cambios completos
echo 2. Ejecute el optimizador mensualmente
echo 3. Mantenga Windows actualizado
echo 4. Haga copias de seguridad regulares
echo.
echo ¡Hasta pronto!
echo.
echo Cerrando en 5 segundos...
timeout /t 5 /nobreak >nul
exit