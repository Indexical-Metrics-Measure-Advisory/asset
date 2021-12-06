-- sqls for topic[id=5700521016861133314, name=system_rule_result]
-- drop, commented default
-- DROP TABLE topic_system_rule_result;

-- create 
CREATE TABLE topic_system_rule_result(
	id_ NUMBER(20),
	FACTORID VARCHAR2(255),
	FACTORNAME VARCHAR2(255),
	RESULT VARCHAR2(5),
	RULECODE VARCHAR2(255),
	SEVERITY VARCHAR2(255),
	TOPICID VARCHAR2(255),
	TOPICNAME VARCHAR2(255),


	tenant_id_ VARCHAR2(32),
	insert_time_ DATE,
	update_time_ DATE,

	-- primary key
	PRIMARY KEY (id_)
);

-- unique index


-- index

CREATE INDEX i_system_rule_result_tenant_id_ ON topic_system_rule_result (tenant_id_);
CREATE INDEX i_system_rule_result_insert_time_ ON topic_system_rule_result (insert_time_);
CREATE INDEX i_system_rule_result_update_time_ ON topic_system_rule_result (update_time_);
