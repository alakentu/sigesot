--
-- PostgreSQL database dump
--

-- Dumped from database version 16.8
-- Dumped by pg_dump version 16.8

-- Started on 2025-06-01 16:31:48

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

--
-- TOC entry 4951 (class 0 OID 41483)
-- Dependencies: 234
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (1, 'AF', 'Afganistán', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (2, 'AX', 'Islas Gland', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (3, 'AL', 'Albania', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (4, 'DE', 'Alemania', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (5, 'AD', 'Andorra', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (6, 'AO', 'Angola', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (7, 'AI', 'Anguilla', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (8, 'AQ', 'Antártida', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (9, 'AG', 'Antigua y Barbuda', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (10, 'AN', 'Antillas Holandesas', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (11, 'SA', 'Arabia Saudí', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (12, 'DZ', 'Argelia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (13, 'AR', 'Argentina', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (14, 'AM', 'Armenia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (15, 'AW', 'Aruba', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (16, 'AU', 'Australia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (17, 'AT', 'Austria', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (18, 'AZ', 'Azerbaiyán', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (19, 'BS', 'Bahamas', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (20, 'BH', 'Bahréin', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (21, 'BD', 'Bangladesh', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (22, 'BB', 'Barbados', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (23, 'BY', 'Bielorrusia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (24, 'BE', 'Bélgica', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (25, 'BZ', 'Belice', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (26, 'BJ', 'Benin', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (27, 'BM', 'Bermudas', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (28, 'BT', 'Bhután', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (29, 'BO', 'Bolivia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (30, 'BA', 'Bosnia y Herzegovina', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (31, 'BW', 'Botsuana', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (32, 'BV', 'Isla Bouvet', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (33, 'BR', 'Brasil', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (34, 'BN', 'Brunéi', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (35, 'BG', 'Bulgaria', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (36, 'BF', 'Burkina Faso', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (37, 'BI', 'Burundi', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (38, 'CV', 'Cabo Verde', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (39, 'KY', 'Islas Caimán', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (40, 'KH', 'Camboya', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (41, 'CM', 'Camerún', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (42, 'CA', 'Canadá', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (43, 'CF', 'República Centroafricana', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (44, 'TD', 'Chad', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (45, 'CZ', 'República Checa', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (46, 'CL', 'Chile', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (47, 'CN', 'China', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (48, 'CY', 'Chipre', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (49, 'CX', 'Isla de Navidad', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (50, 'VA', 'Ciudad del Vaticano', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (51, 'CC', 'Islas Cocos', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (52, 'CO', 'Colombia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (53, 'KM', 'Comoras', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (54, 'CD', 'República Democrática del Congo', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (55, 'CG', 'Congo', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (56, 'CK', 'Islas Cook', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (57, 'KP', 'Corea del Norte', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (58, 'KR', 'Corea del Sur', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (59, 'CI', 'Costa de Marfil', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (60, 'CR', 'Costa Rica', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (61, 'HR', 'Croacia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (62, 'CU', 'Cuba', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (63, 'DK', 'Dinamarca', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (64, 'DM', 'Dominica', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (65, 'DO', 'República Dominicana', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (66, 'EC', 'Ecuador', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (67, 'EG', 'Egipto', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (68, 'SV', 'El Salvador', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (69, 'AE', 'Emiratos Árabes Unidos', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (70, 'ER', 'Eritrea', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (71, 'SK', 'Eslovaquia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (72, 'SI', 'Eslovenia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (73, 'ES', 'España', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (74, 'UM', 'Islas ultramarinas de Estados Unidos', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (75, 'US', 'Estados Unidos', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (76, 'EE', 'Estonia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (77, 'ET', 'Etiopía', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (78, 'FO', 'Islas Feroe', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (79, 'PH', 'Filipinas', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (80, 'FI', 'Finlandia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (81, 'FJ', 'Fiyi', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (82, 'FR', 'Francia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (83, 'GA', 'Gabón', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (84, 'GM', 'Gambia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (85, 'GE', 'Georgia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (86, 'GS', 'Islas Georgias del Sur y Sandwich del Sur', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (87, 'GH', 'Ghana', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (88, 'GI', 'Gibraltar', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (89, 'GD', 'Granada', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (90, 'GR', 'Grecia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (91, 'GL', 'Groenlandia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (92, 'GP', 'Guadalupe', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (93, 'GU', 'Guam', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (94, 'GT', 'Guatemala', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (95, 'GF', 'Guayana Francesa', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (96, 'GN', 'Guinea', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (97, 'GQ', 'Guinea Ecuatorial', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (98, 'GW', 'Guinea-Bissau', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (99, 'GY', 'Guyana', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (100, 'HT', 'Haití', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (101, 'HM', 'Islas Heard y McDonald', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (102, 'HN', 'Honduras', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (103, 'HK', 'Hong Kong', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (104, 'HU', 'Hungría', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (105, 'IN', 'India', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (106, 'ID', 'Indonesia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (107, 'IR', 'Irán', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (108, 'IQ', 'Iraq', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (109, 'IE', 'Irlanda', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (110, 'IS', 'Islandia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (111, 'IL', 'Israel', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (112, 'IT', 'Italia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (113, 'JM', 'Jamaica', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (114, 'JP', 'Japón', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (115, 'JO', 'Jordania', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (116, 'KZ', 'Kazajstán', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (117, 'KE', 'Kenia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (118, 'KG', 'Kirguistán', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (119, 'KI', 'Kiribati', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (120, 'KW', 'Kuwait', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (121, 'LA', 'Laos', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (122, 'LS', 'Lesotho', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (123, 'LV', 'Letonia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (124, 'LB', 'Líbano', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (125, 'LR', 'Liberia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (126, 'LY', 'Libia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (127, 'LI', 'Liechtenstein', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (128, 'LT', 'Lituania', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (129, 'LU', 'Luxemburgo', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (130, 'MO', 'Macao', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (131, 'MK', 'ARY Macedonia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (132, 'MG', 'Madagascar', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (133, 'MY', 'Malasia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (134, 'MW', 'Malawi', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (135, 'MV', 'Maldivas', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (136, 'ML', 'Malí', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (137, 'MT', 'Malta', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (138, 'FK', 'Islas Malvinas', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (139, 'MP', 'Islas Marianas del Norte', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (140, 'MA', 'Marruecos', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (141, 'MH', 'Islas Marshall', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (142, 'MQ', 'Martinica', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (143, 'MU', 'Mauricio', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (144, 'MR', 'Mauritania', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (145, 'YT', 'Mayotte', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (146, 'MX', 'México', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (147, 'FM', 'Micronesia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (148, 'MD', 'Moldavia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (149, 'MC', 'Mónaco', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (150, 'MN', 'Mongolia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (151, 'MS', 'Montserrat', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (152, 'MZ', 'Mozambique', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (153, 'MM', 'Myanmar', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (154, 'NA', 'Namibia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (155, 'NR', 'Nauru', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (156, 'NP', 'Nepal', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (157, 'NI', 'Nicaragua', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (158, 'NE', 'Níger', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (159, 'NG', 'Nigeria', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (160, 'NU', 'Niue', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (161, 'NF', 'Isla Norfolk', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (162, 'NO', 'Noruega', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (163, 'NC', 'Nueva Caledonia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (164, 'NZ', 'Nueva Zelanda', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (165, 'OM', 'Omán', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (166, 'NL', 'Países Bajos', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (167, 'PK', 'Pakistán', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (168, 'PW', 'Palau', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (169, 'PS', 'Palestina', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (170, 'PA', 'Panamá', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (171, 'PG', 'Papúa Nueva Guinea', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (172, 'PY', 'Paraguay', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (173, 'PE', 'Perú', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (174, 'PN', 'Islas Pitcairn', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (175, 'PF', 'Polinesia Francesa', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (176, 'PL', 'Polonia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (177, 'PT', 'Portugal', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (178, 'PR', 'Puerto Rico', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (179, 'QA', 'Qatar', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (180, 'GB', 'Reino Unido', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (181, 'RE', 'Reunión', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (182, 'RW', 'Ruanda', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (183, 'RO', 'Rumania', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (184, 'RU', 'Rusia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (185, 'EH', 'Sahara Occidental', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (186, 'SB', 'Islas Salomón', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (187, 'WS', 'Samoa', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (188, 'AS', 'Samoa Americana', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (189, 'KN', 'San Cristóbal y Nevis', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (190, 'SM', 'San Marino', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (191, 'PM', 'San Pedro y Miquelón', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (192, 'VC', 'San Vicente y las Granadinas', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (193, 'SH', 'Santa Helena', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (194, 'LC', 'Santa Lucía', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (195, 'ST', 'Santo Tomé y Príncipe', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (196, 'SN', 'Senegal', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (197, 'CS', 'Serbia y Montenegro', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (198, 'SC', 'Seychelles', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (199, 'SL', 'Sierra Leona', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (200, 'SG', 'Singapur', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (201, 'SY', 'Siria', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (202, 'SO', 'Somalia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (203, 'LK', 'Sri Lanka', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (204, 'SZ', 'Suazilandia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (205, 'ZA', 'Sudáfrica', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (206, 'SD', 'Sudán', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (207, 'SE', 'Suecia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (208, 'CH', 'Suiza', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (209, 'SR', 'Surinam', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (210, 'SJ', 'Svalbard y Jan Mayen', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (211, 'TH', 'Tailandia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (212, 'TW', 'Taiwán', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (213, 'TZ', 'Tanzania', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (214, 'TJ', 'Tayikistán', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (215, 'IO', 'Territorio Británico del Océano Índico', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (216, 'TF', 'Territorios Australes Franceses', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (217, 'TL', 'Timor Oriental', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (218, 'TG', 'Togo', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (219, 'TK', 'Tokelau', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (220, 'TO', 'Tonga', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (221, 'TT', 'Trinidad y Tobago', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (222, 'TN', 'Túnez', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (223, 'TC', 'Islas Turcas y Caicos', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (224, 'TM', 'Turkmenistán', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (225, 'TR', 'Turquía', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (226, 'TV', 'Tuvalu', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (227, 'UA', 'Ucrania', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (228, 'UG', 'Uganda', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (229, 'UY', 'Uruguay', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (230, 'UZ', 'Uzbekistán', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (231, 'VU', 'Vanuatu', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (232, 'VE', 'Venezuela', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (233, 'VN', 'Vietnam', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (234, 'VG', 'Islas Vírgenes Británicas', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (235, 'VI', 'Islas Vírgenes de los Estados Unidos', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (236, 'WF', 'Wallis y Futuna', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (237, 'YE', 'Yemen', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (238, 'DJ', 'Yibuti', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (239, 'ZM', 'Zambia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (240, 'ZW', 'Zimbabue', '2025-03-23 16:37:41.316767');


--
-- TOC entry 4941 (class 0 OID 41435)
-- Dependencies: 224
-- Data for Name: genders; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.genders (id, gender_name, create_at) VALUES (1, 'Masculino', '2025-03-23 16:37:41.316767');
INSERT INTO public.genders (id, gender_name, create_at) VALUES (2, 'Femenino', '2025-03-23 16:37:41.316767');
INSERT INTO public.genders (id, gender_name, create_at) VALUES (3, 'Otro', '2025-03-23 16:37:41.316767');


--
-- TOC entry 4935 (class 0 OID 41385)
-- Dependencies: 218
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.groups (id, name, description) VALUES (1, 'admin', 'Administrador');
INSERT INTO public.groups (id, name, description) VALUES (2, 'manager', 'Gestor');
INSERT INTO public.groups (id, name, description) VALUES (3, 'technical', 'Técnico');
INSERT INTO public.groups (id, name, description) VALUES (4, 'members', 'Usuario');


--
-- TOC entry 4947 (class 0 OID 41467)
-- Dependencies: 230
-- Data for Name: login_attempts; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4943 (class 0 OID 41446)
-- Dependencies: 226
-- Data for Name: logs_activity; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4945 (class 0 OID 41456)
-- Dependencies: 228
-- Data for Name: nationality; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.nationality (id, code, name, create_at) VALUES (1, 'V', 'Venezolano', '2025-03-23 16:37:41.316767');
INSERT INTO public.nationality (id, code, name, create_at) VALUES (2, 'E', 'Extranjero', '2025-03-23 16:37:41.316767');


--
-- TOC entry 4952 (class 0 OID 41491)
-- Dependencies: 235
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4933 (class 0 OID 41358)
-- Dependencies: 216
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users (id, ip_address, username, password, email, activation_selector, activation_code, forgotten_password_selector, forgotten_password_code, forgotten_password_time, remember_selector, remember_code, created_on, last_login, active, first_name, middle_name, first_last_name, second_last_name, gender, nationality, photo, company, phone) VALUES (1, '127.0.0.1', 'gmeneses', '$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA', 'gmeneses@youdomain.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1744672199, 1747394387, 1, 'Gonzalo', 'Rafael', 'Meneses', 'Arias', 1, 1, 'assets/profiles/8262447.jpg', 'Sigesot', '04241733239');
INSERT INTO public.users (id, ip_address, username, password, email, activation_selector, activation_code, forgotten_password_selector, forgotten_password_code, forgotten_password_time, remember_selector, remember_code, created_on, last_login, active, first_name, middle_name, first_last_name, second_last_name, gender, nationality, photo, company, phone) VALUES (2, '127.0.0.1', 'admin', '$argon2i$v=19$m=16384,t=4,p=2$T1FNUldJVkxRa0RPQm1IMw$wUNfSCnyEjR/MyBcYRwn8wOq3b1ECTi70Z9BMAl9150', 'admin@test.asdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1744704711, NULL, 1, 'Rafael', 'Antonio', 'Pinto', 'Perez', 1, 1, 'assets/profiles/default.png', 'Sigesot', '04245556633');
INSERT INTO public.users (id, ip_address, username, password, email, activation_selector, activation_code, forgotten_password_selector, forgotten_password_code, forgotten_password_time, remember_selector, remember_code, created_on, last_login, active, first_name, middle_name, first_last_name, second_last_name, gender, nationality, photo, company, phone) VALUES (3, '127.0.0.1', 'gestor', '$argon2i$v=19$m=16384,t=4,p=2$T1FNUldJVkxRa0RPQm1IMw$wUNfSCnyEjR/MyBcYRwn8wOq3b1ECTi70Z9BMAl9150', 'gestor@asdf.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1745026130, NULL, 1, 'María', 'Antonia', 'Pacheco', 'Mejías', 2, 1, 'assets/profiles/default.png', 'Sigesot', '04147896541');


--
-- TOC entry 4939 (class 0 OID 41408)
-- Dependencies: 222
-- Data for Name: siteconfig; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.siteconfig (id, name, description, address, state, country, postcode, telephone, rif, logo, author, list_limit, mailfrom, fromname, metadesc, metakey, offline, offline_message, created_at, created_user_id, updated_at, updated_user_id, deleted_at, version) VALUES (1, 'Sigesot', 'Sistema de gestión para solicitud de soporte técnico a las áreas.', 'AQUI LA DIRECCIÓN', 1, 232, 1012, '02125556677', 'G0000000000', 'assets/images/brand/logo.svg', 'OTIC', 20, 'otic@susitio.com', 'EMPRESA', 'EMPRESA :: SIGESOT', 'VENEZUELA,SOCIALISMO,TECNOLOGÍA,SOPORTE', 0, 'El sistema se encuentra en este momento cerrado por tareas de mantenimiento.<br/>Por favor, inténtelo nuevamente más tarde.', '2025-03-23 16:37:41.316767', 1, NULL, NULL, NULL, '1.0');


--
-- TOC entry 4949 (class 0 OID 41475)
-- Dependencies: 232
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.states (id, state, create_at) VALUES (1, 'Dtto. Capital', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (2, 'Edo. Anzoátegui', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (3, 'Edo. Apure', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (4, 'Edo. Aragua', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (5, 'Edo. Barinas', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (6, 'Edo. Bolívar', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (7, 'Edo. Carabobo', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (8, 'Edo. Cojedes', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (9, 'Edo. Falcón', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (10, 'Edo. Guárico', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (11, 'Edo. Lara', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (12, 'Edo. Mérida', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (13, 'Edo. Miranda', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (14, 'Edo. Monagas', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (16, 'Edo. Portuguesa', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (15, 'Edo. Nueva Esparta', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (17, 'Edo. Sucre', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (18, 'Edo. Táchira', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (19, 'Edo. Trujillo', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (20, 'Edo. Yaracuy', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (21, 'Edo. Zulia', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (22, 'Edo. Amazonas', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (23, 'Edo. Delta Amacuro', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (24, 'Edo. La Guaira', '2025-03-23 16:37:41.316767');


--
-- TOC entry 4937 (class 0 OID 41394)
-- Dependencies: 220
-- Data for Name: users_groups; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users_groups (id, user_id, group_id) VALUES (1, 1, 1);
INSERT INTO public.users_groups (id, user_id, group_id) VALUES (2, 1, 2);
INSERT INTO public.users_groups (id, user_id, group_id) VALUES (3, 1, 3);
INSERT INTO public.users_groups (id, user_id, group_id) VALUES (4, 1, 4);
INSERT INTO public.users_groups (id, user_id, group_id) VALUES (5, 2, 2);
INSERT INTO public.users_groups (id, user_id, group_id) VALUES (6, 2, 3);
INSERT INTO public.users_groups (id, user_id, group_id) VALUES (7, 3, 3);
INSERT INTO public.users_groups (id, user_id, group_id) VALUES (8, 3, 4);


--
-- TOC entry 4958 (class 0 OID 0)
-- Dependencies: 233
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.countries_id_seq', 241, false);


--
-- TOC entry 4959 (class 0 OID 0)
-- Dependencies: 223
-- Name: genders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.genders_id_seq', 4, false);


--
-- TOC entry 4960 (class 0 OID 0)
-- Dependencies: 217
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.groups_id_seq', 5, false);


--
-- TOC entry 4961 (class 0 OID 0)
-- Dependencies: 229
-- Name: login_attempts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.login_attempts_id_seq', 1, false);


--
-- TOC entry 4962 (class 0 OID 0)
-- Dependencies: 225
-- Name: logs_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.logs_activity_id_seq', 1, false);


--
-- TOC entry 4963 (class 0 OID 0)
-- Dependencies: 227
-- Name: nationality_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.nationality_id_seq', 3, false);


--
-- TOC entry 4964 (class 0 OID 0)
-- Dependencies: 221
-- Name: siteconfig_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.siteconfig_id_seq', 2, false);


--
-- TOC entry 4965 (class 0 OID 0)
-- Dependencies: 231
-- Name: states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.states_id_seq', 25, false);


--
-- TOC entry 4966 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_groups_id_seq', 8, true);


--
-- TOC entry 4967 (class 0 OID 0)
-- Dependencies: 215
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


-- Completed on 2025-06-01 16:31:49

--
-- PostgreSQL database dump complete
--

