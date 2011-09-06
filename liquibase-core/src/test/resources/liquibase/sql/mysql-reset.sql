set global time_zone = '+00:00';
drop database if exists tmp;
create database tmp;
create table tmp.ts (producer_offset integer, utc timestamp, current timestamp);

