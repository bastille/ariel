-- Copyright 2019, Oath Inc.
-- Licensed under the terms of the Apache License, Version 2.0. See LICENSE file for terms.
SET client_min_messages TO warning;

CREATE TABLE reserved_instances_usage
(
    region                  character varying(20)       NOT NULL, -- ap-northeast-3 + 6
    instancetypefamily      character varying(5)        NOT NULL, -- r5ad + 1
    tenancy                 character varying(9)        NOT NULL, -- [Dedicated, Host, Shared]
    operatingsystem         character varying(7)        NOT NULL, -- [Linux, RHEL, SUSE, Windows]
    total_ri_units          int                         NOT NULL,
    total_instance_units    int                         NOT NULL,
    floating_ri_units       int                         NOT NULL,
    floating_instance_units int                         NOT NULL,
    unused_ri_units         int                         NOT NULL,
    coverage_chance         double precision            NOT NULL,
    xl_effective_rate       money                       NOT NULL,
    monthly_ri_cost         money                       NOT NULL,
    monthly_od_cost         money                       NOT NULL,
    monthly_ri_savings      money                       NOT NULL,
	PRIMARY KEY (region, instancetypefamily, tenancy, operatingsystem)
) WITH ( OIDS=FALSE );
GRANT ALL ON TABLE reserved_instances_usage TO aurora_dbo;
GRANT SELECT, UPDATE, INSERT, DELETE, TRUNCATE ON TABLE reserved_instances_usage TO ariel_rw;
GRANT SELECT ON TABLE reserved_instances_usage TO ariel_ro;
