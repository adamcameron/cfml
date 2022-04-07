import testbox.system.BaseSpec

component extends=BaseSpec {

    function run() {
        describe("Tests FTP server operations", () => {

            aroundEach((spec) => {
                try {
                    spec.body()
                } finally {
                    try {
                        cfftp(action="close", connection="ftpConnection")
                    }catch(any _) {
                        // NOP
                    }
                }
            })

            it("accepts connections", () => {
                connectionResult = makeFtpConnection()
                expect(connectionResult.succeeded).toBeTrue()
            })

            it("puts and gets a file", () => {
                try {
                    connectionResult = makeFtpConnection()
                    expect(connectionResult.succeeded).toBeTrue("Could not create connection: test aborted")

                    fileName = createGuid()
                    srcFileName = fileName & ".src"
                    destFileName = fileName & ".dest"

                    tempDir = getTempDirectory()
                    srcFilePath = tempDir & srcFileName
                    destFilePath = tempDir & destFileName

                    fileWrite(srcFilePath, createGuid())

                    remoteFile = srcFileName

                    cfftp(
                        connection="ftpConnection"
                        action="putFile",
                        localFile = srcFilePath,
                        remoteFile = remoteFile
                        result = "putResult"
                    )
                    expect(putResult.succeeded).toBeTrue("put failed")

                    cfftp(
                        connection="ftpConnection"
                        action="getFile",
                        remoteFile = remoteFile
                        localFile = destFilePath,
                        result = "getResult"
                    )
                    expect(getResult.succeeded).toBeTrue("get failed")
                    expect(fileRead(destFilePath)).toBe(fileRead(srcFilePath))
                } finally {
                    try {
                        fileDelete(srcFilePath)
                    }catch (any _){
                        //NOP
                    }
                    try {
                        fileDelete(destFilePath)
                    }catch (any _){
                        //NOP
                    }
                }
            })
        })
    }

    function makeFtpConnection() {
        cfftp(
            action = "open",
            connection = "ftpConnection",
            server = "ftp.backend",
            username = server.system.environment.FTP_USER,
            password = server.system.environment.FTP_USER_PASSWORD,
            stopOnError = true,
            result = "connectionResult"
        )
        return connectionResult
    }
}
