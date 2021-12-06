-- sqls for topic[id=5700628841835566017, name=rule_aggregate]
-- drop, commented default
-- DROP TABLE topic_rule_aggregate;

-- create 
CREATE TABLE topic_rule_aggregate(
	id_ NUMBER(20),
	COUNT NUMBER(32,6),
	FACTORID VARCHAR2(255),
	RULECODE VARCHAR2(255),
	TOPICID VARCHAR2(255),
	aggregate_assist_ VARCHAR2(1024),
	version_ NUMBER(8),
	tenant_id_ VARCHAR2(32),
	insert_time_ DATE,
	update_time_ DATE,

	-- primary key
	PRIMARY KEY (id_)
);

-- unique index


-- index

CREATE INDEX i_rule_aggregate_tenant_id_ ON topic_rule_aggregate (tenant_id_);
CREATE INDEX i_rule_aggregate_insert_time_ ON topic_rule_aggregate (insert_time_);
CREATE INDEX i_rule_aggregate_update_time_ ON topic_rule_aggregate (update_time_);
