<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "proc";
$conectar = new mysqli($servername, $username, $password, $dbname);
if ($conectar->connect_error) {
    die("Problemas ao conectar: " . $conectar->connect_error);
}
$searchValue = $_GET['search'];
$sql = "SELECT p.nome, COUNT(f.id) AS filhos
        FROM pessoas AS p
        LEFT JOIN filhos AS f ON p.id = f.pessoas_id
        WHERE p.nome LIKE '%$searchValue%'
        GROUP BY p.id";
// - https://www.w3schools.com/sql/
$result = $conectar->query($sql);
$results = array();
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $results[] = array(
            "nome" => $row["nome"],
            "filhos" => $row["filhos"]
        );
    }
    if ($result->num_rows > 5) {
        $results = array_slice($results, 0, 5); 
        $results[] = array(
            "nome" => "", 
            "filhos" => ""
        );
    }
}
$conectar->close();
$response = array(
    "results" => $results
);
header('Content-Type: application/json');
echo json_encode($response);
?>
