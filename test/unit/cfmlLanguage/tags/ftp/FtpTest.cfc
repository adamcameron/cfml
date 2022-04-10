import testbox.system.BaseSpec
import cfmlLanguage.tags.ftp.FTP

component extends=BaseSpec {

    function run() {
        describe("Tests FTP adapter operations", () => {
            it("makes a connection equivalent to tag-based code", () => {
                ```
                <cfftp
                    action = "open"
                    connection = "tagConnection"
                    server = "ftp.backend"
                    username = "#server.system.environment.FTP_USER#"
                    password = "#server.system.environment.FTP_USER_PASSWORD#"
                    stopOnError = "true"
                    result = "tagResult"
                >
                ```
                adapterResult = cfmlLanguage.tags.ftp.FTP::adapter(
                    action = "open",
                    connection = "adapterConnection",
                    server = "ftp.backend",
                    username = server.system.environment.FTP_USER,
                    password = server.system.environment.FTP_USER_PASSWORD,
                    stopOnError = true
                )

                expect(adapterResult).toBe(tagResult)
            })

            it("closes a connection equivalent to tag-based code", () => {
                ```
                <cfftp
                    action = "open"
                    connection = "tagConnection"
                    server = "ftp.backend"
                    username = "#server.system.environment.FTP_USER#"
                    password = "#server.system.environment.FTP_USER_PASSWORD#"
                    stopOnError = "true"
                    result = "tagOpenResult"
                >
                <cfftp action="close" connection="tagConnection" result="tagCloseResult">
                ```
                adapterOpenResult = cfmlLanguage.tags.ftp.FTP::adapter(
                    action = "open",
                    connection = "adapterConnection",
                    server = "ftp.backend",
                    username = server.system.environment.FTP_USER,
                    password = server.system.environment.FTP_USER_PASSWORD,
                    stopOnError = true
                )
                adapterCloseResult = cfmlLanguage.tags.ftp.FTP::adapter(
                    action = "close",
                    connection = "adapterConnection"
                )

                expect(adapterCloseResult).toBe(tagCloseResult)
            })
        })
    }
}
