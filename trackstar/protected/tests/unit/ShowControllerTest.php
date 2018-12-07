<?php

//require_once ('../../vendor/autoload.php'); //add the dependent pakages of composer
require_once ('../../controllers/ShowController.php'); 

class ShowControllerTest extends \PHPUnit\Framework\TestCase{
    
    public function testShowMoney(){
        $unit=new \service\ShowController();
        $this->assertEquals(1, $unit->showMoney());
        
    }
}




