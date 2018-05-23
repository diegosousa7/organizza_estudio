<?php
class Database {
	private static $dbName = 'organizzaestudio';
	private static $dbHost = 'localhost';
	private static $dbUsername = 'root';
	private static $dbUserPassword = '';
	private static $cont = null;
	
	// Construtor da classe Database
	public function __contruct() {
		die ( 'Inicialização da classe construtora não é permitida' );
	}
	// Função principal da classe
	public static function conectar() {
		// Conexão Única para toda aplicação
		if (null == self::$cont) {
			try {
				self::$cont = new PDO ( "mysql:host=" . self::$dbHost . ";" . "dbname=" . self::$dbName, self::$dbUsername, self::$dbUserPassword );
			} catch ( PDOException $e ) {
				die ( $e->getMessage () );
			}
		}
		return self::$cont;
	}
	public static function disconnect() {
		self::$cont = null;
	}
}
?>