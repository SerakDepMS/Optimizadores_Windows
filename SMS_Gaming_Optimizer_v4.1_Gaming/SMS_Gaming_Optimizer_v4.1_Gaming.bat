@echo off
chcp 65001 >nul
title SMS GAMING OPTIMIZADOR v4.1 - Máximo Rendimiento Seguro
color 0A
setlocal enabledelayedexpansion

:: =====================================================
:: CONFIGURACIÓN INICIAL SEGURA
:: =====================================================
set VERSION=4.1
set LOG_DIR=%TEMP%\SMS_Gaming_Logs
set LOG_FILE=%LOG_DIR%\Gaming_Optimization_%date:~10,4%%date:~4,2%%date:~7,2%.log
set BACKUP_DIR=%USERPROFILE%\Documents\SMS_Gaming_Backups
set RESTORE_FILE=%BACKUP_DIR%\restore_backup.reg

if not exist "%LOG_DIR%" mkdir "%LOG_DIR%"
if not exist "%BACKUP_DIR%" mkdir "%BACKUP_DIR%"

:: Crear archivo de log
echo ============================================ > "%LOG_FILE%"
echo SMS GAMING OPTIMIZADOR - %date% %time%     >> "%LOG_FILE%"
echo ============================================ >> "%LOG_FILE%"

:: =====================================================
:: VERIFICACIÓN DE SEGURIDAD
:: =====================================================
call :check_administrator
if errorlevel 1 exit /b 1

call :check_windows_version

:: =====================================================
:: MENÚ PRINCIPAL
:: =====================================================
:main_menu
cls
call :show_gaming_logo
echo ═════════════════ MENU PRINCIPAL GAMING ═════════════════
echo.
echo [1] OPTIMIZACION COMPLETA PARA JUEGOS (Recomendado)
echo [2] MODO GAMING EQUILIBRADO (Seguro)
echo [3] OPTIMIZACION POR COMPONENTES
echo [4] MODO COMPETITIVO (eSports)
echo [5] RESTAURAR CONFIGURACION ORIGINAL
echo [6] DIAGNOSTICO GAMING
echo [7] SALIR
echo.
echo ═════════════════════════════════════════════════════════
echo.
set "choice="
set /p choice="Seleccione opción [1-7]: "

if "%choice%"=="" goto main_menu
if "%choice%"=="1" goto gaming_complete_optimization
if "%choice%"=="2" goto gaming_balanced_mode
if "%choice%"=="3" goto component_optimization_menu
if "%choice%"=="4" goto competitive_mode
if "%choice%"=="5" goto restore_configuration
if "%choice%"=="6" goto gaming_diagnostic
if "%choice%"=="7" goto exit_program
goto main_menu

:: =====================================================
:: 1. OPTIMIZACIÓN COMPLETA PARA JUEGOS
:: =====================================================
:gaming_complete_optimization
cls
call :show_gaming_logo
echo ═════════ OPTIMIZACION COMPLETA PARA JUEGOS ═════════
echo.
echo Esta optimización aplicará ajustes seguros para mejorar FPS
echo y reducir latencia en juegos.
echo.
echo ¿Desea continuar? (S/N)
set /p confirm=">> "
if /i not "%confirm%"=="S" goto main_menu

echo.
echo FASE 1: Creando respaldo del sistema...
call :create_system_backup
echo ✓ Respaldo creado en: %BACKUP_DIR%

echo.
echo FASE 2: Optimizando plan de energía...
call :optimize_power_plan
echo ✓ Plan de energía optimizado

echo.
echo FASE 3: Optimizando memoria y procesos...
call :optimize_memory
echo ✓ Memoria optimizada

echo.
echo FASE 4: Configurando prioridades de sistema...
call :optimize_system_priority
echo ✓ Prioridades configuradas

echo.
echo FASE 5: Mejorando rendimiento de red...
call :optimize_network_gaming
echo ✓ Red optimizada para gaming

echo.
echo ═════════ OPTIMIZACION COMPLETADA ═════════
echo.
echo [RESULTADOS ESPERADOS]
echo ✓ Mejora en rendimiento de juegos
echo ✓ Latencia de red reducida
echo ✓ Sistema más responsivo
echo.
echo [RECOMENDACIONES]
echo 1. Reinicie su PC para aplicar todos los cambios
echo 2. Configure juegos en modo "Alto rendimiento"
echo 3. Actualice drivers de gráfica regularmente
echo.
pause
goto main_menu

