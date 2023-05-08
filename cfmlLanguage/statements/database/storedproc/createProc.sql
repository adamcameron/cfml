DELIMITER ;;
CREATE PROCEDURE test_timeout()
BEGIN
    declare i INT default 0;
    SET i = 1;

	WHILE i <= 10 DO
		INSERT INTO test (value) values (CONCAT('Proc test row ', i, ' @ ', TIME(NOW())));
		SELECT SLEEP(1);
		SET i = i + 1;
	END WHILE;
END ;;
