

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.users DISABLE TRIGGER ALL;

INSERT INTO public.users (id, email, password_hash, locked_at, failed_login_attempts) VALUES ('9f563e7a-eaf6-4629-920c-165f6dc03562', 'daniel@digitallyinduced.com', 'sha256|17|6ok5wosHG4fndz8PVOqQmQ==|bL11xiCmLx5ZePdf3MoPgb6keGgHacZEX3e4V2qOJx8=', NULL, 0);
INSERT INTO public.users (id, email, password_hash, locked_at, failed_login_attempts) VALUES ('2d78bb96-342c-4413-8d88-a8e321e08f53', 'daniel@digitallyinduced.com', 'sha256|17|9H9HhisEo6NYc6naoENeLw==|yHolD2GGPKnqRTGRH4LAb97IKXnQ2sAjQD8Etm73kTU=', NULL, 0);
INSERT INTO public.users (id, email, password_hash, locked_at, failed_login_attempts) VALUES ('9c3253cc-8bfe-44d5-a2bd-71d68541fbc9', 'daniel@digitallyinduced.com', 'sha256|17|PHrQu9flAGbENBwm+mZyqA==|XVlBvsI9eotjPii+OEmtUmDYli2zKhgoZKBW3GKZXn4=', NULL, 0);


ALTER TABLE public.users ENABLE TRIGGER ALL;


ALTER TABLE public.posts DISABLE TRIGGER ALL;



ALTER TABLE public.posts ENABLE TRIGGER ALL;


ALTER TABLE public.comments DISABLE TRIGGER ALL;



ALTER TABLE public.comments ENABLE TRIGGER ALL;


