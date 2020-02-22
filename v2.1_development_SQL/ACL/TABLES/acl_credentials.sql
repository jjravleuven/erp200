DROP TABLE public.acl_credentials;
DROP SEQUENCE IF EXISTS acl_credentials_id_seq;

BEGIN;

	CREATE SEQUENCE IF NOT EXISTS public.acl_credentials_id_seq START 1;
	CREATE TABLE IF NOT EXISTS public.acl_credentials (
		id bigint DEFAULT nextval('acl_credentials_id_seq'::regclass) NOT NULL,
		user_id bigint,
		login_id bigint,
		group_id bigint,
		role_id bigint,
		modules integer[],
		location integer[] DEFAULT '{}'::integer[] NOT NULL,
		locations integer[] DEFAULT '{}'::integer[] NOT NULL,
		note_id bigint,
		PRIMARY KEY(id)
	);
	
	-- Insert batch #1
	INSERT INTO public.acl_credentials (id, user_id, login_id, group_id, role_id, modules, location, locations, note_id) VALUES
	(1, 1, 1, 1, 1, '{1,2,16,3,4,5,8,10}', '{1,2,3,4,5,6,7,13,14,15}', '{1,2,3,4,5,6,7,13,14,15}', 0),
	(2, 7, 2, 1, 1, '{1,2,16,3,4,5,8,10}', '{1,2,3,4,5,6,7,13,14,15}', '{1,2,3,4,5,6,7,13,14,15}', 0),
	(10, 8, 3, 1, 4, '{1,2,16,3,4,5,8,10}', '{1,2,3,4,5,6,7,13,14,15}', '{1,2,3,4,5,6,7,13,14,15}', 0),
	(11, 9, 6, 1, 4, '{1,2,16,3,4,5,8,10}', '{1,2,3,4,5,6,7,13,14,15}', '{1,2,3,4,5,6,7,13,14,15}', 0),
	(12, 10, 7, 1, 4, '{1,2,16,3,4,5,8,10}', '{1,2,3,4,5,6,7,13,14,15}', '{1,2,3,4,5,6,7,13,14,15}', 0),
	(13, 11, 8, 2, 2, '{1,16,3,4,5,10,8}', '{6,14,1,2,3}', '{6,14,1,2,3}', 0),
	(14, 12, 9, 2, 2, '{1,16,3,4,5,10,8}', '{6,14,1,2,3}', '{6,14,1,2,3}', 0),
	(15, 13, 10, 1, 4, '{1,2,16,3,4,5,8,10}', '{1,2,3,4}', '{1,2,3,4}', 0),
	(16, 14, 1, 5, 2, '{1,2,16,3,4,5,8,10}', '{1,2,3}', '{1,2,3}', 0),
	(17, 15, 12, 2, 2, '{1,16,3,4,5,10,8}', '{13,1,2,3}', '{13,1,2,3}', 0),
	(18, 16, 13, 2, 2, '{1,16,3,4,5,10,8}', '{13,1,2,3}', '{13,1,2,3}', 0),
	(19, 19, 16, 2, 2, '{1,16,3,4,5,10,8}', '{6,14,1,2,3}', '{6,14,1,2,3}', 0),
	(20, 20, 17, 2, 2, '{1,16,3,4,5,10,8}', '{14,6,1,2,3}', '{14,6,1,2,3}', 0),
	(21, 17, 14, 2, 2, '{1,16,3,4,5,10,8}', '{6,14,1,2,3}', '{6,14,1,2,3}', 0),
	(22, 18, 15, 2, 2, '{1,16,3,4,5,10,8}', '{6,14,1,2,3}', '{6,14,1,2,3}', 0),
	(23, 21, 18, 2, 4, '{1,3,4,5,8}', '{5,1,2,3}', '{5,1,2,3}', 0),
	(24, 22, 19, 2, 4, '{1,3,4,5,8}', '{5,1,2,3}', '{5,1,2,3}', 0),
	(25, 23, 20, 2, 4, '{1,3,4,5,8}', '{5,1,2,3}', '{5,1,2,3}', 0),
	(26, 24, 21, 2, 4, '{1,3,4,5,8}', '{5,1,2,3}', '{5,1,2,3}', 0),
	(27, 25, 22, 2, 4, '{1,3,4,5,8}', '{5,1,2,3}', '{5,1,2,3}', 0),
	(28, 26, 23, 2, 4, '{1,3,4,5,8}', '{22,1,2,3}', '{22,1,2,3}', 0),
	(29, 27, 24, 2, 4, '{1,3,4,5,8}', '{22,1,2,3}', '{22,1,2,3}', 0),
	(30, 28, 25, 2, 4, '{1,3,4,5,8}', '{22,1,2,3}', '{22,1,2,3}', 0),
	(31, 29, 26, 2, 4, '{1,3,4,5,8}', '{22,1,2,3}', '{22,1,2,3}', 0),
	(32, 30, 27, 2, 4, '{1,3,4,5,8}', '{22,1,2,3}', '{22,1,2,3}', 0),
	(37, 36, 33, 1, 4, '{1,2,16,3,4,5,8,10}', '{1,2,3,4}', '{1,2,3,4}', 0),
	(38, 37, 34, 1, 4, '{1,2,16,3,4,5,8,10}', '{1,2,3,4}', '{1,2,3,4}', 0),
	(39, 38, 35, 1, 4, '{1,2,16,3,4,5,8,10}', '{1,2,3,4}', '{1,2,3,4}', 0),
	(40, 39, 36, 1, 4, '{1,2,16,3,4,5,8,10}', '{1,2,3,4}', '{1,2,3,4}', 0),
	(41, 40, 37, 1, 4, '{1,2,16,3,4,5,8,10}', '{1,2,3,4}', '{1,2,3,4}', 0),
	(42, 41, 38, 1, 4, '{1,2,16,3,4,5,8,10}', '{1,2,3,4}', '{1,2,3,4}', 0),
	(43, 42, 39, 1, 4, '{1,2,16,3,4,5,8,10}', '{1,2,3,4}', '{1,2,3,4}', 0),
	(44, 43, 40, 1, 4, '{1,2,16,3,4,5,8,10}', '{1,2,3,4}', '{1,2,3,4}', 0),
	(45, 44, 41, 1, 4, '{1,2,16,3,4,5,8,10}', '{1,2,3,4}', '{1,2,3,4}', 0),
	(46, 45, 42, 1, 4, '{1,2,16,3,4,5,8,10}', '{1,2,3,4}', '{1,2,3,4}', 0),
	(47, 46, 43, 1, 4, '{1,2,16,3,4,5,8,10}', '{1,2,3,4}', '{1,2,3,4}', 0),
	(48, 47, 44, 1, 4, '{1,2,16,3,4,5,8,10}', '{1,2,3,4}', '{1,2,3,4}', 0);

COMMIT;

END;