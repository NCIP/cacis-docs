REM This script retrieves a list of files in an input directory and executes PCO transform on each file in the list.

FOR %%A IN (DIR /b *.XML) DO java -jar ..\saxon9he.jar "%%A" ..\XSLT\PCO.xslt > ..\PCO_Test_Out\PCO_CDA_%%A


