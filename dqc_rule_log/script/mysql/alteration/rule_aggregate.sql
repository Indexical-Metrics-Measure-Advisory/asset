-- procedure for topic[id=5700628841835566017, name=rule_aggregate]
DROP PROCEDURE IF EXISTS SCHEMA_CHANGE;
DELIMITER $$
CREATE PROCEDURE SCHEMA_CHANGE() 
BEGIN 
	DECLARE CurrentDatabase VARCHAR(100);

	SELECT DATABASE() INTO CurrentDatabase;

	-- will not drop any column even it is not in definition, just keep it
	IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = CurrentDatabase AND TABLE_NAME = 'topic_rule_aggregate' AND COLUMN_NAME = 'count') THEN  
		-- add columns
		ALTER TABLE topic_rule_aggregate ADD COLUMN count DECIMAL(32,6);
	ELSE
		-- modify columns
		ALTER TABLE topic_rule_aggregate MODIFY COLUMN count DECIMAL(32,6);
	END IF;
	IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = CurrentDatabase AND TABLE_NAME = 'topic_rule_aggregate' AND COLUMN_NAME = 'factorid') THEN  
		-- add columns
		ALTER TABLE topic_rule_aggregate ADD COLUMN factorid VARCHAR(255);
	ELSE
		-- modify columns
		ALTER TABLE topic_rule_aggregate MODIFY COLUMN factorid VARCHAR(255);
	END IF;
	IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = CurrentDatabase AND TABLE_NAME = 'topic_rule_aggregate' AND COLUMN_NAME = 'rulecode') THEN  
		-- add columns
		ALTER TABLE topic_rule_aggregate ADD COLUMN rulecode VARCHAR(255);
	ELSE
		-- modify columns
		ALTER TABLE topic_rule_aggregate MODIFY COLUMN rulecode VARCHAR(255);
	END IF;
	IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = CurrentDatabase AND TABLE_NAME = 'topic_rule_aggregate' AND COLUMN_NAME = 'topicid') THEN  
		-- add columns
		ALTER TABLE topic_rule_aggregate ADD COLUMN topicid VARCHAR(255);
	ELSE
		-- modify columns
		ALTER TABLE topic_rule_aggregate MODIFY COLUMN topicid VARCHAR(255);
	END IF;
	IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = CurrentDatabase AND TABLE_NAME = 'topic_rule_aggregate' AND COLUMN_NAME = 'aggregate_assist_') THEN  
		-- add columns
		ALTER TABLE topic_rule_aggregate ADD COLUMN aggregate_assist_ JSON;
	ELSE
		-- modify columns
		ALTER TABLE topic_rule_aggregate MODIFY COLUMN aggregate_assist_ JSON;
	END IF;
	IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = CurrentDatabase AND TABLE_NAME = 'topic_rule_aggregate' AND COLUMN_NAME = 'version_') THEN  
		-- add columns
		ALTER TABLE topic_rule_aggregate ADD COLUMN version_ INT;
	ELSE
		-- modify columns
		ALTER TABLE topic_rule_aggregate MODIFY COLUMN version_ INT;
	END IF;
	IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = CurrentDatabase AND TABLE_NAME = 'topic_rule_aggregate' AND COLUMN_NAME = 'tenant_id_') THEN  
		-- add columns
		ALTER TABLE topic_rule_aggregate ADD COLUMN tenant_id_ VARCHAR(32);
	ELSE
		-- modify columns
		ALTER TABLE topic_rule_aggregate MODIFY COLUMN tenant_id_ VARCHAR(32);
	END IF;
	IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = CurrentDatabase AND TABLE_NAME = 'topic_rule_aggregate' AND COLUMN_NAME = 'insert_time_') THEN  
		-- add columns
		ALTER TABLE topic_rule_aggregate ADD COLUMN insert_time_ DATETIME;
	ELSE
		-- modify columns
		ALTER TABLE topic_rule_aggregate MODIFY COLUMN insert_time_ DATETIME;
	END IF;
	IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = CurrentDatabase AND TABLE_NAME = 'topic_rule_aggregate' AND COLUMN_NAME = 'update_time_') THEN  
		-- add columns
		ALTER TABLE topic_rule_aggregate ADD COLUMN update_time_ DATETIME;
	ELSE
		-- modify columns
		ALTER TABLE topic_rule_aggregate MODIFY COLUMN update_time_ DATETIME;
	END IF;

	-- drop existed indexes
	-- simply uncomment the following loop to drop all exists indexes
	-- considering performance of rebuild indexes, manually drop useless indexes accurate is recommended.
	-- according to duplication check of index names, following create scripts need to be adjusted manually as well.
	-- SELECT INDEX_NAME INTO @indexName FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = CurrentDatabase AND TABLE_NAME = 'topic_rule_aggregate' AND INDEX_NAME <> 'PRIMARY' LIMIT 1;
	-- WHILE @indexName IS NOT NULL DO
	--	SET @sql = concat('DROP INDEX ', @indexName, ' ON topic_rule_aggregate;');
	--	PREPARE stmt FROM @sql;
	--	EXECUTE stmt;
	--	DEALLOCATE PREPARE stmt;
	--	SELECT INDEX_NAME INTO @indexName FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = CurrentDatabase AND TABLE_NAME = 'topic_rule_aggregate' AND INDEX_NAME <> 'PRIMARY' LIMIT 1;
	-- END WHILE;
	
	-- unique index


	-- index

	CREATE INDEX i_rule_aggregate_tenant_id_ ON topic_rule_aggregate (tenant_id_);
	CREATE INDEX i_rule_aggregate_insert_time_ ON topic_rule_aggregate (insert_time_);
	CREATE INDEX i_rule_aggregate_update_time_ ON topic_rule_aggregate (update_time_);
END $$
DELIMITER ;
CALL `SCHEMA_CHANGE`();
DROP PROCEDURE IF EXISTS SCHEMA_CHANGE;
