<?php

namespace Ggj\BancoDeDados\Source\Database;

use PDO;
use PDOException;

class Connect
{
    private const HOST = "localhost";
    private const PORT = 5432;
    private const USER = "";
    private const DBNAME = "dcc060_banco_de_dados";
    private const PASSWD = "";

    private const OPTIONS = [
        //PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8",
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_OBJ,
        PDO::ATTR_CASE => PDO::CASE_NATURAL
    ];

    private static $instance;

    /**
     * @return PDO
     */
    public static function getInstance(): PDO
    {
        if(empty(self::$instance)) {
            try {
                self::$instance = new PDO(
                    "pgsql:dbname=" . self::DBNAME . ";host=" . self::HOST . ";port=" . self::PORT,
                    self::USER,
                    self::PASSWD,
                    self::OPTIONS
                );
            } catch (PDOException $exception) {
                die(var_dump($exception->getMessage()));
            }
        }

        return self::$instance;
    }

    final public function __construct()
    {
    }

    final public function __clone(): void
    {
    }
}