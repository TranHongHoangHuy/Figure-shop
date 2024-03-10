<?php
class Characters
{
    private $db;

    public function __construct(PDO $pdo)
    {
        $this->db = $pdo;
    }

    public function getInfoCharacter($character_name)
    {
        $query = $this->db->prepare("SELECT * FROM Characters WHERE character_name = ?");
        $query->execute([$character_name]);
        return $query->fetch(PDO::FETCH_ASSOC);
    }
}
