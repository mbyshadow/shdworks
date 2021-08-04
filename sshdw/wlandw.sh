

enable

vlan database
  vlan ... ...
 exit


configure

interface 0/x 
  description ER-6P
 exit    
      
interface 0/x
  description ES-10XP

  vlan tagging ...
  vlan pvid ...
  vlan participation exclude ,,,
  vlan participation include ...
 
 exit


interface x/x
  description hp1
 exit
interface x/x
  description hp1
 exit
