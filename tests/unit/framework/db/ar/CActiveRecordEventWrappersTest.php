<?php

Yii::import('system.db.CDbConnection');
Yii::import('system.db.ar.CActiveRecord');

if(!defined('SRC_DB_FILE'))
	define('SRC_DB_FILE',dirname(__FILE__).'/../data/source.db');
if(!defined('TEST_DB_FILE'))
	define('TEST_DB_FILE',dirname(__FILE__).'/../data/test.db');

require_once(dirname(__FILE__).'/../data/models.php');

class CActiveRecordEventWrappersTest extends CTestCase
{
	private $db;

	public function setUp()
	{
		if(!extension_loaded('pdo') || !extension_loaded('pdo_sqlite'))
			$this->markTestSkipped('PDO and SQLite extensions are required.');
		copy(SRC_DB_FILE,TEST_DB_FILE);

		$config=array(
			'basePath'=>dirname(__FILE__),
			'components'=>array(
				'db'=>array(
					'class'=>'system.db.CDbConnection',
					'connectionString'=>'sqlite:'.TEST_DB_FILE,
				),
			),
		);
		$app=new TestApplication($config);
		$app->db->active=true;
		CActiveRecord::$db=$this->db=$app->db;

		UserWithWrappers::clearCounters();
		PostWithWrappers::clearCounters();
		CommentWithWrappers::clearCounters();
	}

	public function tearDown()
	{
		if($this->db)
			$this->db->active=false;
	}

	public function testBeforeFind()
	{
		UserWithWrappers::model()->find();
		$this->assertEquals(UserWithWrappers::getCounter('beforeFind'),1);
		UserWithWrappers::model()->findByAttributes(array('username'=>'user1'));
		$this->assertEquals(UserWithWrappers::getCounter('beforeFind'),1);
		UserWithWrappers::model()->findByPk(1);
		$this->assertEquals(UserWithWrappers::getCounter('beforeFind'),1);
		UserWithWrappers::model()->findBySql('SELECT * FROM users');
		$this->assertEquals(UserWithWrappers::getCounter('beforeFind'),1);
		UserWithWrappers::model()->findAll();
		$this->assertEquals(UserWithWrappers::getCounter('beforeFind'),1);
		UserWithWrappers::model()->findAllByAttributes(array('username'=>'user1'));
		$this->assertEquals(UserWithWrappers::getCounter('beforeFind'),1);
		UserWithWrappers::model()->findAllByPk(1);
		$this->assertEquals(UserWithWrappers::getCounter('beforeFind'),1);
		UserWithWrappers::model()->findAllBySql('SELECT * FROM users');
		$this->assertEquals(UserWithWrappers::getCounter('beforeFind'),1);
	}

	public function testBeforeFindRelationalEager()
	{
		UserWithWrappers::model()->with('posts.comments')->find();
		$this->assertEquals(UserWithWrappers::getCounter('beforeFind'),1);
		$this->assertEquals(PostWithWrappers::getCounter('beforeFind'),1);
		$this->assertEquals(CommentWithWrappers::getCounter('beforeFind'),1);
		UserWithWrappers::model()->with('posts.comments')->findByAttributes(array('username'=>'user1'));
		$this->assertEquals(UserWithWrappers::getCounter('beforeFind'),1);
		$this->assertEquals(PostWithWrappers::getCounter('beforeFind'),1);
		$this->assertEquals(CommentWithWrappers::getCounter('beforeFind'),1);
		UserWithWrappers::model()->with('posts.comments')->findByPk(1);
		$this->assertEquals(UserWithWrappers::getCounter('beforeFind'),1);
		$this->assertEquals(PostWithWrappers::getCounter('beforeFind'),1);
		$this->assertEquals(CommentWithWrappers::getCounter('beforeFind'),1);
		UserWithWrappers::model()->with('posts.comments')->findBySql('SELECT * FROM users');
		$this->assertEquals(UserWithWrappers::getCounter('beforeFind'),1);
		$this->assertEquals(PostWithWrappers::getCounter('beforeFind'),1);
		$this->assertEquals(CommentWithWrappers::getCounter('beforeFind'),1);
		UserWithWrappers::model()->with('posts.comments')->findAll();
		$this->assertEquals(UserWithWrappers::getCounter('beforeFind'),1);
		$this->assertEquals(PostWithWrappers::getCounter('beforeFind'),1);
		$this->assertEquals(CommentWithWrappers::getCounter('beforeFind'),1);
		UserWithWrappers::model()->with('posts.comments')->findAllByAttributes(array('username'=>'user1'));
		$this->assertEquals(UserWithWrappers::getCounter('beforeFind'),1);
		$this->assertEquals(PostWithWrappers::getCounter('beforeFind'),1);
		$this->assertEquals(CommentWithWrappers::getCounter('beforeFind'),1);
		UserWithWrappers::model()->with('posts.comments')->findAllByPk(1);
		$this->assertEquals(UserWithWrappers::getCounter('beforeFind'),1);
		$this->assertEquals(PostWithWrappers::getCounter('beforeFind'),1);
		$this->assertEquals(CommentWithWrappers::getCounter('beforeFind'),1);
		UserWithWrappers::model()->with('posts.comments')->findAllBySql('SELECT * FROM users');
		$this->assertEquals(UserWithWrappers::getCounter('beforeFind'),1);
		$this->assertEquals(PostWithWrappers::getCounter('beforeFind'),1);
		$this->assertEquals(CommentWithWrappers::getCounter('beforeFind'),1);
	}

