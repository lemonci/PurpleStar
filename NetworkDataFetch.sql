/* Non-kin association relationships, result: 119054 lines*/
SELECT c_personid AS personA, c_assoc_id AS personB, c_assoc_code from assoc_data
    WHERE
    personA IN (
        SELECT c_personid FROM biog_main WHERE c_index_year <= 1912 AND c_index_year >= 618);
        
/* Kin relationships, result: 399079 lines */
SELECT c_personid AS personA, c_kin_id AS personB, c_kin_code from kin_data
    WHERE
    personA IN (
        SELECT c_personid FROM biog_main WHERE c_index_year <= 1912 AND c_index_year >= 618);

/* Kin direct relationships ONLY , result: 193107 lines */
SELECT c_personid AS personA, c_kin_id AS personB, c_kin_code from kin_data
    WHERE
    personA IN (
        SELECT c_personid FROM biog_main WHERE c_index_year <= 1912 AND c_index_year >= 618)
    AND
    c_kin_code IN (75, 82, 107, 111, 135, 138, 163, 168, 176, 180, 182, 183, 184, 185, 186, 188, 191, 193, 194, 195, 196, 198, 199, 202, 204, 205, 206, 207, 211, 212, 213, 220, 221, 222, 226, 227, 229, 230, 231, 234, 235, 307, 326, 327, 329, 334, 335, 339, 343, 344, 363, 373, 377, 378, 420, 436, 437, 439, 440, 450, 451, 452, 453, 454, 455, 456, 457, 458, 467, 468, 559, 560, 575);
