<cfscript>
	// testMockedUserDAO.cfm
	dao = new testapp.users.MockedUserDAO();
	zinny = dao.getUserById(1);
	dan = dao.getUserByLogin("leftarm", "spin");

	writeDump(var=[dao,zinny,dan]);
</cfscript>