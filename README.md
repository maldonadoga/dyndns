#dyndns

##Purpose

Update the IP address at freedns.afraid.org when the dynamic wan ip has changed using a belkin router

##Funcionality
1. Reads belking html page with wan_ip information
2. Validate if it has changed compared to previous wan ip
3. If it has changed:
  * Update the new ip in freedns.afraid.org
  * Save new ip
4. End
