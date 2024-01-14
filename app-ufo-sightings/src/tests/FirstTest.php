<?php declare(strict_types=1);

require __DIR__ . "/../public/index.php";
use PHPUnit\Framework\TestCase;

class FirstTest extends TestCase
{
    public function testRenderReturnsApplication(): void
    {
        $app = new Application;
        $expected = 'Application';
        $this->assertEquals($expected, $app->outputApplication("Application"));
        
//$initCheck = $app->outputApplication("Application");
//     echo $initCheck;
    }

}