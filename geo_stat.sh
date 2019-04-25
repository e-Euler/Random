streams=$(netstat -ano | grep "tcp\|udp\|raw" | cut -f 2 -d ":" > connections.txt && cut connections.txt  -d " " -f 7);
for p in $streams;
do
  echo "$p:";
  whois $p | grep "Country\|OrgName";
done

