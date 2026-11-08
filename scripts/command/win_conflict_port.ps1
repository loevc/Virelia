
# ==========================================
# Windows 端口占用排查（Spring Boot）
# 目标端口：8081
# ==========================================

# 1. 查询占用 8081 端口的连接及 PID
netstat -ano | findstr :8081

# 2. 精确查询监听 8081 端口的进程 PID
Get-NetTCPConnection -LocalPort 8081 -State Listen |
    Select-Object LocalAddress, LocalPort, OwningProcess

# 3. 根据 PID 查看进程名称
tasklist /FI "PID eq 12345"

# 4. 查看进程详细信息（包括启动命令）
Get-CimInstance Win32_Process -Filter "ProcessId = 12345" |
    Select-Object ProcessId, Name, CommandLine

# 5. 查看当前所有 Java 进程及启动参数（需要 JDK）
jps -lv

# 6. 根据 PID 强制结束进程（确认后再执行）
taskkill /PID 12345 /F

# 7. 再次检查端口是否释放
netstat -ano | findstr :8081


# ==========================================
# 快捷操作：自动查询并结束占用端口的进程
# 注意：会强制终止进程，谨慎执行
# ==========================================

# 查询占用 8081 端口的 PID（去重）
$pids = Get-NetTCPConnection -LocalPort 8081 -State Listen |
    Select-Object -ExpandProperty OwningProcess -Unique

# 查看将要结束的进程
$pids | ForEach-Object {
    Get-Process -Id $_
}

# 强制结束占用端口的进程（取消下一行注释后执行）
# $pids | ForEach-Object { Stop-Process -Id $_ -Force }


# ==========================================
# 其他方案：修改 Spring Boot 服务端口
# ==========================================

# application.yml 配置：
# server:
#   port: 8082

# 启动 JAR 时覆盖端口：
# java -jar app.jar --server.port=8082
