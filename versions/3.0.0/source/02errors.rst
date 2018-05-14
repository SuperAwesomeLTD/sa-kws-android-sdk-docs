Error Responses
===============

Before going into a bit more detail to the usability of the SDK and the success responses, we will be covering the **Error** ones.

When something goes wrong while using the Kids Web Services functionalities, an error will be presented in the callback. This error can be due to multiple things and the SDK will be ready to catch the issue, providing with informative data so you can respond in the best possible way.

This error response is in a form of a KWS **IErrorWrapperModel** - as the name suggests, this will be a wrapper model around the **Throwable** type error we get back for all of the errors that can occur.

The **IErrorWrapperModel** object has the following fields:

=========== ======================= ==========
Field 		Type 					Meaning
=========== ======================= ==========
code 		Integer  				The error code, optional value
codeMeaning String 				   	The code meaning, optional value
invalid     IInvalidTypeErrorModel 	The error message, optional value
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

As you can see, the error models contain **optional fields**. This is by desing and to help handling the different errors that can occur in a gracefully way, splitting them by layers of details that are easier to manage.

We will now see an example of an actual error and our suggestion on how to deal with it.

.. code-block:: java

  myService.methodCall(){ error ->
      //this is the response callback that will have an 'error'
   
      if(error == null){
          //Success!!! All went well.
      } else {
          //Uh-oh! It seems there's an error...

          val errorWrapperModel = error as ErrorWrapperModel
		  when {
	          errorWrapperModel.message != null -> //print ${errorWrapperModel.message}
	          errorWrapperModel.codeMeaning != null -> // print ${errorWrapperModel.codeMeaning}
	          errorWrapperModel.error != null -> //print ${errorWrapperModel.error}
	          else -> //something else happened that we couldn't catch...
          }
      }
  }