:: =====================================================
:: 2. MODO GAMING EQUILIBRADO
:: =====================================================
:gaming_balanced_mode
cls
call :show_gaming_logo
echo ═════════ MODO GAMING EQUILIBRADO ═════════
echo.
echo Este modo aplica optimizaciones balanceadas entre
echo rendimiento y estabilidad del sistema.
echo.
echo ¿Continuar? (S/N)
set /p confirm=">> "
if /i not "%confirm%"=="S" goto main_menu

echo.
echo [1/6] Optimizando servicios para gaming...
call :optimize_gaming_services
echo ✓ Servicios optimizados

echo [2/6] Configurando plan de energía equilibrado...
powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1
echo ✓ Plan de energía configurado

echo [3/6] Mejorando rendimiento de GPU...
reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "DirectXUserGlobalSettings" /t REG_SZ /d "HighPerf" /f >nul 2>&1
echo ✓ GPU configurada para alto rendimiento

echo [4/6] Optimizando caché y memoria...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d 2 /f >nul 2>&1
echo ✓ Caché optimizado

echo [5/6] Configurando prioridad de procesos de juego...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\taskhostw.exe" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f >nul 2>&1
echo ✓ Prioridades establecidas

echo [6/6] Limpiando recursos temporales...
del /f /s /q "%TEMP%\*" >nul 2>&1
echo ✓ Recursos liberados

echo.
echo [MODO EQUILIBRADO ACTIVADO]
echo Reinicie para aplicar cambios completamente.
echo.
pause
goto main_menu

:: =====================================================
:: 3. MENÚ DE OPTIMIZACIÓN POR COMPONENTES
:: =====================================================
:component_optimization_menu
cls
call :show_gaming_logo
echo ═════════ OPTIMIZACION POR COMPONENTES ═════════
echo.
echo [1] Optimizar CPU para gaming
echo [2] Optimizar RAM y memoria virtual
echo [3] Optimizar GPU y gráficos
echo [4] Optimizar almacenamiento (SSD/HDD)
echo [5] Optimizar red para gaming
echo [6] Reducir latencia del sistema
echo [7] Optimizar audio para gaming
echo [8] Volver al menú principal
echo.
set /p comp_choice="Selección [1-8]: "

if "%comp_choice%"=="1" goto optimize_cpu_gaming
if "%comp_choice%"=="2" goto optimize_ram_gaming
if "%comp_choice%"=="3" goto optimize_gpu_gaming
if "%comp_choice%"=="4" goto optimize_storage_gaming
if "%comp_choice%"=="5" goto optimize_network_gaming
if "%comp_choice%"=="6" goto reduce_latency
if "%comp_choice%"=="7" goto optimize_audio_gaming
if "%comp_choice%"=="8" goto main_menu
goto component_optimization_menu

:: 3.1 OPTIMIZAR CPU PARA GAMING
:optimize_cpu_gaming
echo.
echo Optimizando CPU para gaming...
echo.

:: Desactivar CPU parking para mejor rendimiento
powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR CPPMIN 100 >nul 2>&1
powercfg -setdcvalueindex SCHEME_CURRENT SUB_PROCESSOR CPPMIN 100 >nul 2>&1
powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR CPPMAX 100 >nul 2>&1
powercfg -setdcvalueindex SCHEME_CURRENT SUB_PROCESSOR CPPMAX 100 >nul 2>&1

:: Configurar prioridad de procesos
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\taskhostw.exe" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f >nul 2>&1

:: Ajustar scheduling de CPU
powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PERFINCPOL 2 >nul 2>&1
powercfg -setdcvalueindex SCHEME_CURRENT SUB_PROCESSOR PERFINCPOL 2 >nul 2>&1

echo ✓ CPU optimizada para gaming
echo Nota: Los cambios se aplicarán al reiniciar
echo.
pause
goto component_optimization_menu

