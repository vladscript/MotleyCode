@echo off
setlocal enabledelayedexpansion

:: Directorio origen = carpeta actual
set "ORIGEN=%cd%"

:: Directorio destino = subcarpeta dentro de la carpeta actual
set "DESTINO=%cd%\Videos_FRONT"

:: Cadena a buscar en los nombres de archivo
set "CADENA=FRONT"

:: Archivo de log en el destino
set "LOG=%DESTINO%\copiados.log"

:: Crear directorio destino si no existe
if not exist "%DESTINO%" (
    mkdir "%DESTINO%"
)

:: Limpiar log previo
if exist "%LOG%" del "%LOG%"

echo ============================================
echo Copiando archivos que contienen "%CADENA%" en su nombre...
echo Origen: %ORIGEN%
echo Destino: %DESTINO%
echo Log: %LOG%
echo ============================================

:: Recorrer recursivamente los videos desde el current folder
for /r "%ORIGEN%" %%f in (*.mp4 *.avi *.mkv) do (
    set "archivo=%%~nxf"
    if not "!archivo:%CADENA%=!"=="!archivo!" (
        echo Copiando: %%f
        copy "%%f" "%DESTINO%" >nul
        echo %%f >> "%LOG%"
    )
)

echo ============================================
echo Proceso terminado. Revisa el log en:
echo %LOG%
echo ============================================

endlocal
pause