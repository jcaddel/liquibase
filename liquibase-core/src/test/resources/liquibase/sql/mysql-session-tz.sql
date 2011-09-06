use tmp;
set session time_zone = '-01:00';
insert into tmp.ts(producer_offset,utc,current) values (timestampdiff(hour,utc_timestamp,current_timestamp),utc_timestamp,current_timestamp);

set session time_zone = '+00:00';
insert into tmp.ts(producer_offset,utc,current) values (timestampdiff(hour,utc_timestamp,current_timestamp),utc_timestamp,current_timestamp);

set session time_zone = '+01:00';
insert into tmp.ts(producer_offset,utc,current) values (timestampdiff(hour,utc_timestamp,current_timestamp),utc_timestamp,current_timestamp);
