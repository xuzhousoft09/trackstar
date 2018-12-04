<?php

require_once ('AotuloadForUnitTest.php');

class IssueTest extends \PHPUnit\Framework\TestCase
{
    public function testgetTypeOptions()
{
    $options=Issue::model()->getTypeOptions;
    $this->assertTrue(is_array($options));
    $this->assertTure(3==count($options) );
    $this->assertTrue(in_array('Bug',$options));
    $this->assertTrue(in_array('Feature',$options));
    $this->assertTrue(in_array('Task',$options));
}
}