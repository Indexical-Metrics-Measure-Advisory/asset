-- procedure for topic[id=5700628841835566017, name=rule_aggregate]
CREATE OR REPLACE PROCEDURE SCHEMA_CHANGE AS
	CURSOR cursorIndexes IS SELECT UI.INDEX_NAME
		FROM USER_INDEXES UI
		WHERE UI.TABLE_NAME = 'topic_rule_aggregate'
        AND NOT EXISTS (SELECT 1 FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'topic_rule_aggregate' AND CONSTRAINT_TYPE = 'P' AND CONSTRAINT_NAME = UI.INDEX_NAME);
    columnExists NUMBER;
BEGIN 
	-- will not drop any column even it is not in definition, just keep it
	SELECT COUNT(1) INTO columnExists FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'topic_rule_aggregate' AND COLUMN_NAME = 'count';
	IF columnExists = 0 THEN  
		-- add columns
	    EXECUTE IMMEDIATE 'ALTER TABLE topic_rule_aggregate ADD (count NUMBER(32,6))';
	ELSE
		-- modify columns
		EXECUTE IMMEDIATE 'ALTER TABLE topic_rule_aggregate MODIFY (count NUMBER(32,6))';
	END IF;
	SELECT COUNT(1) INTO columnExists FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'topic_rule_aggregate' AND COLUMN_NAME = 'factorid';
	IF columnExists = 0 THEN  
		-- add columns
	    EXECUTE IMMEDIATE 'ALTER TABLE topic_rule_aggregate ADD (factorid VARCHAR2(255))';
	ELSE
		-- modify columns
		EXECUTE IMMEDIATE 'ALTER TABLE topic_rule_aggregate MODIFY (factorid VARCHAR2(255))';
	END IF;
	SELECT COUNT(1) INTO columnExists FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'topic_rule_aggregate' AND COLUMN_NAME = 'rulecode';
	IF columnExists = 0 THEN  
		-- add columns
	    EXECUTE IMMEDIATE 'ALTER TABLE topic_rule_aggregate ADD (rulecode VARCHAR2(255))';
	ELSE
		-- modify columns
		EXECUTE IMMEDIATE 'ALTER TABLE topic_rule_aggregate MODIFY (rulecode VARCHAR2(255))';
	END IF;
	SELECT COUNT(1) INTO columnExists FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'topic_rule_aggregate' AND COLUMN_NAME = 'topicid';
	IF columnExists = 0 THEN  
		-- add columns
	    EXECUTE IMMEDIATE 'ALTER TABLE topic_rule_aggregate ADD (topicid VARCHAR2(255))';
	ELSE
		-- modify columns
		EXECUTE IMMEDIATE 'ALTER TABLE topic_rule_aggregate MODIFY (topicid VARCHAR2(255))';
	END IF;
	SELECT COUNT(1) INTO columnExists FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'topic_rule_aggregate' AND COLUMN_NAME = 'aggregate_assist_';
	IF columnExists = 0 THEN  
		-- add columns
	    EXECUTE IMMEDIATE 'ALTER TABLE topic_rule_aggregate ADD (aggregate_assist_ VARCHAR2(1024))';
	ELSE
		-- modify columns
		EXECUTE IMMEDIATE 'ALTER TABLE topic_rule_aggregate MODIFY (aggregate_assist_ VARCHAR2(1024))';
	END IF;
	SELECT COUNT(1) INTO columnExists FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'topic_rule_aggregate' AND COLUMN_NAME = 'version_';
	IF columnExists = 0 THEN  
		-- add columns
	    EXECUTE IMMEDIATE 'ALTER TABLE topic_rule_aggregate ADD (version_ NUMBER(8))';
	ELSE
		-- modify columns
		EXECUTE IMMEDIATE 'ALTER TABLE topic_rule_aggregate MODIFY (version_ NUMBER(8))';
	END IF;
	SELECT COUNT(1) INTO columnExists FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'topic_rule_aggregate' AND COLUMN_NAME = 'tenant_id_';
	IF columnExists = 0 THEN  
		-- add columns
	    EXECUTE IMMEDIATE 'ALTER TABLE topic_rule_aggregate ADD (tenant_id_ VARCHAR2(32))';
	ELSE
		-- modify columns
		EXECUTE IMMEDIATE 'ALTER TABLE topic_rule_aggregate MODIFY (tenant_id_ VARCHAR2(32))';
	END IF;
	SELECT COUNT(1) INTO columnExists FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'topic_rule_aggregate' AND COLUMN_NAME = 'insert_time_';
	IF columnExists = 0 THEN  
		-- add columns
	    EXECUTE IMMEDIATE 'ALTER TABLE topic_rule_aggregate ADD (insert_time_ DATE)';
	ELSE
		-- modify columns
		EXECUTE IMMEDIATE 'ALTER TABLE topic_rule_aggregate MODIFY (insert_time_ DATE)';
	END IF;
	SELECT COUNT(1) INTO columnExists FROM USER_TAB_COLUMNS WHERE TABLE_NAME = 'topic_rule_aggregate' AND COLUMN_NAME = 'update_time_';
	IF columnExists = 0 THEN  
		-- add columns
	    EXECUTE IMMEDIATE 'ALTER TABLE topic_rule_aggregate ADD (update_time_ DATE)';
	ELSE
		-- modify columns
		EXECUTE IMMEDIATE 'ALTER TABLE topic_rule_aggregate MODIFY (update_time_ DATE)';
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

	EXECUTE IMMEDIATE 'CREATE INDEX i_rule_aggregate_tenant_id_ ON topic_rule_aggregate (tenant_id_)';
	EXECUTE IMMEDIATE 'CREATE INDEX i_rule_aggregate_insert_time_ ON topic_rule_aggregate (insert_time_)';
	EXECUTE IMMEDIATE 'CREATE INDEX i_rule_aggregate_update_time_ ON topic_rule_aggregate (update_time_)';
END;
CALL SCHEMA_CHANGE();
DROP PROCEDURE SCHEMA_CHANGE;
