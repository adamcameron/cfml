<CFLDAP ACTION="query"
NAME="qUSER_INFO"
SERVER="moonbase"
SCOPE="subtree"
USERNAME="adamtemp@shado.co.nz"
PASSWORD="adamtemp"
start="DC=shado,DC=co,DC=nz"
ATTRIBUTES="cn,mail,uid,dn"
FILTER="(cn=adam)"
>
<cfdump var="#qUSER_INFO#">

<CFLDAP ACTION="query"
NAME="qUSER_INFO"
SERVER="moonbase"
USERNAME="adamtemp@shado.co.nz"
PASSWORD="adamtemp"
START="DC=shado,DC=co,DC=nz"
SCOPE="subtree"
FILTER="(cn=adam)"
ATTRIBUTES="cn,mail,uid"><!---  --->
<cfdump var="#qUSER_INFO#">