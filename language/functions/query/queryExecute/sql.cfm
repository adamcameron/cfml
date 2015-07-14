<cfscript>
param url.userName = "";
param url.userEmail = "";
sql = '
    select userId, userName, userEmail
    from users
    where userStatus = "active"
	#url.userName.len() ? 'and userName = :userName' : ''#
	#url.userEmail.len() ? 'and userEmail = :userEmail' : ''#
';
writeDump(variables);
</cfscript>