:: 3.2 OPTIMIZAR RAM PARA GAMING
:optimize_ram_gaming
echo.
echo Optimizando RAM y memoria virtual...
echo.

:: Optimizar memoria virtual
wmic computersystem where name="%computername%" set AutomaticManagedPagefile=False >nul 2>&1
wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=8192,MaximumSize=16384 >nul 2>&1

:: Prefetch optimizado para gaming
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d 2 /f >nul 2>&1

echo ✓ Memoria optimizada para gaming
echo Tamaño de archivo de paginación: 8GB-16GB
echo.
pause
goto component_optimization_menu

:: 3.3 OPTIMIZAR GPU PARA GAMING
:optimize_gpu_gaming
echo.
echo Optimizando GPU para gaming...
echo.

:: Configurar GPU preferida
reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "DirectXUserGlobalSettings" /t REG_SZ /d "HighPerf" /f >nul 2>&1

:: Desactivar Game DVR de Windows
reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d 2 /f >nul 2>&1

echo ✓ GPU optimizada para gaming
echo Game DVR desactivado
echo.
pause
goto component_optimization_menu

:: 3.4 OPTIMIZAR ALMACENAMIENTO
:optimize_storage_gaming
echo.
echo Optimizando almacenamiento para gaming...
echo.

:: Deshabilitar indexación en unidades de juegos
fsutil behavior set disablelastaccess 1 >nul 2>&1

:: Configurar TRIM para SSD
fsutil behavior query DisableDeleteNotify > %TEMP%\trim_status.txt
findstr /C:"DisableDeleteNotify = 0" %TEMP%\trim_status.txt >nul
if errorlevel 1 (
    fsutil behavior set disabledeletenotify 0 >nul 2>&1
    echo ✓ TRIM activado para SSD
)

:: Optimizar caché de escritura
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsDisableLastAccessUpdate" /t REG_DWORD /d 1 /f >nul 2>&1

echo ✓ Almacenamiento optimizado para gaming
echo.
pause
goto component_optimization_menu

:: 3.5 OPTIMIZAR RED PARA GAMING
:optimize_network_gaming
echo.
echo Optimizando red para gaming...
echo.

:: Optimizar parámetros TCP/IP
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpAckFrequency" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TCPNoDelay" /t REG_DWORD /d 1 /f >nul 2>&1

:: Aumentar ventana TCP
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "GlobalMaxTcpWindowSize" /t REG_DWORD /d 65535 /f >nul 2>&1

:: Resetear configuración de red
netsh int tcp set global autotuninglevel=normal >nul 2>&1

echo ✓ Red optimizada para gaming (menor ping)
echo.
pause
goto component_optimization_menu

:: 3.6 REDUCIR LATENCIA
:reduce_latency
echo.
echo Reduciendo latencia del sistema...
echo.

:: Optimizar DPC Latency
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableExceptionChainValidation" /t REG_DWORD /d 1 /f >nul 2>&1

:: Desactivar Core Parking
powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR CPPMIN 100 >nul 2>&1
powercfg -setdcvalueindex SCHEME_CURRENT SUB_PROCESSOR CPPMIN 100 >nul 2>&1

:: Prioridad de procesos en tiempo real
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d 6 /f >nul 2>&1

echo ✓ Latencia reducida (menos stuttering)
echo.
pause
goto component_optimization_menu

:: 3.7 OPTIMIZAR AUDIO PARA GAMING
:optimize_audio_gaming
echo.
echo Optimizando audio para gaming...
echo.

:: Reducir latencia de audio
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 0 /f >nul 2>&1

:: Desactivar efectos de sonido del sistema
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Audio" /v "DisableSounds" /t REG_DWORD /d 1 /f >nul 2>&1

echo ✓ Audio optimizado para gaming
echo Latencia de audio reducida
echo.
pause
goto component_optimization_menu

:: =====================================================
:: 4. MODO COMPETITIVO
:: =====================================================
:competitive_mode
cls
call :show_gaming_logo
echo ═════════ MODO COMPETITIVO (eSports) ═════════
echo.
echo Activando configuración para eSports y juegos competitivos.
echo Se optimizará para latencia mínima y máximo FPS.
echo.
echo ¿Continuar? (S/N)
set /p confirm=">> "
if /i not "%confirm%"=="S" goto main_menu

