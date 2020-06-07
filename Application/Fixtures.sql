

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

ALTER TABLE public.posts DISABLE TRIGGER ALL;

INSERT INTO public.posts (id, title, body, created_at) VALUES ('4ef48ade-e7f0-4afb-b4d9-5d4d1f7b9b86', 'Hello World!', 'Lorem ipsum *dolor sit amet*, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam. **This is the IHP Blog Demo App**. 

Lorem ipsum *dolor sit amet*, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam', '2020-06-07 13:10:04.340407+02');


ALTER TABLE public.posts ENABLE TRIGGER ALL;


ALTER TABLE public.comments DISABLE TRIGGER ALL;

INSERT INTO public.comments (id, post_id, author, body, created_at) VALUES ('1de9007a-b690-4f2d-a76e-d08cc7d8e308', '4ef48ade-e7f0-4afb-b4d9-5d4d1f7b9b86', 'Marc', 'This is the first comment!', '2020-06-07 13:11:22.07897+02');
INSERT INTO public.comments (id, post_id, author, body, created_at) VALUES ('7386928d-a6fc-4f20-ada9-333c32345453', '4ef48ade-e7f0-4afb-b4d9-5d4d1f7b9b86', 'Marc', 'This is a second comment!', '2020-06-07 13:11:30.718887+02');


ALTER TABLE public.comments ENABLE TRIGGER ALL;


