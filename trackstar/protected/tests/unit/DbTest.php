<?php

$yii=dirname(__FILE__).'/../../../../framework/yii.php';
require_once($yii);
//require_once ('AotuloadForUnitTest.php');

class DbTest extends \PHPUnit\Framework\TestCase
{
    public function testConnection()
    {
        $this->assertNotEquals(Null,Yii::app()->db);
    }
}