CREATE DATABASE leaf  CHARACTER SET utf8 COLLATE utf8_general_ci;;
CREATE TABLE leaf.`leaf_alloc` (
	  `biz_tag` varchar(128)  NOT NULL DEFAULT '',
	  `max_id` bigint(20) NOT NULL DEFAULT '1',
	  `step` int(11) NOT NULL,
	  `description` varchar(256)  DEFAULT NULL,
	  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	  PRIMARY KEY (`biz_tag`)
) ENGINE=InnoDB;

insert into leaf.leaf_alloc(biz_tag, max_id, step, description) values('leaf-segment-test', 1, 2000, 'Test leaf Segment Mode Get Id')
