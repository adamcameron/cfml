component {

	public boolean function needsAdminAccess() roles="admin" {
		return true;
	}

	public boolean function needsWriteAccess() roles="write" {
		return true;
	}

	public boolean function needsReadAccess() roles="read" {
		return true;
	}

	public boolean function doesNotNeedAccess() {
		return true;
	}

}