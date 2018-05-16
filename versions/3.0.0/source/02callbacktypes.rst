The callbacks
===============

As mentioned previously, the communication between your app and the SDK will be made through a single entry point, the **ComplianceSDK** and the return response will be in a form of a **callback**.

This callback will be as an **interface models** that can be of the type:

* **IModel**
* **IError**

The IModel
----------

Most of the callbacks of the Kids Web Service SDK will have an **interface model** that you'll be able retrieve information from.

These will be explained in more details in the description of each functionality but, as an example, let's look at the usage of **IRandomUsernameModel** when generating a random username.

This will be using the **IUsernameService** interface service briefly mentioned in the previous page.

.. code-block:: java

	val myEnvironment = MyEnvironment() //your environment
	val sdk = ComplianceSDK(myEnvironment)
	val usernameService = sdk.getService(IUsernameService::class.java)

	usernameService?.getRandomUsername { model, error ->

	    if (model != null) {
	        //Success! We have a 'model we can use. Let's get the username
	        val myGeneratedRandomUsername = model.randomUsername
	    } else {
	        //Uh-oh! It seems there's an error...
	    }	   
	}

The **IRandomUsernameModel** will be explained better and with more detail in it's appropriate page, but in this snippet we can see that when the **model** is not null, we can access the property **randomUsername** that will be your random generated username for that method call.

What about in the eventuality of something going wrong? Fear nothing: enter **IError** models.

The IError
----------

When something goes wrong while using the Kids Web Services functionalities, an error will be presented in the callback. This error can be due to multiple things and the SDK will be ready to catch the issue, providing informative data so you can respond in the best possible way to the different outcomes.

This error response is in a form of a KWS **IErrorWrapperModel** - as the name suggests, this will be a wrapper around the errors that can occur.

The **IErrorWrapperModel** object has the following fields:

=========== ======================= ==========
Field 		Type 					Meaning
=========== ======================= ==========
code 		Integer  				The error code, optional value
codeMeaning String 				   	The code meaning, optional value
invalid     IInvalidTypeErrorModel 	The invalid wrapper object, optional value
message 	String 				   	The error message, optional value
error 		String 				   	A different type of error, optional value
errorCode 	String 				   	A different type of error code, optional value
=========== ======================= ==========

The **IInvalidTypeErrorWrapperModel** object has the following fields:

=============== ============ ========
Field  			Type     	 Meaning
=============== ============ ========
password        IErrorModel  The invalid type of 'password', optional value
username        IErrorModel  The invalid type of 'username', optional value
addressCountry 	IErrorModel  The invalid type of 'addressCountry', optional value
addressPostCode IErrorModel  The invalid type of 'addressPostCode', optional value
addressStreet 	IErrorModel  The invalid type of 'addressStreet', optional value
country         IErrorModel  The invalid type of 'country', optional value
dateOfBirth 	IErrorModel  The invalid type of 'dateOfBirth', optional value
oauthClientId 	IErrorModel  The invalid type of 'oauthClientId', optional value
parentEmail 	IErrorModel  The invalid type of 'parentEmail', optional value
permissions 	IErrorModel  The invalid type of 'permissions', optional value
=============== ============ ========

The **IErrorModel** object has the following fields:

=========== ======== ========
Field 		Type     Meaning
=========== ======== ========
message     String 	 The message of the invalid type, optional value
code        Integer  The code of the invalid type, optional value
codeMeaning String   The codeMeaning of the invalid type, optional value
=========== ======== ========

As you can see, the error models contain **optional fields**. This is by desing and to help handling the different errors that can occur in a graceful way, splitting them by layers of details that are easier to manage.

We will now see an example of an actual error and our suggestion on how to deal with it:

.. code-block:: java

	val myEnvironment = MyEnvironment() //your environment
	val complianceSDK = ComplianceSDK(myEnvironment) //initialize the ComplianceSDK class
	val myService = complianceSDK.getService(type = IMyService::class.java) //get the 'IService' with desired functionalities


	myService.methodCall(){ error ->
	  //this is the response callback that will have an 'error'

	  if(error == null){
		//Success!!! All went well.
	  } else {
	    //Uh-oh! It seems there's an error...

	    val errorWrapperModel = error as ErrorWrapperModel
	    //use the new error model accordingly
	  }
	}