@echo off
setlocal enabledelayedexpansion

:: Cadena a buscar y cadena de reemplazo
set "CADENA_ANTIGUA=OF"
set "CADENA_NUEVA=BOTTOM"

echo ============================================
echo Archivos que contienen "%CADENA_ANTIGUA%" en el nombre (incluyendo subcarpetas):
echo ============================================

set "hayCoincidencias=false"

:: Listar archivos recursivamente
for /r %%f in (*.mp4 *.avi *.mkv) do (
    set "archivo=%%~nxf"
    if not "!archivo:%CADENA_ANTIGUA%=!"=="!archivo!" (
        echo %%f
        set "hayCoincidencias=true"
    )
)

if "%hayCoincidencias%"=="false" (
    echo No se encontraron archivos con la cadena "%CADENA_ANTIGUA%".
    goto :fin
)

echo ============================================
set /p CONFIRM="¿Quieres renombrar estos archivos? (S/N): "

if /I "%CONFIRM%"=="S" (
    for /r %%f in (*.mp4 *.avi *.mkv) do (
        set "archivo=%%~nxf"
        set "nuevo_nombre=!archivo:%CADENA_ANTIGUA%=%CADENA_NUEVA%!"
        
        if not "!archivo!"=="!nuevo_nombre!" (
            ren "%%f" "!nuevo_nombre!"
            echo Renombrado: %%f → !nuevo_nombre!
        )
    )
) else (
    echo Operación cancelada.
)

:fin
endlocal
pause