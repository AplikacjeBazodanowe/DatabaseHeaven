<?php
class DB
{
    /**Instancja klasy mysqli - reprezentuje połączenie z bazą danych*/
    private static $db;    
    
    /**Metoda łącząca z bazą danych, jeśli jest taka potrzeba*/
    public static function connect()
    {
        if(!self::$db)
        {
            @self::$db=new mysqli('localhost','DBUser','jakieshaslo','databaseheaven');
            if(mysqli_connect_errno())
            {
                self::$db=NULL;                
                throw new Exception ("Nie można połączyć z bazą danych serwera");                
            }
            self::$db->query("SET NAMES 'utf8'");  //ustawienie poprawnego kodowania znaków                                  
        }
    }
    
    /**Metoda wykonująca zadane zapytanie
     * @param $sql string z zapytaniem do wykonania
     */
    public static function query($sql)
    {                        
        if(!self::$db)
        {            
            throw new Exception ("Nie można wykonać zapytania. Nie ma połączenia z bazą danych");
        }
        $result=self::$db->query($sql);
        if(self::$db->error)
            throw new Exception (self::$db->error);
        else
            return $result;            
    }
    
    /**Metoda, która zamyka bazę danych, jeżeli można*/
    public static function close()
    {
        if(self::$db)        
            self::$db->close();                    
    }        
    
    /**Dodaje ukośniki przed znakami specjalnymi SQL-a w podanym stringu
     * @param $str string do wyescape'owania
     */
    public static function escape($str)
    {
        if(self::$db)
            return self::$db->real_escape_string($str);
        else 
            return $str;
    }
}