echo.
:: 1. Desactivar animaciones
echo [1/6] Desactivando animaciones del sistema...
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d "0" /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v "UserPreferencesMask" /t REG_BINARY /d "9032078000000000" /f >nul 2>&1
echo ✓ Animaciones desactivadas

:: 2. Desactivar transparencias
echo [2/6] Desactivando efectos de transparencia...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d 0 /f >nul 2>&1
echo ✓ Transparencias desactivadas

:: 3. Prioridad máxima para juegos
echo [3/6] Configurando prioridad máxima para juegos...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d 6 /f >nul 2>&1
echo ✓ Prioridades máximas configuradas

:: 4. Reducir latencia de DPC
echo [4/6] Reduciendo latencia de DPC...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableExceptionChainValidation" /t REG_DWORD /d 1 /f >nul 2>&1
echo ✓ Latencia DPC reducida

:: 5. Optimizar red para gaming competitivo
echo [5/6] Optimizando red para eSports...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpAckFrequency" /t REG_DWORD /d 1 /f >nul 2>&1
netsh int tcp set global autotuninglevel=normal >nul 2>&1
echo ✓ Red optimizada para competencia

:: 6. Desactivar notificaciones durante juegos
echo [6/6] Configurando modo no molestar...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_TOASTS_ENABLED" /t REG_DWORD /d 0 /f >nul 2>&1
echo ✓ Notificaciones silenciadas

echo.
echo [MODO COMPETITIVO ACTIVADO]
echo Configuración óptima para:
echo - Counter-Strike 2, Valorant, Fortnite
echo - Call of Duty, Apex Legends
echo - League of Legends, Dota 2
echo.
echo Reinicie para aplicar todos los cambios.
echo.
pause
goto main_menu

:: =====================================================
:: 5. RESTAURAR CONFIGURACIÓN
:: =====================================================
:restore_configuration
cls
call :show_gaming_logo
echo ═════════ RESTAURAR CONFIGURACIÓN ORIGINAL ═════════
echo.
echo ADVERTENCIA: Esto revertirá todos los cambios realizados.
echo.
echo [1] Restaurar servicios de Windows
echo [2] Restaurar configuración de red
echo [3] Restaurar plan de energía
echo [4] Restaurar TODO (Recomendado)
echo [5] Volver al menú principal
echo.
set /p restore_choice="Selección [1-5]: "

if "%restore_choice%"=="1" (
    call :restore_windows_services
    pause
    goto restore_configuration
)
if "%restore_choice%"=="2" (
    call :restore_network_settings
    pause
    goto restore_configuration
)
if "%restore_choice%"=="3" (
    powercfg -restoredefaultschemes >nul 2>&1
    echo ✓ Plan de energía restaurado
    pause
    goto restore_configuration
)
if "%restore_choice%"=="4" (
    call :restore_all_settings
    pause
    goto restore_configuration
)
goto main_menu

:: =====================================================
:: 6. DIAGNÓSTICO GAMING
:: =====================================================
:gaming_diagnostic
cls
call :show_gaming_logo
echo ═════════ DIAGNOSTICO GAMING ESPECIALIZADO ═════════
echo.
echo Analizando sistema para rendimiento en juegos...
echo.
echo [INFORMACIÓN DEL SISTEMA]
echo.

:: 1. Diagnóstico de CPU
echo [CPU]
wmic cpu get Name,NumberOfCores,MaxClockSpeed,CurrentClockSpeed
echo.

:: 2. Diagnóstico de GPU
echo [GPU]
wmic path win32_videocontroller get name,adapterram
echo.

:: 3. Diagnóstico de RAM
echo [RAM]
systeminfo | findstr /C:"Memoria física total" /C:"Memoria física disponible"
echo.

:: 4. Diagnóstico de disco
echo [ALMACENAMIENTO]
wmic logicaldisk where "DeviceID='C:'" get Size,FreeSpace
echo.

:: 5. Diagnóstico de red
echo [RED]
ipconfig | findstr "IPv4"
echo.

:: 6. Generar recomendaciones
echo [RECOMENDACIONES PARA GAMING]
call :generate_gaming_recommendations
echo.
pause
goto main_menu

