USE cfml;

CREATE TABLE test (
    id INT NOT NULL,
    value VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,

    PRIMARY KEY (id)
) ENGINE=InnoDB;

INSERT INTO test (id, value)
VALUES
    (101, 'Test row 1'),
    (102, 'Test row 2')
;

ALTER TABLE test MODIFY COLUMN id INT auto_increment;
