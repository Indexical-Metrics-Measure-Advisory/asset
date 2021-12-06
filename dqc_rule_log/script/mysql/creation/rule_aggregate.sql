-- sqls for topic[id=5700628841835566017, name=rule_aggregate]
-- drop, commented default
-- DROP TABLE IF EXISTS topic_rule_aggregate;

-- create 
CREATE TABLE topic_rule_aggregate(
	id_ BIGINT,
	count DECIMAL(32,6),
	factorid VARCHAR(255),
	rulecode VARCHAR(255),
	topicid VARCHAR(255),
	aggregate_assist_ JSON,
	version_ INT,
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

