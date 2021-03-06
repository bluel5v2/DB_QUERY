set heading off
set pagesize 0
set linesize 200
set timing on

SELECT SEGMENT_TYPE, SEGMENT_NAME, TABLESPACE_NAME, TRUNC((SUM(BYTES)/1024)/1024,2) as "size(MB)"
FROM DBA_SEGMENTS    
WHERE SEGMENT_TYPE IN ('TABLE', 'INDEX', 'TABLE PARTITION', 'TABLE SUBPARTITION')
and owner = 'TAS'
GROUP BY SEGMENT_TYPE , SEGMENT_NAME, TABLESPACE_NAME
ORDER BY 1 desc, "size(MB)" desc;



SELECT SEGMENT_TYPE, SEGMENT_NAME, TABLESPACE_NAME, TRUNC((SUM(BYTES)/1024)/1024,2) as "size(MB)"
FROM DBA_SEGMENTS    
WHERE SEGMENT_TYPE IN ('TABLE', 'INDEX', 'TABLE PARTITION', 'TABLE SUBPARTITION')
and owner = 'TAS'
and TABLESPACE_NAME = 'LOG'
GROUP BY SEGMENT_TYPE , SEGMENT_NAME, TABLESPACE_NAME
ORDER BY 1 desc, "size(MB)" desc;


quit
