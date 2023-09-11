<?php
    $command = escapeshellcmd('./getLoacationsData.py');
    $output = shell_exec($command);
    echo $output;
?>