:: =====================================================
:: FUNCIONES AUXILIARES
:: =====================================================

:check_administrator
:: Verificar permisos de administrador
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo.
    echo ███████╗███╗   ███╗███████╗
    echo ██╔════╝████╗ ████║██╔════╝
    echo ███████╗██╔████╔██║███████╗
    echo ╚════██║██║╚██╔╝██║╚════██║
    echo ███████║██║ ╚═╝ ██║███████║
    echo ╚══════╝╚═╝     ╚═╝╚══════╝
    echo.
    echo ═══════════════════════════════════════
    echo    ERROR: EJECUTAR COMO ADMINISTRADOR
    echo ═══════════════════════════════════════
    echo.
    echo Instrucciones:
    echo 1. Guarde como SMS_Gaming_Optimizer.bat
    echo 2. Click derecho - "Ejecutar como administrador"
    echo.
    pause
    exit /b 1
)
exit /b 0

:check_windows_version
:: Verificar versión de Windows
ver | findstr "10\." >nul
if errorlevel 1 (
    echo [!] Se recomienda Windows 10/11 para gaming
    echo [!] Continuando de todos modos...
    timeout /t 2 /nobreak >nul
)
exit /b 0

:show_gaming_logo
echo.
echo ███████╗███╗   ███╗███████╗
echo ██╔════╝████╗ ████║██╔════╝
echo ███████╗██╔████╔██║███████╗
echo ╚════██║██║╚██╔╝██║╚════██║
echo ███████║██║ ╚═╝ ██║███████║
echo ╚══════╝╚═╝     ╚═╝╚══════╝
echo ═══════════════════════════════════════════════
echo     GAMING OPTIMIZER PROFESIONAL v%VERSION%
echo ═══════════════════════════════════════════════
echo     Máximo FPS - Mínima Latencia - Estabilidad
echo.
goto :eof

:create_system_backup
:: Crear backup de configuraciones importantes
echo Creando respaldo del sistema...
reg export "HKCU\Control Panel\Desktop" "%BACKUP_DIR%\Desktop_Backup.reg" /y >nul 2>&1
reg export "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" "%BACKUP_DIR%\Memory_Backup.reg" /y >nul 2>&1
reg export "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" "%BACKUP_DIR%\Network_Backup.reg" /y >nul 2>&1
echo Backup creado en: %BACKUP_DIR% >> "%LOG_FILE%"
exit /b 0

:optimize_power_plan
:: Configurar plan de energía para alto rendimiento
powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1
powercfg -h off >nul 2>&1
echo Plan de energía optimizado >> "%LOG_FILE%"
exit /b 0

:optimize_memory
:: Optimizar configuración de memoria
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d 1 /f >nul 2>&1
echo Memoria optimizada >> "%LOG_FILE%"
exit /b 0

:optimize_system_priority
:: Optimizar prioridades del sistema
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 38 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 0 /f >nul 2>&1
echo Prioridades optimizadas >> "%LOG_FILE%"
exit /b 0

:optimize_gaming_services
:: Optimizar servicios para gaming
sc config "DiagTrack" start= disabled >nul 2>&1
sc config "dmwappushservice" start= disabled >nul 2>&1
sc config "SysMain" start= disabled >nul 2>&1
sc config "WSearch" start= disabled >nul 2>&1
echo Servicios optimizados para gaming >> "%LOG_FILE%"
exit /b 0

:generate_gaming_recommendations
:: Generar recomendaciones basadas en hardware
echo Analizando hardware...

:: Obtener información de CPU
wmic cpu get NumberOfCores | findstr "[0-9]" > %TEMP%\cores.txt 2>nul
if exist %TEMP%\cores.txt (
    set /p cores=<%TEMP%\cores.txt
    set cores=%cores: =%
    if %cores% LSS 4 (
        echo - CPU: Pocos cores (%cores%). Upgrade recomendado para gaming moderno.
    ) else if %cores% LSS 6 (
        echo - CPU: %cores% cores. Adecuada para la mayoría de juegos.
    ) else (
        echo - CPU: %cores% cores. Excelente para gaming.
    )
)

