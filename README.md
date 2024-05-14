# Script de Compressão de Vídeo em lote usando FFmpeg

## Pré-requisitos

FFmpeg Instalado: Certifique-se de que o [FFmpeg](https://ffmpeg.org/download.html#build-windows) está instalado em seu sistema. Este script requer que o FFmpeg esteja disponível no PATH do sistema para funcionar corretamente. Você pode verificar se o FFmpeg está instalado e acessível executando o seguinte comando no prompt de comando:

```batch
ffmpeg -version
```

Este comando deve exibir a versão do FFmpeg e algumas informações de configuração. Se você receber uma mensagem dizendo que 'ffmpeg' não é reconhecido como um comando válido, verifique novamente as [instruções de instalação](https://www.wikihow.com/Install-FFmpeg-on-Windows).

## Configuração do Script

### Editar os Caminhos do Script

Abra o arquivo de script .bat em um editor de texto de sua preferência.
Localize a linha que define SOURCE_DIR, ela define o caminho da pasta de entrada:.

```batch
set "SOURCE_DIR=C:\Usuarios\..."
```

Modifique os caminhos após SOURCE_DIR= e OUTPUT_DIR= para os diretórios que você deseja usar como sua pasta de entrada e saída. Certifique-se de que os caminhos estão corretos e que as pastas existem. Se a pasta de saída não existir, o script tentará criar uma.

### Ajustar o Fator de Compressão (CRF)

O CRF (Constant Rate Factor) é um parâmetro que controla a qualidade da compressão do vídeo. Valores menores resultam em melhor qualidade e maior tamanho de arquivo, enquanto valores maiores reduzem a qualidade e o tamanho do arquivo.

No script, o CRF padrão é definido como 24:

```batch
set "CRF=24"
```

Você pode alterar esse valor diretamente no script ou passar um valor diferente como argumento ao executar o script.

## Executando o Script

### Abrir o Prompt de Comando

Pressione Win + R, digite cmd e pressione Enter para abrir o Prompt de Comando.

Navegar até o Diretório do Script:

Use o comando cd para navegar até o diretório onde o arquivo .bat está salvo. Por exemplo:

```cmd
cd C:\Users\ivanp\Desktop\ffmpeg_test
```

### Executar o Script

Você pode executar o script diretamente se estiver satisfeito com o CRF padrão:

```cmd
nome_do_script.bat
```

Para especificar um valor de CRF diferente ao executar o script, passe o valor como o primeiro argumento:

```cmd
nome_do_script.bat 28
```

## Observações Finais

A execução do script iniciará a compressão de todos os arquivos .mp4 encontrados no diretório de entrada especificado, replicando a estrutura de diretório na pasta de saída e armazenando lá os arquivos comprimidos.

Acompanhe a janela do Prompt de Comando para qualquer mensagem de erro e para a confirmação de conclusão da compressão.

Este processo pode levar algum tempo dependendo do número e do tamanho dos vídeos a serem processados.