	public function testBeforeFindRelationalLazy()
	{
		$user=UserWithWrappers::model()->find();
		$user->posts;
		$this->assertEquals(UserWithWrappers::getCounter('beforeFind'),1);
		$this->assertEquals(PostWithWrappers::getCounter('beforeFind'),1);
		$user=UserWithWrappers::model()->find();
		$user->posts(array('with'=>'comments'));
		$this->assertEquals(UserWithWrappers::getCounter('beforeFind'),1);
		$this->assertEquals(PostWithWrappers::getCounter('beforeFind'),1);
		$this->assertEquals(CommentWithWrappers::getCounter('beforeFind'),1);
	}

	public function testAfterFind()
	{
		UserWithWrappers::model()->find();
		$this->assertEquals(UserWithWrappers::getCounter('afterFind'),1);
		UserWithWrappers::model()->findByAttributes(array('username'=>'user1'));
		$this->assertEquals(UserWithWrappers::getCounter('afterFind'),1);
		UserWithWrappers::model()->findByPk(1);
		$this->assertEquals(UserWithWrappers::getCounter('afterFind'),1);
		UserWithWrappers::model()->findBySql('SELECT * FROM users');
		$this->assertEquals(UserWithWrappers::getCounter('afterFind'),1);
		UserWithWrappers::model()->findAll();
		$this->assertEquals(UserWithWrappers::getCounter('afterFind'),4);
		UserWithWrappers::model()->findAllByAttributes(array('username'=>'user1'));
		$this->assertEquals(UserWithWrappers::getCounter('afterFind'),1);
		UserWithWrappers::model()->findAllByPk(1);
		$this->assertEquals(UserWithWrappers::getCounter('afterFind'),1);
		UserWithWrappers::model()->findAllBySql('SELECT * FROM users');
		$this->assertEquals(UserWithWrappers::getCounter('afterFind'),4);
	}

	public function testAfterFindRelational()
	{
		UserWithWrappers::model()->with('posts.comments')->find();
		$this->assertEquals(UserWithWrappers::getCounter('afterFind'),4);
		$this->assertEquals(PostWithWrappers::getCounter('afterFind'),5);
		$this->assertEquals(CommentWithWrappers::getCounter('afterFind'),10);
		UserWithWrappers::model()->with('posts.comments')->findByAttributes(array('username'=>'user2'));
		$this->assertEquals(UserWithWrappers::getCounter('afterFind'),1);
		$this->assertEquals(PostWithWrappers::getCounter('afterFind'),3);
		$this->assertEquals(CommentWithWrappers::getCounter('afterFind'),6);
		UserWithWrappers::model()->with('posts.comments')->findByPk(2);
		$this->assertEquals(UserWithWrappers::getCounter('afterFind'),1);
		$this->assertEquals(PostWithWrappers::getCounter('afterFind'),3);
		$this->assertEquals(CommentWithWrappers::getCounter('afterFind'),6);
		UserWithWrappers::model()->with('posts.comments')->findBySql('SELECT * FROM users WHERE id=2');
		$this->assertEquals(UserWithWrappers::getCounter('afterFind'),1);
		$this->assertEquals(PostWithWrappers::getCounter('afterFind'),3);
		$this->assertEquals(CommentWithWrappers::getCounter('afterFind'),6);
		UserWithWrappers::model()->with('posts.comments')->findAll();
		$this->assertEquals(UserWithWrappers::getCounter('afterFind'),4);
		$this->assertEquals(PostWithWrappers::getCounter('afterFind'),5);
		$this->assertEquals(CommentWithWrappers::getCounter('afterFind'),10);
		UserWithWrappers::model()->with('posts.comments')->findAllByAttributes(array('username'=>'user2'));
		$this->assertEquals(UserWithWrappers::getCounter('afterFind'),1);
		$this->assertEquals(PostWithWrappers::getCounter('afterFind'),3);
		$this->assertEquals(CommentWithWrappers::getCounter('afterFind'),6);
		UserWithWrappers::model()->with('posts.comments')->findAllByPk(2);
		$this->assertEquals(UserWithWrappers::getCounter('afterFind'),1);
		$this->assertEquals(PostWithWrappers::getCounter('afterFind'),3);
		$this->assertEquals(CommentWithWrappers::getCounter('afterFind'),6);
		UserWithWrappers::model()->with('posts.comments')->findAllBySql('SELECT * FROM users');
		$this->assertEquals(UserWithWrappers::getCounter('afterFind'),4);
		$this->assertEquals(PostWithWrappers::getCounter('afterFind'),5);
		$this->assertEquals(CommentWithWrappers::getCounter('afterFind'),10);
	}
}