        <?php
        
        class IssueController extends Controller
        {
        
            public $layout = '//layouts/column2';
        
            private $_project = null;
        
            public function filters()
            {
                return array(
                    'accessControl', // perform access control for CRUD operations
                    'projectContext + create index admin'
                );
            }
        
            public function accessRules()
            {
                return array(
                    array(
                        'allow', // allow all users to perform 'index' and 'view' actions
                        'actions' => array(
                            'index',
                            'view'
                        ),
                        'users' => array(
                            '*'
                        )
                    ),
                    array(
                        'allow', // allow authenticated user to perform 'create' and 'update' actions
                        'actions' => array(
                            'create',
                            'update'
                        ),
                        'users' => array(
                            '@'
                        )
                    ),
                    array(
                        'allow', // allow admin user to perform 'admin' and 'delete' actions
                        'actions' => array(
                            'admin',
                            'delete'
                        ),
                        'users' => array(
                            'admin'
                        )
                    ),
                    array(
                        'deny', // deny all users
                        'users' => array(
                            '*'
                        )
                    )
                );
            }
        
            public function actionView($id)
            {
                $this->render('view', array(
                    'model' => $this->loadModel($id)
                ));
            }
        
            public function actionCreate()
            {
                $model = new Issue();
                $model->project_id = $this->_project->id;
        
                if (isset($_POST['Issue'])) {
                    /*
                     * var_dump($_POST['Issue']);
                     * exit;
                     */
                    $model->attributes = $_POST['Issue'];
                    if ($model->save())
                        $this->redirect(array(
                            'view',
                            'id' => $model->id
                        ));
                }
                $this->render('create', array(
                    'model' => $model
                ));
            }
        
            public function actionUpdate($id)
            {
                $model = $this->loadModel($id);
        
                $this->loadProject($model->project_id);
                $model->project_id = $this->_project->id;
                /*
                 * var_dump($this->_project->id);
                 * echo exit;
                 */
        
                if (isset($_POST['Issue'])) {
                    /*
                     * var_dump($_POST['Issue']);
                     * exit;
                     */
                    $model->attributes = $_POST['Issue'];
                    if ($model->save())
                        $this->redirect(array(
                            'view',
                            'id' => $model->id
                        ));
                }
        
                $this->render('update', array(
                    'model' => $model
                ));
            }
        
            public function actionDelete($id)
            {
                if (Yii::app()->request->isPostRequest) {
                    // we only allow deletion via POST request
                    $this->loadModel($id)->delete();
        
                    // if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
                    if (! isset($_GET['ajax']))
                        $this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array(
                            'admin'
                        ));
                } else
                    throw new CHttpException(400, 'Invalid request. Please do not repeat this request again.');
            }
        
            public function actionIndex()
            {
                $dataProvider = new CActiveDataProvider('Issue', array(
                    'criteria' => array(
                        'condition' => 'project_id=:projectId',
                        'params' => array(
                            ':projectId' => $this->_project->id
                        )
                    )
                ));
                $this->render('index', array(
                    'dataProvider' => $dataProvider
                ));
            }
        
            public function actionAdmin()
            {
                $model = new Issue('search');
                $model->unsetAttributes(); // clear any default values
                if (isset($_GET['Issue']))
                    $model->attributes = $_GET['Issue'];
        
                $model->project_id = $this->_project->id;
        
                $this->render('admin', array(
                    'model' => $model
                ));
            }
        
            public function loadModel($id)
            {
                $model = Issue::model()->findByPk((int) $id);
                if ($model === null)
                    throw new CHttpException(404, 'The requested page does not exist.');
                return $model;
            }
        
            protected function performAjaxValidation($model)
            {
                if (isset($_POST['ajax']) && $_POST['ajax'] === 'issue-form') {
                    echo CActiveForm::validate($model);
                    Yii::app()->end();
                }
            }
        
            protected function loadProject($project_id)
            {
                // if the project property is null, create it based on input id
                if ($this->_project === null) {
                    $this->_project = Project::model()->findbyPk($project_id);
        
                    if ($this->_project === null) {
                        throw new CHttpException(404, 'The requested project does not
        exist.');
                    }
                }
                return $this->_project;
            }
        
            public function filterProjectContext($filterChain)
            {
                // set the project identifier based on either the GET or POST input
                // request variables, since we allow both types for our actions
                $projectId = null;
                if (isset($_GET['pid']))
                    $projectId = $_GET['pid'];
                else if (isset($_POST['pid']))
                    $projectId = $_POST['pid'];
                $this->loadProject($projectId);
                // complete the running of other filters and execute the requested action
                $filterChain->run();
            }
        
            public function getProject()
            {
                return $this->_project;
            }
        }
