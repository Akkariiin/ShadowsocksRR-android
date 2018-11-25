package moe.yuruyuri.akkariiin.shadowsocksrr

class SystemTools {
    companion object {
        init {
            java.lang.System.loadLibrary("system-tools")
        }
    }

    external fun exec(cmd: String): Int
    external fun getABI(): String
    external fun sendfd(fd: Int, path: String): Int
    external fun jniclose(fd: Int)

}