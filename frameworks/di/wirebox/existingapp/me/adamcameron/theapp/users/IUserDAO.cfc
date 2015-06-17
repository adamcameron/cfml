// IUserDao.cfc
interface {

	public query function getUserById(required numeric id);
	public query function getUserByLogin(required string loginId, required string password);

}