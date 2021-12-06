-- procedure for topic[id=5700521016861133314, name=system_rule_result]
CREATE OR REPLACE PROCEDURE SCHEMA_CHANGE AS
	CURSOR cursorIndexes IS SELECT UI.INDEX_NAME
		FROM USER_INDEXES UI
		WHERE UI.TABLE_NAME = 'topic_system_rule_result'
        AND NOT EXISTS (SELECT 1 FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'topic_system_rule_result' AND CONSTRAINT_TYPE = 'P' AND CONSTRAINT_NAME = UI.INDEX_NAME);
    columnExists NUMBER;
BEGIN 
	-- will not drop any column even it is not in definition, just keep it
	SELECT COUNT(1) INTO columnExists FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'topic_system_rule_result' AND COLUMN_NAME = 'factorid';
	IF columnExists = 0 THEN  
		-- add columns
	    EXECUTE IMMEDIATE 'ALTER TABLE topic_system_rule_result ADD (factorid VARCHAR2(255))';
	ELSE
		-- modify columns
		EXECUTE IMMEDIATE 'ALTER TABLE topic_system_rule_result MODIFY (factorid VARCHAR2(255))';
	END IF;
	SELECT COUNT(1) INTO columnExists FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'topic_system_rule_result' AND COLUMN_NAME = 'factorname';
	IF columnExists = 0 THEN  
		-- add columns
	    EXECUTE IMMEDIATE 'ALTER TABLE topic_system_rule_result ADD (factorname VARCHAR2(255))';
	ELSE
		-- modify columns
		EXECUTE IMMEDIATE 'ALTER TABLE topic_system_rule_result MODIFY (factorname VARCHAR2(255))';
	END IF;
	SELECT COUNT(1) INTO columnExists FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'topic_system_rule_result' AND COLUMN_NAME = 'result';
	IF columnExists = 0 THEN  
		-- add columns
	    EXECUTE IMMEDIATE 'ALTER TABLE topic_system_rule_result ADD (result VARCHAR2(5))';
	ELSE
		-- modify columns
		EXECUTE IMMEDIATE 'ALTER TABLE topic_system_rule_result MODIFY (result VARCHAR2(5))';
	END IF;
	SELECT COUNT(1) INTO columnExists FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'topic_system_rule_result' AND COLUMN_NAME = 'rulecode';
	IF columnExists = 0 THEN  
		-- add columns
	    EXECUTE IMMEDIATE 'ALTER TABLE topic_system_rule_result ADD (rulecode VARCHAR2(255))';
	ELSE
		-- modify columns
		EXECUTE IMMEDIATE 'ALTER TABLE topic_system_rule_result MODIFY (rulecode VARCHAR2(255))';
	END IF;
	SELECT COUNT(1) INTO columnExists FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'topic_system_rule_result' AND COLUMN_NAME = 'severity';
	IF columnExists = 0 THEN  
		-- add columns
	    EXECUTE IMMEDIATE 'ALTER TABLE topic_system_rule_result ADD (severity VARCHAR2(255))';
	ELSE
		-- modify columns
		EXECUTE IMMEDIATE 'ALTER TABLE topic_system_rule_result MODIFY (severity VARCHAR2(255))';
	END IF;
	SELECT COUNT(1) INTO columnExists FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'topic_system_rule_result' AND COLUMN_NAME = 'topicid';
	IF columnExists = 0 THEN  
		-- add columns
	    EXECUTE IMMEDIATE 'ALTER TABLE topic_system_rule_result ADD (topicid VARCHAR2(255))';
	ELSE
		-- modify columns
		EXECUTE IMMEDIATE 'ALTER TABLE topic_system_rule_result MODIFY (topicid VARCHAR2(255))';
	END IF;
	SELECT COUNT(1) INTO columnExists FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'topic_system_rule_result' AND COLUMN_NAME = 'topicname';
	IF columnExists = 0 THEN  
		-- add columns
	    EXECUTE IMMEDIATE 'ALTER TABLE topic_system_rule_result ADD (topicname VARCHAR2(255))';
	ELSE
		-- modify columns
		EXECUTE IMMEDIATE 'ALTER TABLE topic_system_rule_result MODIFY (topicname VARCHAR2(255))';
	END IF;


	SELECT COUNT(1) INTO columnExists FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'topic_system_rule_result' AND COLUMN_NAME = 'tenant_id_';
	IF columnExists = 0 THEN  
		-- add columns
	    EXECUTE IMMEDIATE 'ALTER TABLE topic_system_rule_result ADD (tenant_id_ VARCHAR2(32))';
	ELSE
		-- modify columns
		EXECUTE IMMEDIATE 'ALTER TABLE topic_system_rule_result MODIFY (tenant_id_ VARCHAR2(32))';
	END IF;
	SELECT COUNT(1) INTO columnExists FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'topic_system_rule_result' AND COLUMN_NAME = 'insert_time_';
	IF columnExists = 0 THEN  
		-- add columns
	    EXECUTE IMMEDIATE 'ALTER TABLE topic_system_rule_result ADD (insert_time_ DATE)';
	ELSE
		-- modify columns
		EXECUTE IMMEDIATE 'ALTER TABLE topic_system_rule_result MODIFY (insert_time_ DATE)';
	END IF;
	SELECT COUNT(1) INTO columnExists FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'topic_system_rule_result' AND COLUMN_NAME = 'update_time_';
	IF columnExists = 0 THEN  
		-- add columns
	    EXECUTE IMMEDIATE 'ALTER TABLE topic_system_rule_result ADD (update_time_ DATE)';
	ELSE
		-- modify columns
		EXECUTE IMMEDIATE 'ALTER TABLE topic_system_rule_result MODIFY (update_time_ DATE)';
	END IF;

	-- drop existed indexes
	-- simply uncomment the following loop to drop all exists indexes
	-- considering performance of rebuild indexes, manually drop useless indexes accurate is recommended.
	-- according to duplication check of index names, following create scripts need to be adjusted manually as well.
	-- FOR anIndex in cursorIndexes LOOP
	-- 	EXECUTE IMMEDIATE CONCAT('DROP INDEX ', anIndex.INDEX_NAME);
	-- END LOOP;
	
	-- unique index


	-- index

	EXECUTE IMMEDIATE 'CREATE INDEX i_system_rule_result_tenant_id_ ON topic_system_rule_result (tenant_id_)';
	EXECUTE IMMEDIATE 'CREATE INDEX i_system_rule_result_insert_time_ ON topic_system_rule_result (insert_time_)';
	EXECUTE IMMEDIATE 'CREATE INDEX i_system_rule_result_update_time_ ON topic_system_rule_result (update_time_)';
END;
CALL SCHEMA_CHANGE();
DROP PROCEDURE SCHEMA_CHANGE;
