-- sqls for topic[id=5700521016861133314, name=system_rule_result]
-- drop, commented default
-- DROP TABLE IF EXISTS topic_system_rule_result;

-- create 
CREATE TABLE topic_system_rule_result(
	id_ BIGINT,
	factorid VARCHAR(255),
	factorname VARCHAR(255),
	result VARCHAR(5),
	rulecode VARCHAR(255),
	severity VARCHAR(255),
	topicid VARCHAR(255),
	topicname VARCHAR(255),


	tenant_id_ VARCHAR(32),
	insert_time_ DATETIME,
	update_time_ DATETIME,

	-- unique index


	-- index

	INDEX (tenant_id_),
	INDEX (insert_time_),
	INDEX (update_time_),

	-- primary key
	PRIMARY KEY (id_)
);

