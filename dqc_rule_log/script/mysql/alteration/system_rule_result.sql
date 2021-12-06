-- procedure for topic[id=5700521016861133314, name=system_rule_result]
DROP PROCEDURE IF EXISTS SCHEMA_CHANGE;
DELIMITER $$
CREATE PROCEDURE SCHEMA_CHANGE() 
BEGIN 
	DECLARE CurrentDatabase VARCHAR(100);

	SELECT DATABASE() INTO CurrentDatabase;

	-- will not drop any column even it is not in definition, just keep it
	IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = CurrentDatabase AND TABLE_NAME = 'topic_system_rule_result' AND COLUMN_NAME = 'factorid') THEN  
		-- add columns
		ALTER TABLE topic_system_rule_result ADD COLUMN factorid VARCHAR(255);
	ELSE
		-- modify columns
		ALTER TABLE topic_system_rule_result MODIFY COLUMN factorid VARCHAR(255);
	END IF;
	IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = CurrentDatabase AND TABLE_NAME = 'topic_system_rule_result' AND COLUMN_NAME = 'factorname') THEN  
		-- add columns
		ALTER TABLE topic_system_rule_result ADD COLUMN factorname VARCHAR(255);
	ELSE
		-- modify columns
		ALTER TABLE topic_system_rule_result MODIFY COLUMN factorname VARCHAR(255);
	END IF;
	IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = CurrentDatabase AND TABLE_NAME = 'topic_system_rule_result' AND COLUMN_NAME = 'result') THEN  
		-- add columns
		ALTER TABLE topic_system_rule_result ADD COLUMN result VARCHAR(5);
	ELSE
		-- modify columns
		ALTER TABLE topic_system_rule_result MODIFY COLUMN result VARCHAR(5);
	END IF;
	IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = CurrentDatabase AND TABLE_NAME = 'topic_system_rule_result' AND COLUMN_NAME = 'rulecode') THEN  
		-- add columns
		ALTER TABLE topic_system_rule_result ADD COLUMN rulecode VARCHAR(255);
	ELSE
		-- modify columns
		ALTER TABLE topic_system_rule_result MODIFY COLUMN rulecode VARCHAR(255);
	END IF;
	IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = CurrentDatabase AND TABLE_NAME = 'topic_system_rule_result' AND COLUMN_NAME = 'severity') THEN  
		-- add columns
		ALTER TABLE topic_system_rule_result ADD COLUMN severity VARCHAR(255);
	ELSE
		-- modify columns
		ALTER TABLE topic_system_rule_result MODIFY COLUMN severity VARCHAR(255);
	END IF;
	IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = CurrentDatabase AND TABLE_NAME = 'topic_system_rule_result' AND COLUMN_NAME = 'topicid') THEN  
		-- add columns
		ALTER TABLE topic_system_rule_result ADD COLUMN topicid VARCHAR(255);
	ELSE
		-- modify columns
		ALTER TABLE topic_system_rule_result MODIFY COLUMN topicid VARCHAR(255);
	END IF;
	IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = CurrentDatabase AND TABLE_NAME = 'topic_system_rule_result' AND COLUMN_NAME = 'topicname') THEN  
		-- add columns
		ALTER TABLE topic_system_rule_result ADD COLUMN topicname VARCHAR(255);
	ELSE
		-- modify columns
		ALTER TABLE topic_system_rule_result MODIFY COLUMN topicname VARCHAR(255);
	END IF;


	IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = CurrentDatabase AND TABLE_NAME = 'topic_system_rule_result' AND COLUMN_NAME = 'tenant_id_') THEN  
		-- add columns
		ALTER TABLE topic_system_rule_result ADD COLUMN tenant_id_ VARCHAR(32);
	ELSE
		-- modify columns
		ALTER TABLE topic_system_rule_result MODIFY COLUMN tenant_id_ VARCHAR(32);
	END IF;
	IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = CurrentDatabase AND TABLE_NAME = 'topic_system_rule_result' AND COLUMN_NAME = 'insert_time_') THEN  
		-- add columns
		ALTER TABLE topic_system_rule_result ADD COLUMN insert_time_ DATETIME;
	ELSE
		-- modify columns
		ALTER TABLE topic_system_rule_result MODIFY COLUMN insert_time_ DATETIME;
	END IF;
	IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = CurrentDatabase AND TABLE_NAME = 'topic_system_rule_result' AND COLUMN_NAME = 'update_time_') THEN  
		-- add columns
		ALTER TABLE topic_system_rule_result ADD COLUMN update_time_ DATETIME;
	ELSE
		-- modify columns
		ALTER TABLE topic_system_rule_result MODIFY COLUMN update_time_ DATETIME;
	END IF;

	-- drop existed indexes
	-- simply uncomment the following loop to drop all exists indexes
	-- considering performance of rebuild indexes, manually drop useless indexes accurate is recommended.
	-- according to duplication check of index names, following create scripts need to be adjusted manually as well.
	-- SELECT INDEX_NAME INTO @indexName FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = CurrentDatabase AND TABLE_NAME = 'topic_system_rule_result' AND INDEX_NAME <> 'PRIMARY' LIMIT 1;
	-- WHILE @indexName IS NOT NULL DO
	--	SET @sql = concat('DROP INDEX ', @indexName, ' ON topic_system_rule_result;');
	--	PREPARE stmt FROM @sql;
	--	EXECUTE stmt;
	--	DEALLOCATE PREPARE stmt;
	--	SELECT INDEX_NAME INTO @indexName FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = CurrentDatabase AND TABLE_NAME = 'topic_system_rule_result' AND INDEX_NAME <> 'PRIMARY' LIMIT 1;
	-- END WHILE;
	
	-- unique index


	-- index

	CREATE INDEX i_system_rule_result_tenant_id_ ON topic_system_rule_result (tenant_id_);
	CREATE INDEX i_system_rule_result_insert_time_ ON topic_system_rule_result (insert_time_);
	CREATE INDEX i_system_rule_result_update_time_ ON topic_system_rule_result (update_time_);
END $$
DELIMITER ;
CALL `SCHEMA_CHANGE`();
DROP PROCEDURE IF EXISTS SCHEMA_CHANGE;
