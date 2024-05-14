@echo off
setlocal enabledelayedexpansion

rem Hora de inicio
set "START_TIME=%TIME%"

rem Pasta de origem contendo os arquivos MP4 originais
set "SOURCE_DIR=C:\Usuarios\..."

rem Pasta de destino onde os arquivos compactados serao salvos
set "OUTPUT_DIR=%SOURCE_DIR%\..\output"

rem Cria a pasta de destino se ela nao existir
if not exist "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"

rem Define fator de compressao
set "CRF=24"
rem Verifica se um valor de CRF foi passado como argumento na linha de comando
if "%~1" neq "" set "CRF=%~1"

rem Contador de videos processados
set /a "COUNT=0"

rem Funcao para comprimir os arquivos de video diretamente da pasta de origem para a pasta de destino
for /R "%SOURCE_DIR%" %%F in (*.mp4) do (
  rem Extrai o caminho completo do arquivo atual
  set "CURRENT_DIR=%%~dpF"
  
  rem Substitui o caminho da pasta de origem pelo da pasta de destino no caminho atual
  set "DEST_DIR=!CURRENT_DIR:%SOURCE_DIR%=%OUTPUT_DIR%!"

  rem Cria a subpasta de destino se ela nao existir
  if not exist "!DEST_DIR!" mkdir "!DEST_DIR!"

  rem Extrai o nome do arquivo sem extensao
  set "FILENAME=%%~nF"
  
  rem Define o caminho de destino do arquivo compactado
  set "OUTPUT_FILE=!DEST_DIR!\%%~nF_crf_%CRF%.mp4"
  
  rem Comprime o arquivo e salva-o no diretorio de destino
  ffmpeg -i "%%F" -vcodec libx264 -crf "!CRF!" "!OUTPUT_FILE!"
  
  rem Incrementa o contador de videos
  set /a "COUNT+=1"
)

echo Compressao concluida.
echo Hora de inicio: %START_TIME%
echo Hora atual: %TIME%
echo Total de videos convertidos: %COUNT%
pause
endlocal
