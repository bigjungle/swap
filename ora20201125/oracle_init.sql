--用户口令不过期设置
ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED;
alter system set resource_limit=false;
--空表分配空间
alter system set deferred_segment_creation=false; 


--AWR快照情况
select dbms_stats.get_stats_history_retention from dual;
--AWR快照收集时间7天 
exec dbms_stats.alter_stats_history_retention(7);       

--查看审计功能是否开启？
show parameter audit_trail;
--关闭oracle的审计功能
alter system set audit_trail=FALSE scope=spfile;


--修改会话数
alter system set processes=512 scope=spfile; 
alter system set sessions=568 scope=spfile;

--重启数据库
shutdown immediate;
startup;

-- 修改Oracle11g用户密码不区分大小写
ALTER SYSTEM SET SEC_CASE_SENSITIVE_LOGON = FALSE;