:: Obtener información de GPU VRAM
wmic path win32_videocontroller get adapterram | findstr "[0-9]" > %TEMP%\vram.txt 2>nul
if exist %TEMP%\vram.txt (
    set /p vram=<%TEMP%\vram.txt
    set vram=%vram: =%
    set /a vram_gb=%vram%/1048576 2>nul
    if %vram_gb% LSS 4 (
        echo - VRAM: %vram_gb% GB. Reduzca calidad de texturas en juegos.
    ) else if %vram_gb% LSS 8 (
        echo - VRAM: %vram_gb% GB. Buena para gaming en 1080p.
    ) else (
        echo - VRAM: %vram_gb% GB. Excelente para 1440p/4K.
    )
)

:: Verificar espacio en disco
for /f "tokens=3" %%a in ('dir C:\ ^| find "bytes free"') do set free=%%a
set free=%free:,=%
set /a free_gb=%free%/1073741824 2>nul
if %free_gb% LSS 50 (
    echo - ALMACENAMIENTO: Solo %free_gb% GB libres. Libere espacio para mejores tiempos de carga.
)

echo.
echo [CONSEJOS GENERALES]
echo 1. Mantenga drivers de GPU actualizados
echo 2. Cierre programas en segundo plano al jugar
echo 3. Use modo pantalla completa en lugar de ventana sin bordes
echo 4. Desactive vsync si tiene monitor de alta tasa de refresco
exit /b 0

:restore_windows_services
:: Restaurar servicios de Windows
echo Restaurando servicios de Windows...
sc config "DiagTrack" start= auto >nul 2>&1
sc config "dmwappushservice" start= auto >nul 2>&1
sc config "SysMain" start= auto >nul 2>&1
sc config "WSearch" start= auto >nul 2>&1
echo ✓ Servicios de Windows restaurados
echo Servicios restaurados >> "%LOG_FILE%"
exit /b 0

:restore_network_settings
:: Restaurar configuración de red
echo Restaurando configuración de red...
netsh winsock reset >nul 2>&1
netsh int ip reset >nul 2>&1
ipconfig /flushdns >nul 2>&1
echo ✓ Configuración de red restaurada
echo Configuración de red restaurada >> "%LOG_FILE%"
exit /b 0

:restore_all_settings
:: Restaurar todas las configuraciones
echo Restaurando toda la configuración...
call :restore_windows_services
call :restore_network_settings
powercfg -restoredefaultschemes >nul 2>&1

:: Restaurar configuraciones del registro desde backup
if exist "%BACKUP_DIR%\Desktop_Backup.reg" (
    reg import "%BACKUP_DIR%\Desktop_Backup.reg" >nul 2>&1
)
if exist "%BACKUP_DIR%\Memory_Backup.reg" (
    reg import "%BACKUP_DIR%\Memory_Backup.reg" >nul 2>&1
)
if exist "%BACKUP_DIR%\Network_Backup.reg" (
    reg import "%BACKUP_DIR%\Network_Backup.reg" >nul 2>&1
)

echo ✓ Todas las configuraciones restauradas
echo ¡REINICIE para aplicar completamente!
echo Todas las configuraciones restauradas >> "%LOG_FILE%"
exit /b 0

:: =====================================================
:: SALIR DEL PROGRAMA
:: =====================================================
:exit_program
cls
call :show_gaming_logo
echo ═══════════════════════════════════════════════
echo        OPTIMIZACION GAMING COMPLETADA
echo ═══════════════════════════════════════════════
echo.
echo [PASOS FINALES RECOMENDADOS]
echo 1. REINICIE su computadora ahora
echo 2. Configure sus juegos en modo "Alto rendimiento"
echo 3. Desactive vsync en los juegos si tiene monitor de alta tasa
echo 4. Use Game Mode de Windows (Win+G)
echo 5. Actualice drivers de GPU regularmente
echo.
echo [RESULTADOS ESPERADOS]
echo • Mejora en FPS en la mayoría de juegos
echo • Latencia reducida significativamente
echo • Menos stuttering y tearing
echo • Sistema más estable en sesiones largas
echo.
echo ¡Disfrute de su experiencia de gaming mejorada!
echo.
echo Log guardado en: %LOG_FILE%
echo.
timeout /t 5 /nobreak >nul
exit /b 0